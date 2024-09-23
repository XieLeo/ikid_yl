#include <ros/ros.h>
#include <localization_pkg/Detections.h>        // 包含 Detections 消息类型
#include <localization_pkg/ObjectDetection.h>   // 包含 ObjectDetection 消息类型
#include <geometry_msgs/Pose2D.h>               // 包含 Pose2D 消息类型
#include "localization_pkg/field_model.h"


int main(int argc, char **argv)
{
    // 初始化 ROS 节点
    ros::init(argc, argv, "vision_publisher_node");
    ros::NodeHandle nh;

    // 创建一个发布器，发布到 /vision/detections 话题
    ros::Publisher detections_pub = nh.advertise<localization_pkg::Detections>("/vision/detections", 10);

    // 设置发布频率
    ros::Rate loop_rate(1); // 每秒发布一次

    while (ros::ok())
    {
        // 创建 Detections 消息
        localization_pkg::Detections detections_msg;

        // 设置头部信息
        detections_msg.header.stamp = ros::Time::now();
        detections_msg.header.frame_id = "base_link"; // 根据实际使用场景设置

        // 创建一个 ObjectDetection 对象
        localization_pkg::ObjectDetection object_msg;
        object_msg.pose.x = 3.0; // 设置 x 坐标
        object_msg.pose.y = 1.0; // 设置 y 坐标
        object_msg.pose.theta = 0.0; // 设置朝向
		object_msg.type = field_model::WorldObject::Type_LineXingX;
        object_msg.confidence = 1; // 设置置信度

        // 创建一个 ObjectDetection 对象
        localization_pkg::ObjectDetection object_msg1;
        object_msg1.pose.x = 3.0; // 设置 x 坐标
        object_msg1.pose.y = -1.0; // 设置 y 坐标
        object_msg1.pose.theta = 0.0; // 设置朝向
		object_msg1.type = field_model::WorldObject::Type_LineXingX;
        object_msg1.confidence = 1; // 设置置信度

        // 将 ObjectDetection 对象添加到 Detections 对象中
        detections_msg.objects.push_back(object_msg);
        detections_msg.objects.push_back(object_msg1);

        // 发布 Detections 消息
        detections_pub.publish(detections_msg);

        ROS_INFO("Published detection: x = %f, y = %f, theta = %f, type = %d, confidence = %f", 
                 object_msg.pose.x, object_msg.pose.y, object_msg.pose.theta, object_msg.type, object_msg.confidence);

        // 循环等待下一次发布
        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}
