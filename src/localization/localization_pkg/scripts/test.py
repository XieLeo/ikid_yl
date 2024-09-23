import copy
import rospy
from geometry_msgs.msg import TransformStamped
from localization_pkg.msg import Detections
from scipy.stats import multivariate_normal
import matplotlib.pyplot as plt
import matplotlib.animation as anm
from itertools import count

#备份

import math
import random
import numpy as np

class Landmark:
    def __init__(self, x, y, landmark_type):
        self.pos = np.array([x, y]).T
        self.type = landmark_type

        # self.type = self._convert_type_to_enum(landmark_type)

    # 类型的映射关系
    # def _convert_type_to_enum(self, landmark_type):
    #     type_mapping = {
    #         "T": 5,
    #         "X": 6,
    #         "L": 7
    #     }
    #     return type_mapping.get(landmark_type, landmark_type)  # 如果类型不在映射关系中，则返回原始值

    def draw(self, ax, elems):
        c = ax.scatter(self.pos[0], self.pos[1], s=100, marker="*", label="landmarks", color="orange")
        elems.append(c)
    
    def print_info(self):
        print("Landmark :", self)
        print("Landmark Type:", self.type)
        print("Landmark Position:", self.pos)

class Map:
    def __init__(self):       
        self.landmarks = []
        
    def append_landmark(self, landmark):       
        self.landmarks.append(landmark)

    def draw(self, ax, elems):                 
        for lm in self.landmarks: lm.draw(ax, elems)

class World:
    def __init__(self, time_span, time_interval, debug=False, bg_img_path=None):
        self.objects = []  
        self.debug = debug
        self.time_span = time_span  
        self.time_interval = time_interval
        self.bg_img_path = bg_img_path

    def append(self, obj):
        self.objects.append(obj)

# 定义粒子类
class Particle:
    def __init__(self, init_pose, weight):
        if init_pose is None:
            self.pose = np.array([
                np.random.uniform(-5.5, 0.0),
                np.random.uniform(-4.0, 4.0),
                np.random.uniform(-math.pi, math.pi)]
            ).T
        else:
            self.pose = init_pose
        self.weight = weight

    def motion_update(self, nu, omega, time, noise_rate_pdf):
        ns = noise_rate_pdf.rvs()
        pnu = nu + ns[0] * math.sqrt(abs(nu) / time) + ns[1] * math.sqrt(abs(omega) / time)
        pomega = omega + ns[2] * math.sqrt(abs(nu) / time) + ns[3] * math.sqrt(abs(omega) / time)
        self.pose = state_transition(pnu, pomega, time, self.pose)

    #更新后观测模型
    # def observation_update(self, envmap, distance_dev_rate, direction_dev, observations):
    #     for obs_pos, obs_type in observations:
    #         # Find landmarks of the same type as the observation
    #         same_type_landmarks = [landmark for landmark in envmap.landmarks if landmark.type == obs_type]
    #         for landmark in same_type_landmarks:
    #             # Compute distance and angle between particle and landmark
    #             particle_suggest_pos = observation_function(self.pose, landmark)
            
    #             ##尤度の計算##
    #             distance_dev = distance_dev_rate*particle_suggest_pos[0]
    #             cov = np.diag(np.array([distance_dev**2, direction_dev**2]))
    #             self.weight *= multivariate_normal(mean=particle_suggest_pos, cov=cov).pdf(obs_pos)

    def observation_update(self, observations,envmap, distance_dev_rate, direction_dev):
        print("Observations:", observations)
        for obs in observations:
            obs_pos, obs_type = obs
            print("Observation Position:", obs_pos)
            print("Observation Type:", obs_type)
            # Find landmarks of the same type as the observation
            same_type_landmarks = [landmark for landmark in envmap.landmarks if landmark.type == obs_type]
            print("same_type_landmarks:", same_type_landmarks)

            for landmark in same_type_landmarks:
                # Compute distance and angle between particle and landmark
                particle_suggest_pos = observation_function(self.pose, landmark)
            
                ##尤度の計算##
                distance_dev = distance_dev_rate*particle_suggest_pos[0]
                cov = np.diag(np.array([distance_dev**2, direction_dev**2]))
                self.weight *= multivariate_normal(mean=particle_suggest_pos, cov=cov).pdf(obs_pos)





