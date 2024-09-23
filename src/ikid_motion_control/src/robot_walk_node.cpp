#include "ros/ros.h"
#include <stdio.h>
#include <stdlib.h>
#include <fstream>
#include "ikid_motion_control/robotModel.h"
#include "ikid_motion_control/cmd_walk.h"
#include <std_msgs/Int16.h>

extern robotLink robotModel[26];
extern double theta;
extern double sx;
extern double sy;
extern double fh;
extern double init_imu_roll;
extern double init_imu_pitch;
extern double init_imu_yaw;
extern double imu_data_roll;
extern double imu_data_yaw;
extern double imu_data_pitch;
extern bool isLeft;
extern int leftMovement;
extern int rightMovement;

void doWalkMsg(const ikid_motion_control::cmd_walk::ConstPtr& walkMsg){
    ROS_INFO("0000");
    bool stop_special_gait_flag = true;
    ros::param::get("stop_special_gait_flag",stop_special_gait_flag);
    if(!stop_special_gait_flag){
        return;
    }
    sx = walkMsg->sx;
    sy = walkMsg->sy;
    ROS_INFO("1111");
	if(!(walkMsg->stop_walk)){
        bool stop_walk_flag;
        ros::param::get("stop_walk_flag",stop_walk_flag); //�����ֹͣ��ʼ����ִ��������̬
        ROS_INFO("2222");
        if(stop_walk_flag){
            startTrajPlan();
        }
        ros::param::set("stop_walk_flag",false);
        if(walkMsg->var_theta > 10e-5){
            ros::param::set("stop_turn_flag",false);
            anglePlan(walkMsg->var_theta);
            ros::param::set("stop_turn_flag",true);
        }else if(walkMsg->var_theta < 0){
            ros::param::set("stop_turn_flag",false);
            anglePlan(walkMsg->var_theta);
            ros::param::set("stop_turn_flag",true);
        }
        if(walkMsg->walk_with_ball){
            ros::param::set("walk_with_ball",true);
        }else{
            ros::param::set("walk_with_ball",false);
        }
        

    }else{
        bool stop_walk_flag;
        ros::param::get("stop_walk_flag",stop_walk_flag); //����Ѿ�ֹͣ����ִ�в���
        if(!stop_walk_flag){
            sx = 0;
            armSwingTrajPlan();
            trajPlan();
            if(isLeft){
                trajPlan();
            }
            FallUpInitPos();  // ��֤ͣ��
            ros::param::set("stop_walk_flag",true);
        }
        
    }
}

void doSpecialGaitMsg(const std_msgs::Int16::ConstPtr& id_msg){

    bool stop_walk_flag;
    ros::param::get("stop_walk_flag",stop_walk_flag); //����Ѿ�ֹͣ����ִ�в���
    if(!stop_walk_flag){
        sx = 0;
        armSwingTrajPlan();
        trajPlan();
        FallUpInitPos();  // ��֤ͣ��
        ros::param::set("stop_walk_flag",true);
    }
    specialGaitExec(id_msg->data);
    trajPlan();
    // walk_msg.stop_walk = false;
    // puber_special_gait.publish(walk_msg);
    // ros::param::get("stop_walk_flag", stop_walk_flag);
    // while(stop_walk_flag){
    //     ros::param::get("stop_walk_flag", stop_walk_flag);
    // }
}

void doParallelMove(const std_msgs::Int16::ConstPtr& msg){

    if (msg->data == leftMovement){
        leftTrajPlan();
    }else if(msg->data == rightMovement){
        rightTrajPlan();
    }

}


int main(int argc, char *argv[])
{
    //ִ�� ros �ڵ��ʼ��
    ros::init(argc,argv,"robot_walk_node");
    //���� ros �ڵ���
    ros::NodeHandle n;

    ROS_INFO("IkID-ROBOT NB! Let's walk it!");
    robotStart(n);
    ros::Duration(5).sleep();
    std::fstream fin;
	fin.open("/home/nvidia/ikid_ws2/imubuffer.txt", std::ios::in);
	fin >> init_imu_roll >> init_imu_pitch >> init_imu_yaw;
	fin.close();

    std::fstream fout;
	fout.open("/home/nvidia/ikid_ws2/initImubuffer.txt", std::ios::out);
	fout << init_imu_roll << ' ' << init_imu_pitch << ' ' << init_imu_yaw;
	fout.close();

    


    ros::Subscriber sub = n.subscribe<ikid_motion_control::cmd_walk>("/cmd_walk",1,doWalkMsg);
    ros::param::set("stop_walk_flag",true);  //����ֹͣ���߱�־λ�ڲ�����������
    ros::param::set("stop_turn_flag",true);  //����ֹͣת���־λ�ڲ�����������
    ros::param::set("walk_with_ball",false);  //���ö�̬�����־λ�ڲ�����������
    ros::Subscriber specialGaitSuber = n.subscribe<std_msgs::Int16>("/special_gait",1,doSpecialGaitMsg);
    ros::param::set("stop_special_gait_flag", true);
    ros::Subscriber parallelMove = n.subscribe<std_msgs::Int16>("/parallelMove",3,doParallelMove);

    clearImuDataTxt();
    clearZmpDataTxt();

    // fact use
    ros::Rate rate(80);
    while (ros::ok())
    {
        bool stop_walk_flag;
        judgeFall();
        ros::param::get("stop_walk_flag",stop_walk_flag);
        if(!stop_walk_flag){
            trajPlan();
        }
        rate.sleep();
        ros::spinOnce();
    }


    // test 01 robot has arm swing 
    // ros::Duration(5).sleep();
    // startTrajPlan();
    // for(int i = 0; i < 20; i++){
    //     trajPlan();
    // }
    // sx = 0;
    // armSwingTrajPlan();
    // trajPlan();


    // test 02 robot has not arm swing
    // ros::Duration(5).sleep();
    // startTrajPlan();
    // for(int i = 0; i < 20; i++){
    //     trajPlan();
    // }
    // sx = 0;
    // trajPlan();

    // test 03 robot walk with arm awing and no pid amend
    // ros::Duration(5).sleep();
    // startTrajPlan();
    // for(int i = 0; i < 20; i++){
    //     if(i == 9){
    //         anglePlan(15.0/180*PI);
    //     }else if(i == 14){
    //         anglePlan(-15.0/180*PI);
    //     }else{
    //         trajPlan();
    //     }
    // }
    // sx = 0;
    // trajPlan();

    // test 04 robot walk with arm awing and pid amend
    // ros::Duration(5).sleep();
    // startTrajPlan();
    // for(int i = 0; i < 20; i++){
    //     if(i == 9){
    //         anglePlan(15.0/180*PI);
    //     }else if(i == 14){
    //         anglePlan(-15.0/180*PI);
    //     }else{
    //         trajPlan();
    //     }
    // }
    // sx = 0;
    // trajPlan();


    // test 05 robot  dynamic kick ball
    // ros::Duration(5).sleep();
    // startTrajPlan();
    // for(int i = 0; i < 10; i++){
    //     if(i == 3 ){
    //         fh=0.1;
    //         sx=0.12;
    //         ros::param::set("walk_with_ball",true);
    //     }else{
    //         fh=0.05;
    //         sx=0.1;
    //         ros::param::set("walk_with_ball",false);
    //     }
    //     trajPlan();
    // }
    // sx = 0;
    // trajPlan();

    // test 06 specialgait

    
    
    return 0;
}