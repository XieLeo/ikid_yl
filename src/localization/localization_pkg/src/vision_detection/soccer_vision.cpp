#include "localization_pkg/soccer_vision.h"

#include <pluginlib/class_list_macros.h>
#include <sensor_msgs/image_encodings.h>
#include <localization_pkg/pixelCameraCorrection.h>
#include <boost/make_shared.hpp>
#include <boost/foreach.hpp>
#include <sensor_msgs/image_encodings.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>
using namespace soccervision;

PLUGINLIB_EXPORT_CLASS(SoccerVision, nodelet::Nodelet)

SoccerVision::SoccerVision()
{
}

SoccerVision::~SoccerVision()
{
}

void SoccerVision::onInit()
{
    ros::NodeHandle &nh = getNodeHandle();

    // 订阅图像数据
    m_sub_input.subscribe(nh, "/camera/image_raw", 20);
    if (m_sub_input.getSubscriber().getNumPublishers() == 0) {
        ROS_WARN("未检测到发布到 /camera/image_raw 的节点");
    } else {
        std::cout << "###########m_sub_input" << std::endl;
    }

    // 初始化TF过滤器
    m_tf_filter = new tf::MessageFilter<sensor_msgs::Image>(m_sub_input, m_tf, "base_link", 20);
    std::cout << "###########m_tf_filter" << std::endl;

    // 定义检测到的对象发布者
    observations_pub = nh.advertise<localization_pkg::Detections>("/vision/detections", 1);

    msg.header.frame_id = "/base_link";

    NODELET_INFO("Starting vision detection node");



    // 获取配置参数
    ros::NodeHandle("~").param("use_gui", m_use_gui, false);

    m_param = new Parameters();

    // 启动图像发布者
    it = new image_transport::ImageTransport(nh);
    image_pub_ = it->advertise("image/rgb", 1);

    // 注册图像处理回调
    m_tf_filter->registerCallback(boost::bind(&SoccerVision::processImage, this, _1));
    std::cout << "###########finish" << std::endl;


}