# 定义粒子滤波器类
class Mcl:
    def __init__(self, envmap, init_pose, num, motion_noise_stds,
                 distance_dev_rate=0.14, direction_dev=0.05):
        self.particles = [Particle(init_pose, 1.0/num) for i in range(num)]
        self.map = envmap
        self.distance_dev_rate = distance_dev_rate
        self.direction_dev = direction_dev

        v = motion_noise_stds
        c = np.diag([v["nn"]**2, v["no"]**2, v["on"]**2, v["oo"]**2])
        self.motion_noise_rate_pdf = multivariate_normal(cov=c)

        self.ml = self.particles[0]

    def set_ml(self):
        i = np.argmax([p.weight for p in self.particles])
        self.ml = self.particles[i]

    def motion_model(self, nu, omega, time):
        for p in self.particles:
            p.motion_update(nu, omega, time, self.motion_noise_rate_pdf)

    def observation_model(self, observations):
        for p in self.particles:
            p.observation_update(observations, self.map, self.distance_dev_rate, self.direction_dev)
        self.set_ml()
        self.resampling()

    def resampling(self):
        print("resampling")

        ws = np.cumsum([e.weight for e in self.particles])
        if ws[-1] < 1e-100:
            ws = [e + 1e-100 for e in ws]

        step = ws[-1] / len(self.particles)
        r = np.random.uniform(0.0, step)
        cur_pos = 0
        ps = []

        while len(ps) < len(self.particles):
            if r < ws[cur_pos]:
                ps.append(self.particles[cur_pos])
                r += step
            else:
                cur_pos += 1

        self.particles = [copy.deepcopy(e) for e in ps]
        for p in self.particles:
            p.weight = 1.0 / len(self.particles)


# 假设以下函数是实现机器人运动和观测模型的一部分
def state_transition(pnu, pomega, time, pose):
    # 实现机器人运动模型
    pass

def observation_function(cam_pose, obj_pos):
    print("observation_function")
    diff = obj_pos - cam_pose[0:2]
    phi = math.atan2(diff[1], diff[0]) - cam_pose[2]
    while phi >= np.pi: phi -= 2*np.pi
    while phi < -np.pi: phi += 2*np.pi
    return np.array( [np.hypot(*diff), phi ] ).T

# ROS话题订阅器，用于接收视觉检测结果
# 假设存在一个用于接收视觉检测结果的ROS话题，消息类型为Detections
def detection_callback(data):
    # 从ROS消息中提取视觉检测结果，例如data.objects
    observations = []

    # 检查是否存在物体检测结果
    if data.objects:
        for obj in data.objects:
            # 提取物体的位置信息
            x = obj.pose.x
            y = obj.pose.y
            # theta = obj.pose.theta
            # 打印接收到的位置信息
            # print("Received object pose: x={}, y={}, theta={}".format(x, y, theta))


            # 将位置信息添加到观测结果列表中
            observations.append([(x, y), obj.type])
            # 打印添加到observations后的信息
            print("000000Observations after adding: {}".format(observations))


        # 更新粒子滤波器状态
    mcl.observation_model(observations)

# 运行主函数
if __name__ == "__main__":
    # 这里放置ROS的相关初始化等
    rospy.init_node('particle_filter')
    # 设置ROS发布速率
    run_rate = 30
    rate = rospy.Rate(run_rate)


    # 创建地图对象
    m = Map()  # 假设存在一个Map类用于存储环境地图信息
    m.append_landmark(Landmark(-2.5,-2.5,5))
    m.append_landmark(Landmark(-2.5,2.5,7))

    # # 打印地标信息
    for landmark in m.landmarks:
        landmark.print_info()

    # 初始化机器人位置
    init_pose = None  # 假设初始位置是原点

    # 定义运动噪声
    motion_noise_stds = {"nn": 0.1, "no": 0.1, "on": 0.1, "oo": 0.1}

    # 初始化粒子滤波器
    num_particles = 100  # 假设有100个粒子
    mcl = Mcl(m, init_pose, num_particles, motion_noise_stds)


    # 启动ROS节点
    # 假设存在一个ROS节点，并设置相应的话题订阅器和回调函数
    rospy.Subscriber("/vision/detections", Detections, detection_callback)

    # ROS主循环
    rospy.spin()
