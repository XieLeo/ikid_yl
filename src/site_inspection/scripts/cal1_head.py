#!/usr/bin/env python3

import cv2
import math
import numpy as np
import rospy
from robot_brain_pkg.msg import robot_head_pos
from sympy import symbols, Eq, solve, cos, sin
import time  # 导入时间模块

# 假设相机的内参矩阵和畸变系数已知
mtx = np.array([[689.54632603, 0, 308.1505513],
                [0, 689.8300701, 224.08638577],
                [0, 0, 1]])
dist = np.array([5.04206193e-02, 2.80078912e-01, -6.36533155e-04, -9.34988052e-04, -1.28779400e+00])

def calculate_dynamic_camera_height(h0, r, alpha_rad):
    """
    计算当前俯仰角下的相机高度 (毫米)。
    """
    return (h0 + r * math.cos(alpha_rad))   # 转换为毫米

def calculate_on_axis(H, beta, alpha):
    """
    计算目标在光轴上的世界坐标位置 (Xa, Ya) (毫米)。
    """
    if math.isclose(beta, 0.0):
        print("警告：俯仰角 beta 为零，无法计算具体的坐标位置。")
        return float('inf'), float('inf')

    Xa = (H * math.sin(alpha) / math.tan(beta))
    Ya = (H * math.cos(alpha) / math.tan(beta))
    return round(Xa, 2), round(Ya, 2)

def calculate_off_axis(H, f, beta, alpha, M, N, X_m, Z_m):
    """
    计算目标不在光轴上的世界坐标位置 (Xa, Ya) (毫米)。
    """
    X_a, Y_a = symbols('Xa Ya')

    eq1 = Eq(X_m, (f * (X_a * cos(alpha) - Y_a * sin(alpha))) / 
         (X_a * (cos(beta) * sin(alpha)) + Y_a * (cos(beta) * cos(alpha)) + H * sin(beta)) + M/2)

    eq2 = Eq(Z_m, (f * (-X_a * (sin(beta) * sin(alpha)) - Y_a * (sin(beta) * cos(alpha)) + H * cos(beta))) / 
         (X_a * (cos(beta) * sin(alpha)) + Y_a * (cos(beta) * cos(alpha)) + H * sin(beta)) + N/2)

    solution = solve((eq1, eq2), (X_a, Y_a))

    solution_mm = {key: round(float(value), 2) for key, value in solution.items() if value.is_real}

    return solution_mm

def control_head(neck_rotation_theta_angle, neck_front_swing_theta_angle):
    pub = rospy.Publisher('/ikid_robot/robot_head_pos_msg', robot_head_pos, queue_size=1)
    
    msg = robot_head_pos()
    msg.neck_rotation_theta = neck_rotation_theta_angle
    msg.neck_front_swing_theta = neck_front_swing_theta_angle
    
    pub.publish(msg)

def mouse_callback(event, x, y, flags, param):
    if event == cv2.EVENT_LBUTTONDOWN:
        # 获取当前时间作为起始时间
        start_time = time.time()

        # 获取当前的相机高度、俯仰角和偏摆角
        h1 = param['initial_camera_height']
        r = 60  # 杆的长度（毫米）
        fy = mtx[1, 1]  # 使用内参矩阵中的 fy
        neck_rotation_theta_angle = param['neck_rotation_theta_angle']
        neck_front_swing_theta_angle = param['neck_front_swing_theta_angle']

        # 动态计算相机高度
        print(f"相机高度: h={h1:.2f} mm")

        # 将像素坐标转换为以光心为原点的坐标
        cx = mtx[0, 2]
        cy = mtx[1, 2]
        x_centered = x - cx
        y_centered = y - cy

        print(f"x: {x:.2f} ，y: {y:.2f} ")
        print(f"cx: {cx:.2f} ，cy: {cy:.2f} ")
        print(f"x_centered: {x_centered:.2f} mm")
        print(f"y_centered: {y_centered:.2f} mm")

        # 检查目标在光轴上的情况
        if math.isclose(x_centered, 0, abs_tol=2) and math.isclose(y_centered, 0, abs_tol=2):
            Xa_on_axis, Ya_on_axis = calculate_on_axis(h1, neck_front_swing_theta_angle, neck_rotation_theta_angle)
            print(f"目标在光轴上的世界坐标位置: Xa = {Xa_on_axis:.2f} mm, Ya = {Ya_on_axis:.2f} mm")
        else:
            # 计算目标不在光轴上的情况
            solution_off_axis = calculate_off_axis(h1, fy, neck_front_swing_theta_angle, neck_rotation_theta_angle, 640, 480, x, y)
            print("目标不在光轴上的世界坐标位置:")
            for symbol, value in solution_off_axis.items():
                print(f"{symbol} = {value:.2f} mm")



        # 获取结束时间
        end_time = time.time()

        # 计算并打印运行时间
        processing_time = end_time - start_time
        print(f"测距处理时间: {processing_time:.4f} 秒")

def draw_crosshair_and_text(frame, cx, cy):
    cv2.drawMarker(frame, (int(cx), int(cy)), (0, 255, 0), markerType=cv2.MARKER_CROSS, 
                   markerSize=20, thickness=1)

rospy.init_node('head_control_node', anonymous=True)

cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)
if not cap.isOpened():
    print("无法打开摄像头")
    exit()

while not rospy.is_shutdown():
    ret, frame = cap.read()
    if not ret:
        print("无法获取摄像头帧")
        break

    h, w = frame.shape[:2]
    newcameramtx, roi = cv2.getOptimalNewCameraMatrix(mtx, dist, (w, h), 1, (w, h))
    frame = cv2.undistort(frame, mtx, dist, None, newcameramtx)

    cx = mtx[0, 2]
    cy = mtx[1, 2]
    
    draw_crosshair_and_text(frame, cx, cy)

    cv2.imshow("Camera", frame)

    with open("/home/nvidia/ikid_ws2/src/site_inspection/scripts/cal_head.txt", "r") as file:
        for _ in range(3):
            file.readline()
        initial_camera_height = float(file.readline().strip())
        neck_rotation_theta_angle = math.radians(float(file.readline().strip()))
        neck_front_swing_theta_angle = math.radians(float(file.readline().strip()))

    control_head(neck_rotation_theta_angle, neck_front_swing_theta_angle)

    params = {
        'frame': frame,
        'initial_camera_height': initial_camera_height,
        'neck_rotation_theta_angle': neck_rotation_theta_angle,
        'neck_front_swing_theta_angle': neck_front_swing_theta_angle
    }
    cv2.setMouseCallback("Camera", mouse_callback, param=params)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
