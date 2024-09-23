#include "localization_pkg/findLandmarksAndLines.h"
#include "localization_pkg/checkLimitsInSubImage.h"
#include "localization_pkg/convexhullfunctions.h"
#include "localization_pkg/pixelCameraCorrection.h"

#include <stdio.h>
#include <stdlib.h>

#include <opencv2/opencv.hpp>
#include <iostream>
// #include <opencv2/ximgproc.hpp>

using namespace std;
using namespace soccervision;

void FindLandmarksAndLines::findLandmarks_and_Lines(FrameGrabber &CamFrm)
{

	// Masking the Filed area.
	// Things outside this area will not be taken into account
	// also initializing the skeleton_tmp buffers
	for (int xy = 0; xy < SUB_SAMPLING_WIDTH * SUB_SAMPLING_HEIGHT; xy++)
	{
		if (CamFrm.FieldMask[xy] == 0)
		{
			CamFrm.currentLUT.objects[CC_WHITE].subimg[xy] = 0;
		}
		else
		{
			// PIXEL within the field area
			// If it has the MIN_COLOR_INTENSITY set it to fullwhite value (255)
			if (CamFrm.currentLUT.objects[CC_WHITE].subimg[xy] > MIN_COLOR_INTENSITY)
			{
				// CamFrm.currentLUT.objects[CC_WHITE].subimg[xy] *=;
				CamFrm.currentLUT.objects[CC_WHITE].subimg[xy] = 255;
			}
		}
	}

	// Making a copy of the image where the lines are stored
	for (int xy = 0; xy < SUB_SAMPLING_WIDTH * SUB_SAMPLING_HEIGHT; xy++)
	{
		img_skeleton1_copy[xy] = CamFrm.currentLUT.objects[CC_WHITE].subimg[xy];
	}

	// Skeletonization process.
	cv::Mat bw0 = cv::Mat(SUB_SAMPLING_HEIGHT, SUB_SAMPLING_WIDTH, CV_8U, img_skeleton1_copy);
	cv::imshow("bw0",  bw0*255);
	cv::waitKey(5);
	cv::Mat bw = cv::Mat(SUB_SAMPLING_HEIGHT, SUB_SAMPLING_WIDTH, CV_8U, img_skeleton1_copy);

	

	//显示处理结果
	// cv::imshow("thin1",thin1);
	// cv::imshow("thin2", thin2);
	// cv::waitKey(5);//等待函数用于显示图像,按下键盘任意键后退出



	// 膨胀和腐蚀处理
	// cv::Mat img_processed;
	// cv::Mat kernel1 = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(1,1)); // 定义一个 8,8 的方形结构元素
	// cv::Mat kernel2 = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(1,1)); // 定义一个 8,8 的方形结构元素
	// cv::erode(bw, bw, kernel2); 
	// cv::dilate(bw, bw, kernel1);//edit5.4



	// after processing, 'bw' has pixel value (0~1)
	thinningWithGuoHallAlgorithm(bw);
	cv::imwrite("/home/ros/ikid_ws2/skImage1.jpg", bw * 255);
	cv::imshow("bw",  bw*255);
	cv::waitKey(5);

	int offset1[8][2] = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
	int offset2[16][2] = {{-2, -2}, {-2, -1}, {-2, 0}, {-2, 1}, {-2, 2}, {-1, -2}, {-1, 2}, {0, -2}, {0, 2}, {1, -2}, {1, 2}, {2, -2}, {2, -1}, {2, 0}, {2, 1}, {2, 2}};
	int offset3[24][2] = {{-3, -3}, {-3, -2}, {-3, -1}, {-3, 0}, {-3, 1}, {-3, 2}, {-3, 3}, {-2, -3}, {-2, 3}, {-1, -3}, {-1, 3}, {0, -3}, {0, 3}, {1, -3}, {1, 3}, {2, -3}, {2, 3}, {3, -3}, {3, -2}, {3, -1}, {3, 0}, {3, 1}, {3, 2}, {3, 3}};
	int offset4[32][2] = {{-4, -4}, {-4, -3}, {-4, -2}, {-4, -1}, {-4, 0}, {-4, 1}, {-4, 2}, {-4, 3}, {-4, 4}, {-3, -4}, {-3, 4}, {-2, -4}, {-2, 4}, {-1, -4}, {-1, 4}, {0, -4}, {0, 4}, {1, -4}, {1, 4}, {2, -4}, {2, 4}, {3, -4}, {3, 4}, {4, -4}, {4, -3}, {4, -2}, {4, -1}, {4, 0}, {4, 1}, {4, 2}, {4, 3}, {4, 4}};
	// 	int offset5[40][2] = {{-5,-5},{-5,-4},{-5,-3},{-5,-2},{-5,-1},{-5,0},{-5,1},{-5,2},{-5,3},{-5,4},{-5,5},{-4,-5},{-4,5},{-3,-5},{-3,5},{-2,-5},{-2,5},{-1,-5},{-1,5},{0,-5},{0,5},{1,-5},{1,5},{2,-5},{2,5},{3,-5},{3,5},{4,-5},{4,5},{5,-5},{5,-4},{5,-3},{5,-2},{5,-1},{5,0},{5,1},{5,2},{5,3},{5,4},{5,5}};
	// 	int offset6[48][2] = {{-6,-6},{-6,-5},{-6,-4},{-6,-3},{-6,-2},{-6,-1},{-6,0},{-6,1},{-6,2},{-6,3},{-6,4},{-6,5},{-6,6},{-5,-6},{-5,6},{-4,-6},{-4,6},{-3,-6},{-3,6},{-2,-6},{-2,6},{-1,-6},{-1,6},{0,-6},{0,6},{1,-6},{1,6},{2,-6},{2,6},{3,-6},{3,6},{4,-6},{4,6},{5,-6},{5,6},{6,-6},{6,-5},{6,-4},{6,-3},{6,-2},{6,-1},{6,0},{6,1},{6,2},{6,3},{6,4},{6,5},{6,6}};

	int const offset1_size = 8;
	int const offset2_size = 16;
	int const offset3_size = 24;
	int const offset4_size = 32;
	// 	int const offset5_size = 40;
	// 	int const offset6_size = 48;

	PixelPosition stackPoint;
	PixelPosition tmp_stackPoint1;
	PixelPosition tmp_stackPoint2;
	stackOfWhitePixels.clear();
	int currentNeighborCounter1;
	int currentNeighborCounter2;
	int currentNeighborCounter3;
	// 	int currentNeighborCounter4;

	probableLs.clear();
	probableTsXs.clear();

	detectedXs.clear();
	detectedTs.clear();
	detectedLs.clear();

	// Copy all white pixels into a stack
	for (int x = 0; x < SUB_SAMPLING_WIDTH; x++)
	{
		for (int y = 0; y < SUB_SAMPLING_HEIGHT; y++)
		{

			int pixelpos = SUB_SAMPLING_WIDTH * y + x;
			if (img_skeleton1_copy[pixelpos] == 1)
			{

				tmp_stackPoint1.x = x;
				tmp_stackPoint1.y = y;
				stackOfWhitePixels.push(tmp_stackPoint1);
			}
		}
	}

	// Analysis of all pixels to find the Landmarks (X,T,L)
	for (int s = 0; s < stackOfWhitePixels.size(); s++)
	{

		stackPoint = stackOfWhitePixels.getPixelAtPos(s);

		neighborsStack1.clear();
		neighborsStack2.clear();
		neighborsStack3.clear();
		neighborsStack4.clear();

		currentNeighborCounter1 = 0;
		currentNeighborCounter2 = 0;
		currentNeighborCounter3 = 0;
		// currentNeighborCounter4 = 0;

		// Count the closest neighbors of each pixel.
		// If there are 2 neighbor Pixels they are on a line or an L
		// If there are 3 or 4 neighbor Pixels the skeleton if braching off
		// which indicates that there might be a X or a T


		//遍历 offset1 (8邻域)，计算当前像素周围的邻近像素，统计白色像素的数量。
		for (int i = 0; i < offset1_size; i++)
		{

			int xpos = stackPoint.x + offset1[i][0];
			int ypos = stackPoint.y + offset1[i][1];
			bool checkLimits = checkLimitsInSubImage(xpos, ypos);

			if (checkLimits)
			{ // pixel is within subimage
				int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);
				if (img_skeleton1_copy[pixelpos] == 1)
				{
					currentNeighborCounter1++;
				}
			}
		} // END FOR (offset1)

		// 如果当前像素周围有两个白色相邻像素
		// 则进入循环，通过遍历 offset2 中的偏移量，计算当前像素的第二级邻近像素，并统计白色像素的数量。
		if (currentNeighborCounter1 == 2)
		{

			for (int i = 0; i < offset2_size; i++)
			{

				int xpos = stackPoint.x + offset2[i][0];
				int ypos = stackPoint.y + offset2[i][1];
				bool checkLimits = checkLimitsInSubImage(xpos, ypos);

				if (checkLimits)
				{ // pixel is within subimage
					int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);
					if (img_skeleton1_copy[pixelpos] == 1)
					{
						currentNeighborCounter2++;
					}
				}
			} // END FOR (offset2)

			if (currentNeighborCounter2 == 2)
			{

				for (int i = 0; i < offset2_size; i++)//5.31xiugai offset3
				{

					int xpos = stackPoint.x + offset2[i][0];//5.31xiugai offset3
					int ypos = stackPoint.y + offset2[i][1];
					bool checkLimits = checkLimitsInSubImage(xpos, ypos);

					if (checkLimits)
					{ // pixel is within subimage
						int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);
						if (img_skeleton1_copy[pixelpos] == 1)
						{
							currentNeighborCounter3++;
							tmp_stackPoint1.x = xpos;
							tmp_stackPoint1.y = ypos;
							neighborsStack1.push(tmp_stackPoint1);
						}
					}
				} // END FOR (offset3)

				if (currentNeighborCounter3 == 2)
				{

					// checking if the neighbor pixels are on a line or
					// have certain angle
					tmp_stackPoint1 = neighborsStack1.getPixelAtPos(0);
					tmp_stackPoint2 = neighborsStack1.getPixelAtPos(1);

					double value_neg_x = (double)(tmp_stackPoint1.x - stackPoint.x);
					double value_neg_y = (double)(tmp_stackPoint1.y - stackPoint.y);

					double value_pos_x = (double)(tmp_stackPoint2.x - stackPoint.x);
					double value_pos_y = (double)(tmp_stackPoint2.y - stackPoint.y);

					double length_neg = sqrt(value_neg_x * value_neg_x + value_neg_y * value_neg_y);
					double length_pos = sqrt(value_pos_x * value_pos_x + value_pos_y * value_pos_y);
					double dotproduct = (value_pos_x * value_neg_x) + (value_pos_y * value_neg_y);

					double normalized_result = dotproduct / (length_neg * length_pos);

					if (normalized_result >= -0.65f && normalized_result <= 0.4)
					{

						// TODO: FILTER THE landmark using the Shoulder plane projetion
						bool lm_too_close = true;
						// lm_too_close = filterTheLandmarkUsingShoulderPlane(CamFrm.tf_trunk_cameraoptical_OriginBasis,
						// 												   CamFrm.tf_trunk_cameraoptical_OriginVector,
						// 												   CamFrm.x_shoulder_filter_range,
						// 												   CamFrm.y_shoulder_filter_range,
						// 												   stackPoint.x,
						// 												   stackPoint.y);
						if (lm_too_close)
						{
							probableLs.push(stackPoint);
							HullPoint pt;
							pt.x = stackPoint.x;
							pt.y = stackPoint.y;
							CamFrm.L_landmarks.push_back(pt);


							cv::Mat color_bw;
    						cv::cvtColor(bw * 255, color_bw, cv::COLOR_GRAY2BGR);

							// 放大图像
							cv::Mat enlarged_color_bw;
							cv::resize(color_bw, enlarged_color_bw, cv::Size(), 3, 3, cv::INTER_LINEAR); // 2 倍放大

							// 在 bw 图像中显示 L 型角点
							for (const auto &pt : CamFrm.L_landmarks) {
								cv::circle(enlarged_color_bw, cv::Point(pt.x*3, pt.y*3), 1, cv::Scalar(0,0,255), -1); // 使用白色(255)绘制圆形标记
							}

							// 显示处理结果
							cv::imshow("L Landmarks", enlarged_color_bw);
							cv::waitKey(5); // 等待按键
														

							
							//对当前像素点周围的3x3范围内的像素进行遍历，并将这些像素标记为已处理（用2表示）
							for (int xx = -3; xx <= 3; xx++)
							{
								for (int yy = -3; yy <= 3; yy++)
								{

									int xpos = stackPoint.x + xx;
									int ypos = stackPoint.y + yy;
									bool checkLimits = checkLimitsInSubImage(xpos, ypos);

									if (checkLimits)
									{ // pixel is within subimage
										int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);
										if (img_skeleton1_copy[pixelpos] == 1)
										{
											img_skeleton1_copy[pixelpos] = 2;
										}
									}
								}
							}
						}
					}
				}
			}

		} // END if (currentNeighborCounter1==2)

		// 处理第一邻近像素为3个或4个，加入可能为T或X的栈中
		if (currentNeighborCounter1 == 4 || currentNeighborCounter1 == 3)
		{
			probableTsXs.push(stackPoint);
		}
	} // END	for (int s=0; s<whitePixelStack.size();s++)

	
	// 处理可能为T或X的栈
	for (int i = 0; i < probableTsXs.size(); i++)
	{

		PixelPosition pixel;
		pixel = probableTsXs.getPixelAtPos(i);

		int currentNeighborCounter1 = 0;
		int currentNeighborCounter2 = 0;
		int currentNeighborCounter3 = 0;

		neighborsStack1.clear();
		neighborsStack2.clear();
		neighborsStack3.clear();
		neighborsStack4.clear();

		for (int i = 0; i < offset4_size; i++)
		{

			int xpos = pixel.x + offset4[i][0];
			int ypos = pixel.y + offset4[i][1];

			bool checkLimits = checkLimitsInSubImage(xpos, ypos);

			if (checkLimits)
			{ // pixel is within subimage
				int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);

				if (img_skeleton1_copy[pixelpos] == 1)
				{
					currentNeighborCounter1++;
					tmp_stackPoint1.x = xpos;
					tmp_stackPoint1.y = ypos;
					neighborsStack1.push(tmp_stackPoint1);
				}
			}
		}

		// 4 neighbors Possible X
		if (currentNeighborCounter1 == 4)
		{ // X

			for (int i = 0; i < offset4_size; i++)
			{

				int xpos = pixel.x + offset4[i][0];
				int ypos = pixel.y + offset4[i][1];

				bool checkLimits = checkLimitsInSubImage(xpos, ypos);
				if (checkLimits)
				{ // pixel is within subimage

					int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);
					if (img_skeleton1_copy[pixelpos] == 1)
					{
						currentNeighborCounter2++;
						tmp_stackPoint1.x = xpos;
						tmp_stackPoint1.y = ypos;
						neighborsStack2.push(tmp_stackPoint1);
					}
				}
			}

			if (currentNeighborCounter2 == 4)
			{ // X

				for (int i = 0; i < offset3_size; i++)
				{

					int xpos = pixel.x + offset3[i][0];
					int ypos = pixel.y + offset3[i][1];

					bool checkLimits = checkLimitsInSubImage(xpos, ypos);

					if (checkLimits)
					{ // pixel is within subimage
						int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);

						if (img_skeleton1_copy[pixelpos] == 1)
						{
							currentNeighborCounter3++;
							tmp_stackPoint1.x = xpos;
							tmp_stackPoint1.y = ypos;
							neighborsStack3.push(tmp_stackPoint1);
						}
					}
				}

				if (currentNeighborCounter3 == 4)
				{ // X
					// TODO: FILTER THE landmark using the Shoulder plane projetion
					bool lm_too_close = true;
					// lm_too_close = filterTheLandmarkUsingShoulderPlane(CamFrm.tf_trunk_cameraoptical_OriginBasis,
					// 												   CamFrm.tf_trunk_cameraoptical_OriginVector,
					// 												   CamFrm.x_shoulder_filter_range,
					// 												   CamFrm.y_shoulder_filter_range,
					// 												   pixel.x,
					// 												   pixel.y);
					if (lm_too_close)
					{

						HullPoint pt;
						pt.x = pixel.x;
						pt.y = pixel.y;
						CamFrm.X_landmarks.push_back(pt);

						for (int xx = -5; xx <= 5; xx++)
						{
							for (int yy = -5; yy <= 5; yy++)
							{

								int xpos = pixel.x + xx;
								int ypos = pixel.y + yy;
								bool checkLimits = checkLimitsInSubImage(xpos, ypos);

								if (checkLimits)
								{ // pixel is within subimage
									int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);
									if (img_skeleton1_copy[pixelpos] == 1)
									{
										img_skeleton1_copy[pixelpos] = 4;
									}
								}
							}
						}
					}
				}
			}
		} // X detection done

		// 3 neighbors Possible T
		if (currentNeighborCounter1 == 3)
		{ // T

			for (int i = 0; i < offset4_size; i++)
			{

				int xpos = pixel.x + offset4[i][0];
				int ypos = pixel.y + offset4[i][1];

				bool checkLimits = checkLimitsInSubImage(xpos, ypos);
				if (checkLimits)
				{ // pixel is within subimage

					int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);
					if (img_skeleton1_copy[pixelpos] == 1)
					{
						currentNeighborCounter2++;
						tmp_stackPoint1.x = xpos;
						tmp_stackPoint1.y = ypos;
						neighborsStack2.push(tmp_stackPoint1);
					}
				}
			}

			if (currentNeighborCounter2 == 3)
			{ // T

				for (int i = 0; i < offset3_size; i++)
				{

					int xpos = pixel.x + offset3[i][0];
					int ypos = pixel.y + offset3[i][1];

					bool checkLimits = checkLimitsInSubImage(xpos, ypos);

					if (checkLimits)
					{ // pixel is within subimage
						int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);

						if (img_skeleton1_copy[pixelpos] == 1)
						{
							currentNeighborCounter3++;
							tmp_stackPoint1.x = xpos;
							tmp_stackPoint1.y = ypos;
							neighborsStack3.push(tmp_stackPoint1);
						}
					}
				}

				if (currentNeighborCounter3 == 3)
				{ // T

					// TODO: FILTER THE landmark using the Shoulder plane projetion
					bool lm_too_close = true;
					// lm_too_close = filterTheLandmarkUsingShoulderPlane(CamFrm.tf_trunk_cameraoptical_OriginBasis,
					// 												   CamFrm.tf_trunk_cameraoptical_OriginVector,
					// 												   CamFrm.x_shoulder_filter_range,
					// 												   CamFrm.y_shoulder_filter_range,
					// 												   pixel.x,
					// 												   pixel.y);
					if (lm_too_close)
					{
						detectedTs.push(pixel);
						HullPoint pt;
						pt.x = pixel.x;
						pt.y = pixel.y;
						CamFrm.T_landmarks.push_back(pt);

						for (int xx = -5; xx <= 5; xx++)
						{
							for (int yy = -5; yy <= 5; yy++)
							{

								int xpos = pixel.x + xx;
								int ypos = pixel.y + yy;
								bool checkLimits = checkLimitsInSubImage(xpos, ypos);

								if (checkLimits)
								{ // pixel is within subimage
									int pixelpos = (SUB_SAMPLING_WIDTH) * (ypos) + (xpos);
									if (img_skeleton1_copy[pixelpos] == 1)
									{
										img_skeleton1_copy[pixelpos] = 3;
									}
								}
							}
						}
					}
				}
			}
		} // T detection done

	} // END FOR	Refining

	// cv::Mat bw2 = cv::Mat(SUB_SAMPLING_HEIGHT, SUB_SAMPLING_WIDTH, CV_8UC1, img_skeleton1_copy) * 60;
	// for (const auto &mark : CamFrm.L_landmarks)
	// {
	// 	cv::circle(bw2, cv::Point(mark.x, mark.y), 5, 255);
	// }
	// for (const auto &mark : CamFrm.T_landmarks)
	// {
	// 	cv::circle(bw2, cv::Point(mark.x, mark.y), 10, 200);
	// }
	// for (const auto &mark : CamFrm.X_landmarks)
	// {
	// 	cv::circle(bw2, cv::Point(mark.x, mark.y), 20, 100);
	// }
	// if (CamFrm.L_landmarks.size() + CamFrm.T_landmarks.size() + CamFrm.X_landmarks.size() > 0)
	// 	cv::imwrite("/root/ros_ws/theimagesk.jpg", bw2);
	// ROS_INFO("landmarks: [%d    %d    %d]", (int)CamFrm.L_landmarks.size(), (int)CamFrm.T_landmarks.size(), (int)CamFrm.X_landmarks.size());

		//////////////////////////////////////////////////////////////////////////////////////////////
	// 	vector<HullPoint> tmp_landmarks;
	// 	for (int vs=0; vs<CamFrm.L_landmarks.size();vs++){
	// 		
	// 		int green_pixel_neighbors = 0;
	// 
	// 		for (int i=0;i<offset5_size;i++){
	// 
	// 			int xpos = CamFrm.L_landmarks[vs].x + offset5[i][0];
	// 			int ypos = CamFrm.L_landmarks[vs].y + offset5[i][1];
	// 			
	// 			bool checkLimits = checkLimitsInSubImage(xpos,ypos);
	// 					
	// 			if (checkLimits){//pixel is within subimage
	// 
	// 				int pixelpos = (SUB_SAMPLING_WIDTH)*(ypos) + (xpos);				
	// 				if(CamFrm.currentLUT.objects[CC_FIELD].subimg[pixelpos] >= 3){
	// 					green_pixel_neighbors ++;
	// 				}
	// 			}
	// 		}
	// 		
	// 		
	// 		if (green_pixel_neighbors >= 30 ){
	// 			tmp_landmarks.push_back(CamFrm.L_landmarks[vs]);
	// 		}		
	// 	}
	// 	
	// 	CamFrm.L_landmarks.clear();
	// 	for (int i=0; i<tmp_landmarks.size();i++){
	// 			CamFrm.L_landmarks.push_back(tmp_landmarks[i]);
	// 	}
	// 	tmp_landmarks.clear();


		
	// 	int const THE_LINE_LENGTH = 200;
	// 	//Detecting Lines Using Ts	
	// 	for(int i=0; i<detectedTs.size();i++){
	// 		
	// 			neighborsStack1.clear();
	// 			neighborsStack2.clear();
	// 			neighborsStack3.clear();
	// 			neighborsStack4.clear();
	// 			
	// 			Line1.clear();
	// 			Line2.clear();
	// 			Line3.clear();
	// 			
	// 			currentNeighborCounter1 = 0;
	// 			currentNeighborCounter2 = 0;
	// 			currentNeighborCounter3 = 0;
	// 			
	// 			PixelPosition pixel;
	// 			pixel = detectedTs.getPixelAtPos(i);		
	// 
	// 			
	// 			//Looking for 3 Neighbors (which were already marksed with a 3) 
	// 			for (int i=0;i<offset5_size;i++){
	// 				
	// 				int xpos = pixel.x + offset5[i][0];
	// 				int ypos = pixel.y + offset5[i][1];
	// 							
	// 				bool checkLimits = checkLimitsInSubImage(xpos,ypos);					
	// 				if (checkLimits){//pixel is within subimage
	// 
	// 					int pixelpos = (SUB_SAMPLING_WIDTH)*(ypos) + (xpos);					
	// 					
	// 					if(img_skeleton1_copy[pixelpos]==3){
	// 						currentNeighborCounter1 ++;
	// 						tmp_stackPoint1.x = xpos;
	// 						tmp_stackPoint1.y = ypos;
	// 						neighborsStack1.push(tmp_stackPoint1);				
	// 					}
	// 					
	// 					
	// 				}
	// 			}//END for			
	// 			
	// 			//ROS_INFO("Ts vecinos  %d %d %d", (int)neighborsStack1.size(), (int)neighborsStack2.size(), (int)neighborsStack3.size());
	// 			//ROS_INFO("Ts vecino 1  %d %d", (int)neighborsStack1.getPixelAtPos(0).x, neighborsStack1.getPixelAtPos(0).y);
	// 			//ROS_INFO("Ts vecino 2  %d %d", (int)neighborsStack1.getPixelAtPos(1).x, neighborsStack2.getPixelAtPos(1).y);
	// 			//ROS_INFO("Ts vecino 3  %d %d", (int)neighborsStack1.getPixelAtPos(2).x, neighborsStack3.getPixelAtPos(2).y);
	// 			
	// 			bool GROW_LINES_OUT_OF_THE_T_MARK = false;
	// 			if (neighborsStack1.size()==3){
	// 				
	// 				GROW_LINES_OUT_OF_THE_T_MARK = true;
	// 				neighborsStack2.push(neighborsStack1.getPixelAtPos(0));
	// 				neighborsStack3.push(neighborsStack1.getPixelAtPos(1));
	// 				neighborsStack4.push(neighborsStack1.getPixelAtPos(2));
	// 			}
	// 			
	// 			
	// 			//Analysis of the first pixel
	// 			if (GROW_LINES_OUT_OF_THE_T_MARK){
	// 				
	// 				bool stopLoop = false;
	// 				int totalNeighborElementsFound = 0;
	// 				
	// 							
	// 				tmp_stackPoint1 = neighborsStack2.getPixelAtPos(0);
	// 				
	// 				do {
	// 
	// 					currentNeighborCounter1=0;
	// 					
	// 					for (int i=0;i<offset1_size;i++){
	// 						
	// 						int xpos = tmp_stackPoint1.x + offset1[i][0];
	// 						int ypos = tmp_stackPoint1.y + offset1[i][1];
	// 						bool checkLimits = checkLimitsInSubImage(xpos,ypos);
	// 						
	// 						if (checkLimits){//pixel is within subimage
	// 
	// 							int pixelpos = (SUB_SAMPLING_WIDTH)*(ypos) + (xpos);
	// 							if(img_skeleton1_copy[pixelpos] == 1){
	// 								currentNeighborCounter1++;
	// 								tmp_stackPoint2.x = xpos;
	// 								tmp_stackPoint2.y = ypos;
	// 								img_skeleton1_copy[pixelpos] = 3;
	// 							}
	// 						}
	// 					}//END FOR (offset1)
	// 					
	// 					
	// 					if (currentNeighborCounter1==1 && totalNeighborElementsFound<THE_LINE_LENGTH){
	// 						
	// 					
	// 						totalNeighborElementsFound ++;
	// 
	// 						tmp_stackPoint1 = tmp_stackPoint2;
	// 
	// 						Line1.push(tmp_stackPoint2);
	// 						
	// 						HullPoint pt;
	// 						pt.x = tmp_stackPoint2.x;
	// 						pt.y = tmp_stackPoint2.y;
	// 						CamFrm.lines.push_back(pt);
	// 
	// 					}
	// 					else{
	// 						stopLoop = true;
	// 					}
	// 										
	// 				} while (stopLoop == false);
	// 			}//END	if (neighborsStack1.size() == 1)
	// 			
	// 
	// 			//Analysis of the second pixel
	// 			if (GROW_LINES_OUT_OF_THE_T_MARK){
	// 				
	// 				bool stopLoop = false;
	// 				int totalNeighborElementsFound = 0;
	// 				
	// 							
	// 				tmp_stackPoint1 = neighborsStack3.getPixelAtPos(0);
	// 				
	// 				do {
	// 
	// 					currentNeighborCounter1=0;
	// 					
	// 					for (int i=0;i<offset1_size;i++){
	// 						
	// 						int xpos = tmp_stackPoint1.x + offset1[i][0];
	// 						int ypos = tmp_stackPoint1.y + offset1[i][1];
	// 						bool checkLimits = checkLimitsInSubImage(xpos,ypos);
	// 						
	// 						if (checkLimits){//pixel is within subimage
	// 
	// 							int pixelpos = (SUB_SAMPLING_WIDTH)*(ypos) + (xpos);
	// 							if(img_skeleton1_copy[pixelpos] == 1){
	// 								currentNeighborCounter1++;
	// 								tmp_stackPoint2.x = xpos;
	// 								tmp_stackPoint2.y = ypos;
	// 								img_skeleton1_copy[pixelpos] = 3;
	// 							}
	// 						}
	// 					}//END FOR (offset1)
	// 					
	// 					
	// 					if (currentNeighborCounter1==1 && totalNeighborElementsFound<THE_LINE_LENGTH){
	// 						
	// 						totalNeighborElementsFound ++;					
	// 	
	// 						tmp_stackPoint1 = tmp_stackPoint2;
	// 						
	// 						Line2.push(tmp_stackPoint2);
	// 						
	// 							HullPoint pt;
	// 							pt.x = tmp_stackPoint2.x;
	// 							pt.y = tmp_stackPoint2.y;
	// 							CamFrm.lines.push_back(pt);				
	// 							
	// 					}
	// 					else{
	// 						stopLoop = true;
	// 					}
	// 										
	// 				} while (stopLoop == false);
	// 			}//END	if (neighborsStack1.size() == 1)
	// 
	// 			
	// 			//Analysis of the second pixel
	// 			if (GROW_LINES_OUT_OF_THE_T_MARK){
	// 				
	// 				bool stopLoop = false;
	// 				int totalNeighborElementsFound = 0;
	// 				
	// 							
	// 				tmp_stackPoint1 = neighborsStack4.getPixelAtPos(0);
	// 				
	// 				do {
	// 
	// 					currentNeighborCounter1=0;
	// 					
	// 					for (int i=0;i<offset1_size;i++){
	// 						
	// 						int xpos = tmp_stackPoint1.x + offset1[i][0];
	// 						int ypos = tmp_stackPoint1.y + offset1[i][1];
	// 						bool checkLimits = checkLimitsInSubImage(xpos,ypos);
	// 						
	// 						if (checkLimits){//pixel is within subimage
	// 
	// 							int pixelpos = (SUB_SAMPLING_WIDTH)*(ypos) + (xpos);
	// 							if(img_skeleton1_copy[pixelpos] == 1){
	// 								currentNeighborCounter1++;
	// 								tmp_stackPoint2.x = xpos;
	// 								tmp_stackPoint2.y = ypos;
	// 								img_skeleton1_copy[pixelpos] = 3;
	// 							}
	// 						}
	// 					}//END FOR (offset1)
	// 					
	// 					
	// 					if (currentNeighborCounter1==1 && totalNeighborElementsFound<THE_LINE_LENGTH){						
	// 						totalNeighborElementsFound ++;					
	// 	
	// 						tmp_stackPoint1 = tmp_stackPoint2;
	// 						
	// 							HullPoint pt;
	// 							pt.x = tmp_stackPoint2.x;
	// 							pt.y = tmp_stackPoint2.y;
	// 							CamFrm.lines.push_back(pt);				
	// 							
	// 					}
	// 					else{
	// 						stopLoop = true;
	// 					}
	// 										
	// 				} while (stopLoop == false);
	// 			}//END	if (neighborsStack1.size() == 1)
	// 
	// 
	// 	}
	// 	//END detecting Lines Using Ts
		
		
		//cv::Mat bw2 = cv::Mat(SUB_SAMPLING_HEIGHT,SUB_SAMPLING_WIDTH,CV_8U, img_skeleton1_copy)*60;	
		//cv::imshow("theimagesk", bw2 );
		//ROS_INFO("elementos %d    %d", (int)probableLs.size(), (int)probableTsXs.size());

	

} // END findLandmarks_and_Lines



