#include "localization_pkg/localization.h"
#include "localization_pkg/field_model.h"
#include <opencv2/opencv.hpp>
#include <ros/ros.h>

int main(int argc, char **argv)
{
    // 初始化ROS节点
    ros::init(argc, argv, "localization_and_field_model_node");
    ros::NodeHandle nh;

    // 初始化粒子滤波定位
    LocalizationPF pf;

    // 获取FieldModel实例
    field_model::FieldModel *field = field_model::FieldModel::getInstance();

    // 加载给定图像
    cv::Mat backgroundImage = cv::imread("/home/nvidia/ikid_ws2/src/localization/config_server/filed.png");
    if (backgroundImage.empty())
    {
        std::cerr << "Failed to load image." << std::endl;
        return -1;
    }

    // 设置实际尺寸
    double fieldLength = 11.0; // 实际场地长度，米
    double fieldWidth = 8.0;   // 实际场地宽度，米

    // 计算比例尺
    double scaleX = backgroundImage.cols / fieldLength; // 宽度比例尺
    double scaleY = backgroundImage.rows / fieldWidth;  // 高度比例尺

    // 中心点
    cv::Point2d center(backgroundImage.cols / 2, backgroundImage.rows / 2);

    // 绘制静态的场地信息
    cv::Mat staticImage = backgroundImage.clone();
    for (int type = 0; type < field_model::WorldObject::NumTypes; ++type)
    {
        for (const auto &obj : field->objects(static_cast<field_model::WorldObject::Type>(type)))
        {
            // 转换实际坐标到图像坐标
            cv::Point2d pos(center.x + obj.pose().x() * scaleX, center.y - obj.pose().y() * scaleY);

            switch (obj.type())
            {
            case field_model::WorldObject::Type_LineXingL:
                cv::drawMarker(staticImage, pos, cv::Scalar(0, 255, 0), cv::MARKER_TRIANGLE_UP, 20, 2);
                break;
            case field_model::WorldObject::Type_LineXingT:
                cv::drawMarker(staticImage, pos, cv::Scalar(255, 0, 0), cv::MARKER_TILTED_CROSS, 20, 2);
                break;
            case field_model::WorldObject::Type_LineXingX:
                cv::drawMarker(staticImage, pos, cv::Scalar(0, 0, 255), cv::MARKER_STAR, 20, 2);
                break;
            default:
                break;
            }
        }
    }

    ros::Rate rate(30.0);

    ROS_WARN("Entering main loop");

    while (ros::ok())
    {
        ros::spinOnce();

        // 执行粒子滤波的步骤
        pf.step();

        // 复制静态图像
        cv::Mat dynamicImage = staticImage.clone();

        // 绘制粒子
        pf.drawParticles(dynamicImage, scaleX, scaleY, center);

        // 显示图像
        cv::imshow("Field Model", dynamicImage);
        cv::waitKey(1); // 使用waitKey(1)以确保图像在循环中不断刷新

        rate.sleep();
    }

    return 0;
}