void SoccerVision::processImage(const sensor_msgs::Image::ConstPtr &img)
{
	std::cout<<"###########processImage"<<std::endl;
	// TODO: extract objects from image
	/*
		Type_Circle,		  //!< Center circle
		Type_Goal,			  //!< Goal (center position)
		Type_GoalPost,		  //!< A single goal post
		Type_XMarker,		  //!< One of the two penalty markers
		Type_FieldLine,		  //!< Field line
		Type_LineXingT,		  //!< T-crossing of two lines
		Type_LineXingX,		  //!< X-crossing of two lines
		Type_LineXingL,		  //!< L-crossing of two lines
	 */
	// ###############

	// All the detected objects will be time-stamped with this value
	ros::Time this_frame_time_stamp = ros::Time::now();

	// Publishing the landmarks and lines information
	// Clean the vectors that contain the detected objects
	// for further population
	msg.lines.clear();
	msg.objects.clear();
	msg.obstacles.clear();
	msg.header.stamp = this_frame_time_stamp;

	tf::StampedTransform transform_egorot_cameraoptical;

	try
	{
		tf::Matrix3x3 mat;
		mat.setEulerYPR(0.0, 0.16, 0.0);

		m_tf.lookupTransform("/base_link", "/camera_link", img->header.stamp, transform_egorot_cameraoptical);
		CameraFrame.tf_egorot_cameraoptical_OriginVector = transform_egorot_cameraoptical.getOrigin();
		CameraFrame.tf_egorot_cameraoptical_OriginBasis = mat*transform_egorot_cameraoptical.getBasis();

		CameraFrame.x_shoulder_filter_range = m_param->landmark_filter_dist_x();
		CameraFrame.y_shoulder_filter_range = m_param->landmark_filter_dist_y();
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("%s", ex.what());
	}
	try
	{
		m_cv_ptr = cv_bridge::toCvCopy(img, sensor_msgs::image_encodings::RGB8);
	}
	catch (const cv_bridge::Exception &e)
	{
		ROS_ERROR("cv_bridge exception: %s", e.what());
		return;
	}

	// //获取图像后转灰度图，膨胀腐蚀，增强对比度，增强白色
	// cv::Mat img_gray;
	// // cv::Mat img_result;
	// cv::cvtColor(m_cv_ptr->image, img_gray, cv::COLOR_RGB2GRAY); // 灰度图
	// // ROS_INFO("img_gray Size: %d x %d, type = %d", img_gray.cols, img_gray.rows,img_gray.type());

	// //对比度
	// cv::Mat img_equalized;
	// cv::equalizeHist(img_gray, img_equalized);


	// cv::Mat white_mask;
	// cv::threshold(img_equalized, white_mask, 200, 255, cv::THRESH_BINARY); // 创建增强白色的mask

	// // // 膨胀和腐蚀处理
	// cv::Mat img_processed;
	// cv::Mat kernel1 = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(4, 4)); // 定义一个 8,8 的方形结构元素
	// cv::Mat kernel2 = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(2,2)); // 定义一个 8,8 的方形结构元素
	// cv::dilate(white_mask, img_processed, kernel1);//edit5.3 注意这里修改腐蚀膨胀的顺序的时候，第一个参数输入要注意
	// cv::erode(img_processed, img_processed, kernel2); 

	 // 创建一个图像副本以防止修改原始图像
    // cv::Mat img_copy = img_processed.clone();


	// cv::Mat img_result;
	// cv::add(m_cv_ptr->image,img_gray,img_result);


	// cv::Mat enhanced_image = cv::Mat::zeros(m_cv_ptr->image.size(), m_cv_ptr->image.type());;
	// cv::addWeighted(m_cv_ptr->image, 1.0, img_equalized, 0.5, 0, enhanced_image);

	// cv::cvtColor(img_processed, img_processed, cv::COLOR_GRAY2RGB); // 灰度图

	// cv::Mat img_result;
	// cv::add(m_cv_ptr->image,img_processed,img_result);



	int pointercounter = 0;
	int pointercounterClass = 0;
	unsigned char Y1, U, Y2, V;
	cv::Mat img_yuyv(ORG_IMAGE_HEIGHT, ORG_IMAGE_WIDTH, CV_8UC2);
	rgb2yuyv(m_cv_ptr->image, img_yuyv);


	// cv::imshow("m_cv_ptr->image", m_cv_ptr->image);
	// cv::imshow("img_gray", img_gray);
	// cv::imshow("img_equalized", img_equalized);
	// cv::imshow("img_processed", img_processed);
	// cv::imshow("img_result", img_result);
	// // cv::imshow("white_mask", white_mask);
	// cv::waitKey(5);

	// ************************* //
	// * 1. Color Segmentation * //
	// ************************* //

	memset(CameraFrame.classified_data, CC_NO_CLASS, sizeof(unsigned char) * ORG_IMAGE_WIDTH * ORG_IMAGE_HEIGHT);

	// Classifying each pixel into object classes using Look-up tables
	// Black, White, Field (green), Ball (orange), Goal (yellow)
	// check: classifyYUVFrameIntoColors	/**
	for (unsigned int i = 0; i < (img_yuyv.cols * img_yuyv.rows * 2); i += 4)
	{

		Y1 = (unsigned char)img_yuyv.data[i];
		U = (unsigned char)img_yuyv.data[i + 1];
		Y2 = (unsigned char)img_yuyv.data[i + 2];
		V = (unsigned char)img_yuyv.data[i + 3];

		// Storing the YUV data
		CameraFrame.frame_raw_data[pointercounter++] = Y1;
		CameraFrame.frame_raw_data[pointercounter++] = U;
		CameraFrame.frame_raw_data[pointercounter++] = V;

		// Classifying the YUV value
		CameraFrame.classified_data[pointercounterClass++] = (unsigned char)CameraFrame.currentLUT.classifyYUVFrameIntoColors(Y1, U, V);

		// Storing the YUV data
		CameraFrame.frame_raw_data[pointercounter++] = Y2;
		CameraFrame.frame_raw_data[pointercounter++] = U;
		CameraFrame.frame_raw_data[pointercounter++] = V;

		// Classifying  the YUV value
		CameraFrame.classified_data[pointercounterClass++] = (unsigned char)CameraFrame.currentLUT.classifyYUVFrameIntoColors(Y2, U, V);
	} // END for

	// ************************* //
	// * 2. Subsampling images * //
	// ************************* //

	// Every subsampled image will be stored in the object
	// currentLUT.objects[COLOR_CLASS].subimg

	//edit5.3
	yuvImageSubsampling(CameraFrame.classified_data, CameraFrame.currentLUT.objects, CameraFrame.cameraMask);

	// ***************************** //
	// * 3. Find Field             * //
	// ***************************** //

	FieldFinder.findField(CameraFrame);

	// ************************************* //
	// * 4. Find white landmarks and lines * //
	// ************************************* //

	MarksAndLinesFinder.findLandmarks_and_Lines(CameraFrame);

	// Publishing Landmarks
	for (unsigned int co = 0; co < CameraFrame.X_landmarks.size(); co++)
	{
		// ROS_INFO("1111111: x_landmarks");
		// landmarks in camera optical frame
		tf::Vector3 vecFromCameraToLandmark = pixelCameraCorrection(CameraFrame.X_landmarks[co].x, CameraFrame.X_landmarks[co].y);
		tf::Vector3 vecEgoCoordinates = compute_ego_position(CameraFrame.tf_egorot_cameraoptical_OriginBasis, CameraFrame.tf_egorot_cameraoptical_OriginVector, vecFromCameraToLandmark);

		objs.confidence = 1.0f;
		objs.type = field_model::WorldObject::Type_LineXingX;
		objs.pose.theta = 0.0f;
		objs.pose.x = vecEgoCoordinates.x();//edit4.19
		objs.pose.y = vecEgoCoordinates.y();
		msg.objects.push_back(objs);

	}

	for (unsigned int co = 0; co < CameraFrame.T_landmarks.size(); co++)
	{
		// ROS_INFO("2222222222222: T_landmarks");
		// landmarks in camera optical frame
		tf::Vector3 vecFromCameraToLandmark = pixelCameraCorrection(CameraFrame.T_landmarks[co].x, CameraFrame.T_landmarks[co].y);
		tf::Vector3 vecEgoCoordinates = compute_ego_position(CameraFrame.tf_egorot_cameraoptical_OriginBasis, CameraFrame.tf_egorot_cameraoptical_OriginVector, vecFromCameraToLandmark);

		objs.confidence = 1.0f;
		objs.type = field_model::WorldObject::Type_LineXingT;
		objs.pose.theta = 0.0f;
		objs.pose.x = vecEgoCoordinates.x();
		objs.pose.y = vecEgoCoordinates.y();
		msg.objects.push_back(objs);
	}

	for (unsigned int co = 0; co < CameraFrame.L_landmarks.size(); co++)
	{
		// ROS_INFO("333333333333: L_landmarks");
		// landmarks in camera optical frame
		tf::Vector3 vecFromCameraToLandmark = pixelCameraCorrection(CameraFrame.L_landmarks[co].x, CameraFrame.L_landmarks[co].y);
		tf::Vector3 vecEgoCoordinates = compute_ego_position(CameraFrame.tf_egorot_cameraoptical_OriginBasis, CameraFrame.tf_egorot_cameraoptical_OriginVector, vecFromCameraToLandmark);

		objs.confidence = 1.0f;
		objs.type = field_model::WorldObject::Type_LineXingL;
		objs.pose.theta = 0.0f;
		objs.pose.x = vecEgoCoordinates.x();
		objs.pose.y = vecEgoCoordinates.y();
		msg.objects.push_back(objs);
	}

	// Publishing detected landmarks, goal posts
	// Only if the size of the vectors (Lines and Objects is greather than zero)
	if (msg.objects.size() > 0)
	{
		observations_pub.publish(msg);//edit5.31
	}

	// EXECUTE only if GUI is required
	// m_use_gui = true;
	m_use_gui = false;
	if (m_use_gui)
	{

		ros::Time this_frame_time_stamp = ros::Time::now();

		// LOCAL VISIALIZATION ON the RGB image

		unsigned char rgbFrame[ORG_IMAGE_WIDTH * ORG_IMAGE_HEIGHT * 3];
		yuv2rgb(CameraFrame.frame_raw_data, rgbFrame, ORG_IMAGE_WIDTH, ORG_IMAGE_HEIGHT);
		cv::Mat fullrgbframe = cv::Mat(ORG_IMAGE_HEIGHT, ORG_IMAGE_WIDTH, CV_8UC3, rgbFrame);

		// Drawing Landmarks
		for (unsigned int co = 0; co < CameraFrame.T_landmarks.size(); co++)
		{
			cv::circle(fullrgbframe, cv::Point(CameraFrame.T_landmarks[co].x * SUB_SAMPLING_PARAMETER, CameraFrame.T_landmarks[co].y * SUB_SAMPLING_PARAMETER), 3, cv::Scalar(130, 0, 130), 10, 1);
			cv::putText(fullrgbframe, "T", cv::Point(CameraFrame.T_landmarks[co].x * SUB_SAMPLING_PARAMETER, CameraFrame.T_landmarks[co].y * SUB_SAMPLING_PARAMETER), cv::FONT_HERSHEY_SIMPLEX, 5, cv::Scalar(130, 0, 130), 2);
		}

		for (unsigned int co = 0; co < CameraFrame.L_landmarks.size(); co++)
		{
			cv::circle(fullrgbframe, cv::Point(CameraFrame.L_landmarks[co].x * SUB_SAMPLING_PARAMETER, CameraFrame.L_landmarks[co].y * SUB_SAMPLING_PARAMETER), 3, cv::Scalar(0, 77, 255), 10, 1);
			cv::putText(fullrgbframe, "L", cv::Point(CameraFrame.L_landmarks[co].x * SUB_SAMPLING_PARAMETER, CameraFrame.L_landmarks[co].y * SUB_SAMPLING_PARAMETER), cv::FONT_HERSHEY_SIMPLEX, 5, cv::Scalar(0, 77, 255), 2);
		}

		for (unsigned int co = 0; co < CameraFrame.X_landmarks.size(); co++)
		{
			cv::circle(fullrgbframe, cv::Point(CameraFrame.X_landmarks[co].x * SUB_SAMPLING_PARAMETER, CameraFrame.X_landmarks[co].y * SUB_SAMPLING_PARAMETER), 3, cv::Scalar(255, 77, 0), 10, 1);
			cv::putText(fullrgbframe, "X", cv::Point(CameraFrame.X_landmarks[co].x * SUB_SAMPLING_PARAMETER, CameraFrame.X_landmarks[co].y * SUB_SAMPLING_PARAMETER),cv::FONT_HERSHEY_SIMPLEX, 5, cv::Scalar(255, 77, 0), 2);
		}

		// Drawing the fieldHull
		for (int co = 0; co < (int)(CameraFrame.soccerFieldHull.size() - 1); co++)
		{
			PixelPosition pix1 = CameraFrame.soccerFieldHull.getPixelAtPos(co);
			PixelPosition pix2 = CameraFrame.soccerFieldHull.getPixelAtPos(co + 1);
			cv::circle(fullrgbframe, cv::Point(pix1.x * SUB_SAMPLING_PARAMETER, pix1.y * SUB_SAMPLING_PARAMETER), 2, cv::Scalar(0, 0, 255), 3, 8);
			cv::line(fullrgbframe, cv::Point(pix1.x * SUB_SAMPLING_PARAMETER, pix1.y * SUB_SAMPLING_PARAMETER),
					 cv::Point(pix2.x * SUB_SAMPLING_PARAMETER, pix2.y * SUB_SAMPLING_PARAMETER), cv::Scalar(0, 0, 255), 1, 0);
		}

		int colorscale = 15;

		sensor_msgs::Image::Ptr rgbout;
		rgbout = boost::make_shared<sensor_msgs::Image>();
		rgbout->width = ORG_IMAGE_WIDTH;
		rgbout->height = ORG_IMAGE_HEIGHT;
		rgbout->step = 3 * ORG_IMAGE_WIDTH;
		rgbout->encoding = std::string("bgr8", 4);
		rgbout->data.resize(ORG_IMAGE_WIDTH * ORG_IMAGE_HEIGHT * 3);
		memcpy(&rgbout->data[0], fullrgbframe.data, ORG_IMAGE_WIDTH * ORG_IMAGE_HEIGHT * 3);
		rgbout->header.stamp = this_frame_time_stamp;
		image_pub_.publish(rgbout);

		

	} // END IF GUI enable.

	CameraFrame.X_landmarks.clear();
	CameraFrame.T_landmarks.clear();
	CameraFrame.L_landmarks.clear();
	CameraFrame.lines.clear();

} // END: SoccerVision::processImage
