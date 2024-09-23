#pragma once

#include "localization_pkg/globaldefinitions.h"

//--------------------------------------------------------------------
// check x,y limits
inline bool checkLimitsInSubImage(int x, int y)
{
  if (x < 0 || y < 0)
    return false;

  if (x >= SUB_SAMPLING_WIDTH || y >= SUB_SAMPLING_HEIGHT)
    return false;

  return true;
}
