#!/usr/bin/env python3

import rospy
import math
import numpy as np
import sympy as sp  # 确保 sympy 已正确导入
from localization_pkg.msg import ObjectDetection, Detections  # 导入必要的消息类型
from realtime_detect_pkg.msg import image_points, all_image_points
from robot_brain_pkg.msg import robot_head_pos  # 用于控制头部
from enum import Enum
from sympy import symbols, Eq, solve, cos, sin

# 定义Python中的等效枚举
class WorldObjectType(Enum):
    Type_Circle = 0         # Center circle
    Type_Goal = 1           # Goal (center position)
    Type_GoalPost = 2       # A single goal post
    Type_XMarker = 3        # One of the two penalty markers
    Type_FieldLine = 4      # Field line
    Type_LineXingT = 5      # T-crossing of two lines
    Type_LineXingX = 6      # X-crossing of two lines
    Type_LineXingL = 7      # L-crossing of two lines

# 相机内参矩阵和畸变系数
mtx = np.array([[689.54632603, 0, 308.1505513],
                [0, 689.8300701, 224.08638577],
                [0, 0, 1]])

# 已知相机高度 (毫米) 和俯仰角 (弧度)
camera_height = 550  # 假设相机高度为550毫米
neck_rotation_theta_angle = 0  # 相机偏摆角（弧度）
neck_front_swing_theta_angle = math.radians(23)  # 相机俯仰角（弧度），假设23度

# 控制摄像头头部的函数
def control_head(neck_rotation_theta_angle, neck_front_swing_theta_angle):
    pub = rospy.Publisher('/ikid_robot/robot_head_pos_msg', robot_head_pos, queue_size=1)
    
    msg = robot_head_pos()
    msg.neck_rotation_theta = neck_rotation_theta_angle
    msg.neck_front_swing_theta = neck_front_swing_theta_angle
    
    pub.publish(msg)
    rospy.loginfo("Published head control: rotation = %.2f, front swing = %.2f", neck_rotation_theta_angle, neck_front_swing_theta_angle)

# 计算目标在光轴上的世界坐标位置
def calculate_on_axis(H, beta, alpha):
    if math.isclose(beta, 0.0):
        print("警告：俯仰角 beta 为零，无法计算具体的坐标位置。")
        return float('inf'), float('inf')

    Xa = (H * math.sin(alpha) / math.tan(beta))
    Ya = (H * math.cos(alpha) / math.tan(beta))
    return round(Xa, 2), round(Ya, 2)

# 计算目标不在光轴上的世界坐标位置
def calculate_off_axis(H, f, beta, alpha, M, N, X_m, Z_m):
    Xa, Ya = symbols('Xa Ya')

    eq1 = Eq(X_m, (f * (Xa * cos(alpha) - Ya * sin(alpha))) / 
         (Xa * (cos(beta) * sin(alpha)) + Ya * (cos(beta) * cos(alpha)) + H * sin(beta)) + M/2)

    eq2 = Eq(Z_m, (f * (-Xa * (sin(beta) * sin(alpha)) - Ya * (sin(beta) * cos(alpha)) + H * cos(beta))) / 
         (Xa * (cos(beta) * sin(alpha)) + Ya * (cos(beta) * cos(alpha)) + H * sin(beta)) + N/2)

    solution = solve((eq1, eq2), (Xa, Ya))
    solution_mm = {key: round(float(value.evalf()), 2) for key, value in solution.items() if value.is_real}

    return solution_mm

# 创建ObjectDetection消息
def create_object_detection(x, y, obj_type):
    object_msg = ObjectDetection()
    object_msg.pose.x = float(x)/1000  # 确保 x 是浮点数
    object_msg.pose.y = float(y)/1000  # 确保 y 是浮点数
    object_msg.pose.theta = 0.0  # 设置朝向
    object_msg.type = obj_type.value  # 使用枚举的值
    object_msg.confidence = 1  # 设置置信度
    return object_msg


# 回调函数，用于处理接收到的YOLO识别信息
def image_points_callback(msg):
    detections_msg = Detections()
    detections_msg.header.stamp = rospy.Time.now()
    detections_msg.header.frame_id = "base_link"

    # 对每类特征点分别处理
    for category, markers, obj_type in [
        ("ball", msg.ball_xyxy, WorldObjectType.Type_LineXingX),
        ("L_marker", msg.L_mark_xyxy, WorldObjectType.Type_LineXingL),
        ("T_marker", msg.T_mark_xyxy, WorldObjectType.Type_LineXingT),
        ("X_marker", msg.X_mark_xyxy, WorldObjectType.Type_LineXingX)]:

        for marker in markers:
            x1, y1, x2, y2 = marker.coordinates
            x_center = (x1 + x2) / 2
            y_center = (y1 + y2) / 2

            x_centered = x_center - mtx[0, 2]
            y_centered = y_center - mtx[1, 2]

            # 检查目标是在光轴上还是不在光轴上
            if math.isclose(x_centered, 0, abs_tol=2) and math.isclose(y_centered, 0, abs_tol=2):
                Xa_on_axis, Ya_on_axis = calculate_on_axis(camera_height, neck_front_swing_theta_angle, neck_rotation_theta_angle)
                print(f"目标在光轴上的世界坐标位置: Xa = {Xa_on_axis:.2f} mm, Ya = {Ya_on_axis:.2f} mm")
                object_msg = create_object_detection(Ya_on_axis, -Xa_on_axis, obj_type)
                detections_msg.objects.append(object_msg)
            else:
                solution_off_axis = calculate_off_axis(camera_height, mtx[1, 1], neck_front_swing_theta_angle, neck_rotation_theta_angle, 640, 480, x_center, y_center)
                print("目标不在光轴上的世界坐标位置:")
                for symbol, value in solution_off_axis.items():
                    print(f"{symbol} = {value:.2f} mm")
                    if symbol == symbols('Xa'):
                        Xa_off_axis_float = value
                    elif symbol == symbols('Ya'):
                        Ya_off_axis_float = value
                object_msg = create_object_detection(Ya_off_axis_float, -Xa_off_axis_float, obj_type)
                detections_msg.objects.append(object_msg)

    # 发布 Detections 消息
    detections_pub.publish(detections_msg)

# 初始化ROS节点
if __name__ == '__main__':
    rospy.init_node('distance_calculator', anonymous=True)

    # 控制摄像头头部朝向指定角度
    control_head(neck_rotation_theta_angle, neck_front_swing_theta_angle)
    
    # 创建发布者
    detections_pub = rospy.Publisher('/vision/detections', Detections, queue_size=1)

    # 创建订阅者
    rospy.Subscriber('chatter_image_points', all_image_points, image_points_callback,queue_size=1)

    rospy.spin()
