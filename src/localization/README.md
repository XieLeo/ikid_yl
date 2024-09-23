## 安装依赖项
### ros
- cv_bridge
- image_transport
- eigen_conversions

### 非ROS
- opencv

## 文件结构
```bash
localization/
├── config_server                                   #ROS参数配置服务器
│   ├── CMakeLists.txt
│   ├── config.yaml                                 #默认加载的ROS参数文件
│   ├── include
│   │   └── config_server
│   │       ├── configserver.h
│   │       ├── parameterclient.h
│   │       ├── parameter.h
│   │       └── variant.h
│   ├── msg
│   │   ├── ParameterDescription.msg
│   │   └── ParameterList.msg
│   ├── package.xml
│   ├── src
│   │   ├── configserver.cpp
│   │   ├── parameterclient.cpp
│   │   └── parameter.cpp
│   └── srv
│       ├── GetParameter.srv
│       ├── Load.srv
│       ├── Save.srv
│       ├── SetParameter.srv
│       ├── SubscribeList.srv
│       └── Subscribe.srv
├── localization_pkg
│   ├── Black.lut
│   ├── CMakeLists.txt
│   ├── doc
│   │   ├── tree.png
│   │   └── 场地特征.png
│   ├── include
│   │   └── localization_pkg
│   │       ├── camera_parameters.h             
│   │       ├── checkLimitsInSubImage.h
│   │       ├── convexhullfunctions.h
│   │       ├── fieldInformationBag.h
│   │       ├── field_model.h
│   │       ├── findField.h
│   │       ├── findLandmarksAndLines.h
│   │       ├── frameGrabber.h
│   │       ├── globaldefinitions.h
│   │       ├── localization.h
│   │       ├── math.hpp
│   │       ├── particle_filter.hpp
│   │       ├── pixelCameraCorrection.h
│   │       ├── regionStack.h
│   │       ├── soccer_markers.h
│   │       ├── soccer_vision.h
│   │       ├── yuv2rgb.h
│   │       └── yuvClasses.h
│   ├── launch
│   │   └── localization.launch          #启动config_server和localization
│   ├── maskForCamera
│   ├── msg
│   │   ├── CompassHeading.msg           #朝向
│   │   ├── Detections.msg
│   │   ├── LineDetection.msg
│   │   ├── ObjectDetection.msg
│   │   ├── ObstacleDetection.msg
│   │   ├── Particle.msg
│   │   └── ParticleSet.msg
│   ├── Objects.lut
│   ├── package.xml
│   ├── plugin.xml
│   ├── src
│   │   ├── field_model.cpp             #场地模型
│   │   ├── localization.cpp            #粒子滤波实现
│   │   ├── localization_node.cpp       #ROS节点
│   │   └── vision_detection
│   │       ├── camera_parameters.cpp   #相机模型配置
│   │       ├── convexhullfunctions.cpp #提取场地凸包
│   │       ├── findField.cpp           #提取场地区域
│   │       ├── findLandmarksAndLines.cpp #提取特征 
│   │       ├── pixelCameraCorrection.cpp #像素坐标转换
│   │       ├── soccer_vision.cpp #特征提取
│   │       └── yuvClasses.cpp #YUV颜色空间
│   └── White.lut
└── README.md
```


## 确认场地参数
场地参数文件: "localization/localization_pkg/src/field_model.cpp"
```CPP
// ...
	FieldModel::FieldModel()
		: m_param_magneticHeading("/field/magneticHeading", -M_PI, 0.001, M_PI, 0.0)
	{
		// kidsize
		m_length = 9.0;
		m_width = 6.0;
		m_goalWidth = 2.6;
		m_centerCircleDiameter = 1.5;
		m_goalAreaWidth = 3.0;
		m_goalAreaDepth = 1.0;
		m_penaltyMarkerDist = 1.5;
     // ... 
    }
```

