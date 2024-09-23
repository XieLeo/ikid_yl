// camera_parameters.cpp
// Defines the constants required to distort and undistort points in the camera.
#include "localization_pkg/camera_parameters.h"
#include "localization_pkg/globaldefinitions.h"

//
// CamParam struct
//

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
const float CamParam::fx = 732.1950886849808;
const float CamParam::fy = 732.1950886849808;
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