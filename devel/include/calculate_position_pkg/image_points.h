// Generated by gencpp from file calculate_position_pkg/image_points.msg
// DO NOT EDIT!


#ifndef CALCULATE_POSITION_PKG_MESSAGE_IMAGE_POINTS_H
#define CALCULATE_POSITION_PKG_MESSAGE_IMAGE_POINTS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace calculate_position_pkg
{
template <class ContainerAllocator>
struct image_points_
{
  typedef image_points_<ContainerAllocator> Type;

  image_points_()
    : ball_xyxy()
    , goalpost_xyxy()
    , robot_xyxy()
    , L_mark_xyxy()
    , T_mark_xyxy()
    , X_mark_xyxy()  {
    }
  image_points_(const ContainerAllocator& _alloc)
    : ball_xyxy(_alloc)
    , goalpost_xyxy(_alloc)
    , robot_xyxy(_alloc)
    , L_mark_xyxy(_alloc)
    , T_mark_xyxy(_alloc)
    , X_mark_xyxy(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _ball_xyxy_type;
  _ball_xyxy_type ball_xyxy;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _goalpost_xyxy_type;
  _goalpost_xyxy_type goalpost_xyxy;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _robot_xyxy_type;
  _robot_xyxy_type robot_xyxy;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _L_mark_xyxy_type;
  _L_mark_xyxy_type L_mark_xyxy;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _T_mark_xyxy_type;
  _T_mark_xyxy_type T_mark_xyxy;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _X_mark_xyxy_type;
  _X_mark_xyxy_type X_mark_xyxy;





  typedef boost::shared_ptr< ::calculate_position_pkg::image_points_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::calculate_position_pkg::image_points_<ContainerAllocator> const> ConstPtr;

}; // struct image_points_

typedef ::calculate_position_pkg::image_points_<std::allocator<void> > image_points;

typedef boost::shared_ptr< ::calculate_position_pkg::image_points > image_pointsPtr;
typedef boost::shared_ptr< ::calculate_position_pkg::image_points const> image_pointsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::calculate_position_pkg::image_points_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::calculate_position_pkg::image_points_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::calculate_position_pkg::image_points_<ContainerAllocator1> & lhs, const ::calculate_position_pkg::image_points_<ContainerAllocator2> & rhs)
{
  return lhs.ball_xyxy == rhs.ball_xyxy &&
    lhs.goalpost_xyxy == rhs.goalpost_xyxy &&
    lhs.robot_xyxy == rhs.robot_xyxy &&
    lhs.L_mark_xyxy == rhs.L_mark_xyxy &&
    lhs.T_mark_xyxy == rhs.T_mark_xyxy &&
    lhs.X_mark_xyxy == rhs.X_mark_xyxy;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::calculate_position_pkg::image_points_<ContainerAllocator1> & lhs, const ::calculate_position_pkg::image_points_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace calculate_position_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::calculate_position_pkg::image_points_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::calculate_position_pkg::image_points_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::calculate_position_pkg::image_points_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::calculate_position_pkg::image_points_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::calculate_position_pkg::image_points_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::calculate_position_pkg::image_points_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::calculate_position_pkg::image_points_<ContainerAllocator> >
{
  static const char* value()
  {
    return "df6d256ca807079571778bb4a61cea15";
  }

  static const char* value(const ::calculate_position_pkg::image_points_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdf6d256ca8070795ULL;
  static const uint64_t static_value2 = 0x71778bb4a61cea15ULL;
};

template<class ContainerAllocator>
struct DataType< ::calculate_position_pkg::image_points_<ContainerAllocator> >
{
  static const char* value()
  {
    return "calculate_position_pkg/image_points";
  }

  static const char* value(const ::calculate_position_pkg::image_points_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::calculate_position_pkg::image_points_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32[] ball_xyxy\n"
"int32[] goalpost_xyxy\n"
"int32[] robot_xyxy\n"
"int32[] L_mark_xyxy\n"
"int32[] T_mark_xyxy\n"
"int32[] X_mark_xyxy\n"
;
  }

  static const char* value(const ::calculate_position_pkg::image_points_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::calculate_position_pkg::image_points_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.ball_xyxy);
      stream.next(m.goalpost_xyxy);
      stream.next(m.robot_xyxy);
      stream.next(m.L_mark_xyxy);
      stream.next(m.T_mark_xyxy);
      stream.next(m.X_mark_xyxy);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct image_points_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::calculate_position_pkg::image_points_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::calculate_position_pkg::image_points_<ContainerAllocator>& v)
  {
    s << indent << "ball_xyxy[]" << std::endl;
    for (size_t i = 0; i < v.ball_xyxy.size(); ++i)
    {
      s << indent << "  ball_xyxy[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.ball_xyxy[i]);
    }
    s << indent << "goalpost_xyxy[]" << std::endl;
    for (size_t i = 0; i < v.goalpost_xyxy.size(); ++i)
    {
      s << indent << "  goalpost_xyxy[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.goalpost_xyxy[i]);
    }
    s << indent << "robot_xyxy[]" << std::endl;
    for (size_t i = 0; i < v.robot_xyxy.size(); ++i)
    {
      s << indent << "  robot_xyxy[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.robot_xyxy[i]);
    }
    s << indent << "L_mark_xyxy[]" << std::endl;
    for (size_t i = 0; i < v.L_mark_xyxy.size(); ++i)
    {
      s << indent << "  L_mark_xyxy[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.L_mark_xyxy[i]);
    }
    s << indent << "T_mark_xyxy[]" << std::endl;
    for (size_t i = 0; i < v.T_mark_xyxy.size(); ++i)
    {
      s << indent << "  T_mark_xyxy[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.T_mark_xyxy[i]);
    }
    s << indent << "X_mark_xyxy[]" << std::endl;
    for (size_t i = 0; i < v.X_mark_xyxy.size(); ++i)
    {
      s << indent << "  X_mark_xyxy[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.X_mark_xyxy[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CALCULATE_POSITION_PKG_MESSAGE_IMAGE_POINTS_H
