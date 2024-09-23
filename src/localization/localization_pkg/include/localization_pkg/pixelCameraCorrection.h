// pixelCameraCorrection.h
// Provides functions to convert camera points between pixel coordinates, camera frame vectors and ego world vectors.

#pragma once

// Includes
#include <tf/transform_datatypes.h>

namespace soccervision
{

	tf::Vector3 pixelCameraCorrectionOriginalSize(float px, float py, float tol = 0.2);

	tf::Vector3 pixelCameraCorrection(float px, float py, float tol = 0.2);

	tf::Vector3 cameraPixelCorrectionOriginalSize(tf::Vector3 camvec);

	tf::Vector3 cameraPixelCorrection(tf::Vector3 camvec);

	tf::Vector3 compute_ego_position(tf::Matrix3x3 rotMat, tf::Vector3 trunkVec, tf::Vector3 vecCam2Point);

} // End namespace

// TODO:  Add compute_ball_ego_position() function here