//
// Function for thinning the given binary image
// @param  im  Binary image with range = 0-255
//
void soccervision::thinningWithGuoHallAlgorithm(cv::Mat &im)
{
	im /= 255;

	cv::Mat prev = cv::Mat::zeros(im.size(), CV_8UC1);
	cv::Mat diff;

	int contador = 0;
	int MAX_NUMBER_OF_ITERATIONS = 6;
	do
	{
		executeGuoHallIteration(im, 0);
		executeGuoHallIteration(im, 1);
		cv::absdiff(im, prev, diff);
		im.copyTo(prev);
		contador++;
		if (contador > MAX_NUMBER_OF_ITERATIONS)
			break;
	} while (cv::countNonZero(diff) > 0);

	// im *= 255;
	// ROS_INFO("iteraciones %d", contador);
}

void soccervision::executeGuoHallIteration(cv::Mat &im, int iter)
{
	cv::Mat marker = cv::Mat::zeros(im.size(), CV_8UC1);

	for (int i = 1; i < im.rows; i++)
	{
		for (int j = 1; j < im.cols; j++)
		{
			uchar p2 = im.at<uchar>(i - 1, j);
			uchar p3 = im.at<uchar>(i - 1, j + 1);
			uchar p4 = im.at<uchar>(i, j + 1);
			uchar p5 = im.at<uchar>(i + 1, j + 1);
			uchar p6 = im.at<uchar>(i + 1, j);
			uchar p7 = im.at<uchar>(i + 1, j - 1);
			uchar p8 = im.at<uchar>(i, j - 1);
			uchar p9 = im.at<uchar>(i - 1, j - 1);

			int C = (!p2 & (p3 | p4)) + (!p4 & (p5 | p6)) +
					(!p6 & (p7 | p8)) + (!p8 & (p9 | p2));

			int N1 = (p9 | p2) + (p3 | p4) + (p5 | p6) + (p7 | p8);

			int N2 = (p2 | p3) + (p4 | p5) + (p6 | p7) + (p8 | p9);

			int N = N1 < N2 ? N1 : N2;

			int m = iter == 0 ? ((p6 | p7 | !p9) & p8) : ((p2 | p3 | !p5) & p4);

			if ((C == 1) && (N >= 2 && N <= 3) & (m == 0))
				marker.at<uchar>(i, j) = 1;
		}
	}

	im &= ~marker;
}
