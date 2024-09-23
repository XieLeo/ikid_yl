#!/usr/bin/python3
#coding=UTF-8
import math
import time
import cv2
import numpy as np
import rospy
from site_inspection.msg import cmd_walk
from site_inspection.msg import robot_head_pos

# 图像预处理
def process_image(image):
    # # 将图像转换为HSV色彩空间
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

    # # 定义白色颜色范围
    lower_white = np.array([0, 0, 200])
    upper_white = np.array([255, 50, 255])

    # # 使用颜色阈值选择白色部分
    white_mask = cv2.inRange(hsv, lower_white, upper_white)

    # # 定义绿色颜色范围
    # lower_green = np.array([40, 40, 40])
    # upper_green = np.array([80, 255, 255])

    # # 使用颜色阈值选择绿色部分
    # green_mask = cv2.inRange(hsv, lower_green, upper_green)

    # # 合并白色和绿色部分的掩码
    # combined_mask = cv2.bitwise_or(white_mask, green_mask)

    # 将掩码应用到图像上，只保留白色部分
    # print(image.shape)
    # print(white_mask.shape)
    masked_image = cv2.bitwise_and(image, image, mask=white_mask)

    # 进行高斯模糊以降噪声
    gray = cv2.cvtColor(masked_image, cv2.COLOR_BGR2GRAY)
    blur = cv2.GaussianBlur(gray, (5, 5), 0)

    # 使用Canny边缘检测
    edges = cv2.Canny(blur, 50, 150)

    # 定义兴趣区域（ROI），通常为图像下半部分
    height, width = edges.shape
    roi_vertices = [(0, 480), (640 * 0.3, 480*0.8),
                    (640 * 0.7, 480*0.8), (640, 480)]
    mask = np.zeros_like(edges)
    cv2.fillPoly(mask, np.int32([roi_vertices]), 255)

    # 使用兴趣区域的掩码对Canny边缘进行遮盖
    masked_edges = cv2.bitwise_and(edges, mask)

    return edges


def perspective_warp(img, dst_size=(640, 480) ):
    src=np.float32([(0, 1), (0, 0.5), (1, 0.5), (1, 1)]),
    dst=np.float32([(0, 1), (0, 0), (1, 0), (1, 1)])
    img_size = np.float32([(img.shape[1], img.shape[0])])
    src = src * img_size
    dst = dst * np.float32(dst_size)
    M = cv2.getPerspectiveTransform(src, dst)
    warped = cv2.warpPerspective(img, M, dst_size)
    return warped


def inv_perspective_warp(img, dst_size=(640, 480)):
    src=np.float32([(0, 1), (0, 0), (1, 0), (1, 1)]),
    dst=np.float32([(0, 1), (0, 0.5), (1, 0.5), (1, 1)])
    img_size = np.float32([(img.shape[1], img.shape[0])])
    src = src * img_size
    dst = dst * np.float32(dst_size)
    M = cv2.getPerspectiveTransform(src, dst)
    warped = cv2.warpPerspective(img, M, dst_size)
    return warped