## 修改相机内参
文件路径："src/ikid_ws2/src/localization/localization_pkg/src/vision_detection/camera_parameters.cpp"
```CPP
// Notes:
// The constants were obtained using the OpenCV camera calibration using a checkerboard pattern
// fx and fy are the camera focal lengths
// cx and cy specify the camera optical center
// k1 k2 p1 p2 k3 k4 k5 k6 are the distortion parameters
//
// Refer to:
// http://docs.opencv.org/doc/tutorials/calib3d/camera_calibration/camera_calibration.html

// Camera resolution
const float CamParam::rx = ORG_IMAGE_WIDTH;
const float CamParam::ry = ORG_IMAGE_HEIGHT;

// Camera parameters
const float CamParam::fx = 572.3124980439369;
const float CamParam::fy = 572.3124980439369;
const float CamParam::cx = 400.5;
const float CamParam::cy = 300.5;

// Radial distortion parameters
const float CamParam::k1 = 0.0;
const float CamParam::k2 = 0.0;
const float CamParam::k3 = 0.0;
const float CamParam::k4 = 0.0;
const float CamParam::k5 = 0.0;
const float CamParam::k6 = 0.0;

// Tangential distortion parameters
const float CamParam::p1 = 0.0;
const float CamParam::p2 = 0.0;
// EOF
```


## 修改图像话题和相机坐标系
修改文件："localization/localization_pkg/src/vision_detection/soccer_vision.cpp"
```CPP
void SoccerVision::onInit()
{
	ros::NodeHandle &nh = getNodeHandle();
    //TODO: 修改图像话题"/camera/image_raw"
	m_sub_input.subscribe(nh, "/camera/image_raw", 10);
	m_tf_filter = new tf::MessageFilter<sensor_msgs::Image>(m_sub_input, m_tf, "base_link", 10);

	// Definition of the detected objects publisher
	observations_pub = nh.advertise<localization_pkg::Detections>("/vision/detections", 1);
	msg.header.frame_id = "/base_link";

	NODELET_INFO("Starting vision detection node");
	CameraFrame.currentLUT.initialize();
	FieldFinder.initialize();

	NODELET_INFO("Reading Camera mask and Look-up tables...");
	CameraFrame.currentLUT.ReadYUVBlackLookUpTable("Black.lut"); // ID 0
	CameraFrame.currentLUT.ReadYUVWhiteLookUpTable("White.lut"); // ID 1
	CameraFrame.currentLUT.ReadYUVLookUpTable("Objects.lut");	 // ID 2 3 4 ...
	CameraFrame.readCameraMask("maskForCamera");

	ros::NodeHandle("~").param("use_gui", m_use_gui, false);

	m_param = new Parameters();

	// START Image Publishers for the SoccerGUI
	it = new image_transport::ImageTransport(nh);
	image_pub_ = it->advertise("image/rgb", 1);

	m_tf_filter->registerCallback(boost::bind(&SoccerVision::processImage, this, _1));
}



void SoccerVision::processImage(const sensor_msgs::Image::ConstPtr &img)
{
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
        //TODO: 修改相机光轴坐标系 "/neck_front_swing_Link"
		m_tf.lookupTransform("/base_link", "/neck_front_swing_Link", img->header.stamp, transform_egorot_cameraoptical);
		CameraFrame.tf_egorot_cameraoptical_OriginVector = transform_egorot_cameraoptical.getOrigin();
		CameraFrame.tf_egorot_cameraoptical_OriginBasis = transform_egorot_cameraoptical.getBasis();

		CameraFrame.x_shoulder_filter_range = m_param->landmark_filter_dist_x();
		CameraFrame.y_shoulder_filter_range = m_param->landmark_filter_dist_y();
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("%s", ex.what());
	}
    // ...
}
```
## 必要输入
- URDF中增加相机**光轴**坐标系
- 里程计TF："odom" -> "base_link"
- 朝向话题："/compass/heading" 类型： "localization_pkg::CompassHeading"
```C++
// localization/localization_pkg/src/localization.cpp

LocalizationPF::LocalizationPF()
	: ParticleFilter<Vec3f, Vec3f, LandmarkObservation, Mat22f>(
		  new UniformParticleInitializer(),
		  new OdometryModel(),
		  new ObservationModel(this),
		  250,
		  1000,
		  0.01,
		  0.05),
	  m_field(field_model::FieldModel::getInstance()),
	  m_use_odom("localization/usd_odom", false)
{
	ros::NodeHandle nh("~");
	ROS_WARN("after nh");

	m_lastTime = ros::Time::now();

	m_sub_vision = nh.subscribe(
		"/vision/detections", 1, &LocalizationPF::handleDetections, this);

	m_sub_compass = nh.subscribe(
		"/compass/heading", 1, &LocalizationPF::handleCompass, this);
// ...
}
```