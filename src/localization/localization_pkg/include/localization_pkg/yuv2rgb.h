#pragma once
//--------------------------------------------------------------------
// saturate input into [0, 255]
inline unsigned char saturateValue(float f)
{
	return (unsigned char)(f >= 255 ? 255 : (f < 0 ? 0 : f));
}
//--------------------------------------------------------------------

inline void yuv2rgb(unsigned char yuvimg[], unsigned char rgbbuffer[], int W, int H)
{

	for (int i = 0; i < (W * H * 3); i += 3)
	{

		rgbbuffer[i + 2] = saturateValue(yuvimg[i] + 1.402f * (yuvimg[i + 2] - 128));
		rgbbuffer[i + 1] = saturateValue(yuvimg[i] - 0.34414f * (yuvimg[i + 1] - 128) - 0.71414f * (yuvimg[i + 2] - 128));
		rgbbuffer[i] = saturateValue(yuvimg[i] + 1.772f * (yuvimg[i + 1] - 128));
	}
}
// https://stackoverflow.com/questions/49964259/cpp-rgb-to-yuv422-conversion
// https://developer.aliyun.com/article/519681
void rgb2yuyv(const cv::Mat &rgb, cv::Mat &yuyv)
{
	assert(rgb.size() == yuyv.size() &&
		   rgb.depth() == CV_8U &&
		   rgb.channels() == 3 &&
		   yuyv.depth() == CV_8U &&
		   yuyv.channels() == 2);
	for (int ih = 0; ih < rgb.rows; ih++)
	{
		const uint8_t *rgbRowPtr = rgb.ptr<uint8_t>(ih);
		uint8_t *yuvRowPtr = yuyv.ptr<uint8_t>(ih);

		for (int iw = 0; iw < rgb.cols; iw = iw + 2)
		{
			const int rgbColIdxBytes = iw * rgb.elemSize();
			const int yuvColIdxBytes = iw * yuyv.elemSize();

			const uint8_t R1 = rgbRowPtr[rgbColIdxBytes + 0];
			const uint8_t G1 = rgbRowPtr[rgbColIdxBytes + 1];
			const uint8_t B1 = rgbRowPtr[rgbColIdxBytes + 2];
			const uint8_t R2 = rgbRowPtr[rgbColIdxBytes + 3];
			const uint8_t G2 = rgbRowPtr[rgbColIdxBytes + 4];
			const uint8_t B2 = rgbRowPtr[rgbColIdxBytes + 5];

			const int Y = (0.257f * R1) + (0.504f * G1) + (0.098f * B1) + 16.0f;
			const int U = -(0.148f * R1) - (0.291f * G1) + (0.439f * B1) + 128.0f;
			const int V = (0.439f * R1) - (0.368f * G1) - (0.071f * B1) + 128.0f;
			const int Y2 = (0.257f * R2) + (0.504f * G2) + (0.098f * B2) + 16.0f;

			yuvRowPtr[yuvColIdxBytes + 0] = cv::saturate_cast<uint8_t>(Y);
			yuvRowPtr[yuvColIdxBytes + 1] = cv::saturate_cast<uint8_t>(U);
			yuvRowPtr[yuvColIdxBytes + 2] = cv::saturate_cast<uint8_t>(Y2);
			yuvRowPtr[yuvColIdxBytes + 3] = cv::saturate_cast<uint8_t>(V);
		}
	}
}