#pragma once

#include <nodelet/nodelet.h>
#include <ros/ros.h>

#include <sensor_msgs/Image.h>
#include <vector>
#include <stdint.h>

#include <tf/message_filter.h>
#include <tf/transform_listener.h>
#include <message_filters/subscriber.h>

#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <geometry_msgs/PointStamped.h>
#include <geometry_msgs/PolygonStamped.h>
#include <geometry_msgs/Point32.h>

#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>

#include "localization_pkg/Detections.h"
#include "localization_pkg/field_model.h"

#include <config_server/parameter.h>

#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <image_transport/image_transport.h>

#include "localization_pkg/frameGrabber.h"
#include "localization_pkg/findField.h"
#include "localization_pkg/findLandmarksAndLines.h"
#include "localization_pkg/yuv2rgb.h"
#include "localization_pkg/soccer_markers.h"

namespace soccervision
{

	struct Parameters
	{
		Parameters()
			: landmark_filter_dist_x("landmark_filter_dist/x", 0.0, 0.001, 2.0, 0.09), landmark_filter_dist_y("landmark_filter_dist/y", 0.0, 0.001, 2.0, 0.13)
		{
		}

		config_server::Parameter<float> landmark_filter_dist_x;
		config_server::Parameter<float> landmark_filter_dist_y;
	};

	/**
	 * @class SoccerVision
	 * @brief Soccer vision class.
	 *
	 * This class contains all the objects and functions that will be executed during the computer vision process. The two main functions of this class are
	 * onInit() and processImage(const sensor_msgs::Image::ConstPtr& img). Where: OnInit will initialize all the structures that will be used in the process, and processImage will call each
	 * identification procedure for each camera frame.
	 **/
	class SoccerVision : public nodelet::Nodelet
	{
	public:
		SoccerVision();
		virtual ~SoccerVision();

		/*! \fn virtual void onInit();
		 *    \brief initialize all the necesary structures and variables.
		 */
		virtual void onInit();

		/*! \fn void processImage(const sensor_msgs::Image::ConstPtr& img);
		 *    \brief Executes the the image processing algorithms for each camera frame.
		 *    \param img  pointer to the raw image.
		 */
		void processImage(const sensor_msgs::Image::ConstPtr &img);

		//! CameraFrame
		/*! Object that contains static buffers that will be used during the identification process.*/
		FrameGrabber CameraFrame;

		//! Field Finder
		/*! Object that contains all the functions to enable the localization of the green field on the image.*/
		FindField FieldFinder;

		FindLandmarksAndLines MarksAndLinesFinder;

	private:
		cv_bridge::CvImagePtr m_cv_ptr{nullptr};
		ros::Publisher m_pub_output;
		message_filters::Subscriber<sensor_msgs::Image> m_sub_input;

		tf::TransformListener m_tf;
		tf::MessageFilter<sensor_msgs::Image> *m_tf_filter;

		ros::Publisher observations_pub;
		localization_pkg::Detections msg;
		localization_pkg::ObjectDetection objs;

		bool m_use_gui;

		Parameters *m_param;

		// SOCCER GUI declaration
		image_transport::ImageTransport *it;
		image_transport::Publisher image_pub_;
		// END Soccer Gui declaration
	};

} // End namespace soccervision
