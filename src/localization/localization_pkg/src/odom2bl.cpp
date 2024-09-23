#include "ros/ros.h"
#include "tf/transform_broadcaster.h"
#include "ikid_key_ctrl/cmd_walk.h"

double robot_x = 0.0;
double robot_y = 0.0;
double robot_theta = 0.0;
double step_len = 0.0;
double step_theta = 0.0;
bool robot_moving = false;
bool first_cmd_received = false;
ros::Time last_update_time;

// 实机
// 静止的时候接收被持续发送的/cmd_walk话题，但是参数全为零。
// 运动的时候只发送一条cmd_walk话题，但是会持续n秒，n是用户设置的ros::Duration(n).sleep();
// 此时机器人实际上是一直在用当前cmd_walk发送的信息持续运动n秒的，所以需要持续记录位置角度的变化，直到下一个话题被接收，才会停止计算里程计。

void cmdWalkCallback(const ikid_key_ctrl::cmd_walk::ConstPtr& msg) {
    ROS_INFO("cmdWalkCallback");

    // 更新机器人的位置和方向
     step_len = msg->sx;
    // double step_width = msg->sy;
     step_theta = msg->var_theta;
    bool stop_walk = msg->stop_walk;

    // 根据消息内容判断机器人是否在运动中
    if (!stop_walk) {
        robot_moving = true;
        last_update_time = ros::Time::now();  // 记录运动开始的时间

        robot_x += step_len * cos(robot_theta);
        robot_y += step_len * sin(robot_theta);
        robot_theta += step_theta;
        first_cmd_received = true;
    } else {
        robot_moving = false;
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "odom_to_base_link");
    ros::NodeHandle nh;

    ros::Subscriber sub_cmd_walk = nh.subscribe("/cmd_walk", 5, cmdWalkCallback);
    static tf::TransformBroadcaster broadcaster;

    ros::Rate loop_rate(30);  // 定义发布频率为10Hz

    while (ros::ok()) {
        // 如果机器人正在持续运动，则持续更新里程计信息
        if (robot_moving) {
            ros::Duration time_since_update = ros::Time::now() - last_update_time;
            double elapsed_seconds = time_since_update.toSec();

            // 更新机器人的位置和方向
            // 这里根据每秒持续更新的里程计信息进行计算
            robot_x += step_len * cos(robot_theta) * elapsed_seconds;
            robot_y += step_len * sin(robot_theta) * elapsed_seconds;
            robot_theta += step_theta * elapsed_seconds;

            // 发布里程计信息
            tf::Transform transform;
            transform.setOrigin(tf::Vector3(robot_x, robot_y, 0.0));
            tf::Quaternion q;
            q.setRPY(0, 0, robot_theta);
            transform.setRotation(q);
            broadcaster.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "odom", "base_link"));

            // 更新上次更新时间
            last_update_time = ros::Time::now();
        }else {
            // 如果机器人静止，并且没有接收到任何/cmd_walk话题消息，则发布base_link在原点的TF转换
            if (!first_cmd_received) {
                geometry_msgs::TransformStamped odom_trans;
                odom_trans.header.stamp = ros::Time::now();
                odom_trans.header.frame_id = "odom";
                odom_trans.child_frame_id = "base_link";
                odom_trans.transform.translation.x = 0.0;
                odom_trans.transform.translation.y = 0.0;
                odom_trans.transform.translation.z = 0.0;
                odom_trans.transform.rotation = tf::createQuaternionMsgFromYaw(0.0);
                broadcaster.sendTransform(odom_trans);
            }
        }

        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}