# 处理车道线
def process_lane_lines(perspective_image,frame):

    # 计算车道线拟合
    height, width = perspective_image.shape[:2]

    # bug: 只找图中左右像素，万一图中没有呢或者图太偏了呢,问题很严重
    left_lane = perspective_image[:, :width//2].nonzero()
    right_lane = perspective_image[:, width//2:].nonzero()

    #panduan xianxielv

    # 判断
    if ( not right_lane[0].all()) :
        right_y = right_lane[0]
        right_x = right_lane[1] + width // 2   
        right_param = np.polyfit(right_y, right_x, 2)
        slope = 2 * right_param[0] * np.mean(right_y) + right_param[1]
        steering_angle = slope - 0.19#*******************
        print(steering_angle)
        # if(steering_angle < 0) :
        #     print("pian you")
        #     steering_angle = steering_angle -0.19
        #     print(steering_angle)

    elif (not left_lane[0].all()):
        left_y = left_lane[0]
        left_x = left_lane[1] 
        left_param = np.polyfit(left_y, left_x, 2)
        slope = 2 * left_param[0] * np.mean(left_y) + left_param[1]
        steering_angle = slope + 0.19#*******************
        print(steering_angle)
        # if(steering_angle > 0) :
        #     print("pian zuo")
        #     steering_angle = steering_angle +0.19
        #     print(steering_angle)

        

    else:
        return 0,np.zeros(2)    

    if steering_angle >3.14 or steering_angle < -3.14:
        return 0,np.zeros(2)

    print(steering_angle)

    # # 绘制图像并显示偏转角度
    result_img = draw_lanes_with_steering_angle(frame, steering_angle, left_lane, right_lane)

    return steering_angle,result_img


def draw_lanes_with_steering_angle(img, steering_angle, left_lane, right_lane):
    color_img = np.zeros_like(img)

    # 计算车道线拟合
    height, width = perspective_image.shape[:2]

    # 获取左/右侧车道线像素的y坐标和x坐标
    left_y = left_lane[0]
    left_x = left_lane[1]
    right_y = right_lane[0]
    right_x = right_lane[1] + width // 2

    # 绘制左侧车道线（蓝色）
    for i in range(len(left_y)):
        cv2.circle(color_img, (int(left_x[i]), int(
            left_y[i])), 5, (255, 0, 0), -1)

    # 绘制右侧车道线（红色）
    for i in range(len(right_y)):
        cv2.circle(color_img, (int(right_x[i]), int(
            right_y[i])), 5, (0, 0, 255), -1)

    #  进行逆透视变换
    inv_color_img = inv_perspective_warp(color_img)

    # 添加偏转角度信息和斜率到图像左上角
    font = cv2.FONT_HERSHEY_SIMPLEX
    cv2.putText(inv_color_img, f'Steering Angle: {steering_angle:.2f} radians',
                (50, 100), font, 1, (255, 255, 255), 2, cv2.LINE_AA)

    # 将逆透视变换后的图像与原始图像叠加
    result_img = cv2.addWeighted(img, 1, inv_color_img, 0.7, 0)

    return result_img

# 处理图像并显示结果
if __name__ == "__main__":

    #ros发送
    rospy.init_node("china_north_inspection")

    pub_cmd_walk = rospy.Publisher("/cmd_walk", cmd_walk, queue_size=10)
    pub_robot_head_pos = rospy.Publisher("/ikid_robot/robot_head_pos_msg", robot_head_pos, queue_size=10) 

    # 打开摄像头捕捉
    cap = cv2.VideoCapture(0, cv2.CAP_V4L2)  # 0对应默认摄像头
    print("camera")
    

    #加入标志位
    steering_angle = 0

    # 设置ROS发布速率
    run_rate = 30
    rate = rospy.Rate(run_rate)

    p_cmd_walk = cmd_walk()
    p_robot_head_pos = robot_head_pos()

    p_robot_head_pos.neck_rotation_theta = 0
    p_robot_head_pos.neck_front_swing_theta = 0.6
    pub_robot_head_pos.publish(p_robot_head_pos)
    time.sleep(2)
    pub_robot_head_pos.publish(p_robot_head_pos)

    try:
        # 参数服务器获取步长步宽
        default_walk_length = rospy.get_param("/pid_amend/walk_length")
        default_walk_width = rospy.get_param("/pid_amend/walk_width")
        # default_walk_length = default_walk_length/2
    except KeyError:
        # 如果获取参数时出现异常，将默认值保留为0
        default_walk_length = 0
        default_walk_width = 0.12


    #发送cmd_walk的pub
    p_cmd_walk.sx = default_walk_length
    p_cmd_walk.sy = default_walk_width
    p_cmd_walk.var_theta = steering_angle
    p_cmd_walk.walk_with_ball = False
    p_cmd_walk.stop_walk = True

    start_time = time.time()# 计数器

    # p_cmd_walk.stop_walk = True#####
    p_cmd_walk.stop_walk = False#####机器人运动
    pub_cmd_walk.publish(p_cmd_walk)
    count = 0

    while not rospy.is_shutdown():
        print(count)
        count = count + 1
        end_time = time.time()
        # 从摄像头读取一帧
        ret, frame = cap.read()

        if not ret:
            # 如果无法读取帧，记录错误并退出循环
            rospy.logerr("Failed to capture a frame from the camera.")
            break
        
        cv2.imshow('Real Frame', frame)

        p_cmd_walk.sx = default_walk_length
        p_cmd_walk.var_theta = 0
        # p_cmd_walk.stop_walk = True###########
        p_cmd_walk.stop_walk = False##
        pub_cmd_walk.publish(p_cmd_walk)
        # print(end_time - start_time)
        time.sleep(4)

        p_cmd_walk.sx = 0
        p_cmd_walk.var_theta = 0
        p_cmd_walk.stop_walk = True###########
        # p_cmd_walk.stop_walk = False##
        pub_cmd_walk.publish(p_cmd_walk)
        # print(end_time - start_time)
        time.sleep(50)

        if end_time - start_time < 3: ##机器人开了直接走三秒
            # p_cmd_walk.stop_walk = True##
            p_cmd_walk.sx = default_walk_length
            p_cmd_walk.var_theta = 0
            # p_cmd_walk.stop_walk = True###########
            p_cmd_walk.stop_walk = False##
            pub_cmd_walk.publish(p_cmd_walk)
            print(end_time - start_time)
            # time.sleep(3)
        else: 
            # 三秒过后开始识别
            # 一秒执行一次
            if(count % run_rate == 0):
                p_cmd_walk.sx = 0            
                p_cmd_walk.stop_walk = True
                pub_cmd_walk.publish(p_cmd_walk)
                print("tingxia")                
                # 停止行走，等待一段时间以检测车道线
                stop_walk_flag = rospy.get_param("stop_walk_flag")
                while(not stop_walk_flag):
                    stop_walk_flag = rospy.get_param("stop_walk_flag")
                time.sleep(2)

                                               
                # 图像预处理
                processed_image = process_image(frame)

                # 透视变换
                perspective_image = perspective_warp(processed_image, dst_size=(640, 480))

                cv2.imshow('perspective_image',perspective_image)

                # 处理车道线
                steering_angle, result_img= process_lane_lines(perspective_image, frame)

                # 显示处理后的帧
                if(not result_img.all()):
                    cv2.imshow('Detected Lane Lines', result_img)

                # 更新机器人信息重新发送
                p_cmd_walk.sx = 0
                # p_cmd_walk.stop_walk = True##############
                p_cmd_walk.stop_walk = False

                angler_num = 1
                angler_max = 0.26

                if steering_angle >0:
                    if(abs(steering_angle)<=angler_max):
                        p_cmd_walk.sx = 0
                        p_cmd_walk.var_theta = steering_angle
                        pub_cmd_walk.publish(p_cmd_walk)
                        print("zuo 1")
                        time.sleep(2)
                    else:
                        #dayu chuli
                        angler_num = math.ceil(steering_angle / angler_max)
                        print("zuo%d" %angler_num)
                        p_cmd_walk.sx = 0
                        p_cmd_walk.var_theta = angler_max
                        for i in range(angler_num):
                            pub_cmd_walk.publish(p_cmd_walk)
                            print("zuozhuan%d"% i)
                            time.sleep(2)
                            p_cmd_walk.stop_walk = True
                            pub_cmd_walk.publish(p_cmd_walk)
                            time.sleep(2)
                            # p_cmd_walk.stop_walk = True##############
                            p_cmd_walk.stop_walk = False###################
                            stop_turn_flag = rospy.get_param("stop_turn_flag")                   
                            while(not stop_turn_flag):
                                stop_turn_flag = rospy.get_param("stop_turn_flag")
                        print("turn finish")
                            
                    stop_turn_flag = rospy.get_param("stop_turn_flag")                   
                    while(not stop_turn_flag):
                        stop_turn_flag = rospy.get_param("stop_turn_flag")
                    p_cmd_walk.sx = 0
                    p_cmd_walk.var_theta = 0
                    p_cmd_walk.stop_walk = True
                    pub_cmd_walk.publish(p_cmd_walk)
                    print("wait for walk")
                    time.sleep(3)
 
                else:
                    if(abs(steering_angle)<=angler_max):
                        p_cmd_walk.sx = 0
                        p_cmd_walk.var_theta = steering_angle
                        pub_cmd_walk.publish(p_cmd_walk)
                        print("you 1")
                        time.sleep(2)
                    else:
                        #dayu chuli
                        angler_num = math.ceil(abs(steering_angle) / angler_max)
                        print("you%d" %angler_num)
                        angler_max_temp = angler_max * (-1)
                        p_cmd_walk.var_theta = angler_max_temp
                        for i in range(angler_num):
                            pub_cmd_walk.publish(p_cmd_walk)
                            print("youzhuan%d"% i)
                            time.sleep(2)
                            p_cmd_walk.stop_walk = True
                            pub_cmd_walk.publish(p_cmd_walk)
                            time.sleep(2)
                            # p_cmd_walk.stop_walk = True##############
                            p_cmd_walk.stop_walk = False################
                            stop_turn_flag = rospy.get_param("stop_turn_flag")
                            while(not stop_turn_flag):
                                stop_turn_flag = rospy.get_param("stop_turn_flag")
                        print("turn finish")
                        
                            
                    stop_turn_flag = rospy.get_param("stop_turn_flag")                   
                    while(not stop_turn_flag):
                        stop_turn_flag = rospy.get_param("stop_turn_flag")
                    p_cmd_walk.sx = 0
                    p_cmd_walk.var_theta = 0
                    p_cmd_walk.stop_walk = True
                    pub_cmd_walk.publish(p_cmd_walk)
                    print("wait for walk")

                    time.sleep(3)


                # stop_turn_flag = rospy.get_param("stop_turn_flag")
                # while(not stop_walk_flag):
                #     pass
                start_time = time.time()

        #发送robot_head_pos的pub
        if(count % run_rate == 0):
            pass

        rate.sleep()
        rospy.loginfo("步长：%f，步宽：%f，角度：%f",p_cmd_walk.sx,p_cmd_walk.sy,p_cmd_walk.var_theta)

        # 如果按下'q'键，则退出
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break


# 释放摄像头并关闭所有OpenCV窗口
cap.release()
# out.release()
cv2.destroyAllWindows()