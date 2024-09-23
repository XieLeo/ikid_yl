
#pragma once

// Asuming that the original image is 800x600 (WxH)
#define ORG_IMAGE_WIDTH 800
#define ORG_IMAGE_HEIGHT 600
#define SUB_SAMPLING_PARAMETER 4//edit5.31
#define SUB_SAMPLING_WIDTH ORG_IMAGE_WIDTH / SUB_SAMPLING_PARAMETER
#define SUB_SAMPLING_HEIGHT ORG_IMAGE_HEIGHT / SUB_SAMPLING_PARAMETER
#define SUB_SAMPLING_NUM_PIXELS SUB_SAMPLING_WIDTH *SUB_SAMPLING_HEIGHT
#define MAX_STACK_SIZE (SUB_SAMPLING_WIDTH * SUB_SAMPLING_HEIGHT)

// LUT variables
#define LUT_HEIGHT 256
#define LUT_WIDTH 256

// Defining ColorClasses
#define CC_BLACK 0
#define CC_WHITE 1
#define CC_FIELD 2
#define CC_BALL 3
// ball is white
// #define CC_BALL 1

#define CC_GOAL 4
// goal is white
// #define CC_GOAL 1

#define CC_LAST 4
#define CC_NO_CLASS 255

#define PURE_WHITE_Y 10
#define PURE_BLACK_Y 245
