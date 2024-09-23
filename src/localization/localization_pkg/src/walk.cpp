#include "ros/ros.h"
#include "ikid_key_ctrl/cmd_walk.h"

int main(int argc, char **argv) {
    ros::init(argc, argv, "cmd_walk_publisher");
    ros::NodeHandle nh;

    ros::Publisher cmd_walk_pub = nh.advertise<ikid_key_ctrl::cmd_walk>("/cmd_walk", 1);

    ros::Rate loop_rate(10);

    // 创建cmd_walk消息
    ikid_key_ctrl::cmd_walk cmd_msg;
    cmd_msg.sx = 0.1;  // 设置步长
    cmd_msg.sy = 0.13;  // 设置步长
    cmd_msg.var_theta = 0;  // 设置旋转角度
    cmd_msg.stop_walk = false;  // 机器人持续运动

    // 发布cmd_walk消息
    for(int i = 0; i < 10; ++i) {  // 让机器人运动1秒钟（10次，每次0.1秒）
        cmd_walk_pub.publish(cmd_msg);
        loop_rate.sleep();
    }

    // 发送停止命令
    cmd_msg.stop_walk = true;
    cmd_walk_pub.publish(cmd_msg);

    ros::spinOnce();

    return 0;
}
