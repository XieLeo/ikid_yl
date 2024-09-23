// Generated by gencpp from file site_inspection/robot_head_pos.msg
// DO NOT EDIT!


#ifndef SITE_INSPECTION_MESSAGE_ROBOT_HEAD_POS_H
#define SITE_INSPECTION_MESSAGE_ROBOT_HEAD_POS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace site_inspection
{
template <class ContainerAllocator>
struct robot_head_pos_
{
  typedef robot_head_pos_<ContainerAllocator> Type;

  robot_head_pos_()
    : neck_rotation_theta(0.0)
    , neck_front_swing_theta(0.0)  {
    }
  robot_head_pos_(const ContainerAllocator& _alloc)
    : neck_rotation_theta(0.0)
    , neck_front_swing_theta(0.0)  {
  (void)_alloc;
    }



   typedef double _neck_rotation_theta_type;
  _neck_rotation_theta_type neck_rotation_theta;

   typedef double _neck_front_swing_theta_type;
  _neck_front_swing_theta_type neck_front_swing_theta;





  typedef boost::shared_ptr< ::site_inspection::robot_head_pos_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::site_inspection::robot_head_pos_<ContainerAllocator> const> ConstPtr;

}; // struct robot_head_pos_

typedef ::site_inspection::robot_head_pos_<std::allocator<void> > robot_head_pos;

typedef boost::shared_ptr< ::site_inspection::robot_head_pos > robot_head_posPtr;
typedef boost::shared_ptr< ::site_inspection::robot_head_pos const> robot_head_posConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::site_inspection::robot_head_pos_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::site_inspection::robot_head_pos_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::site_inspection::robot_head_pos_<ContainerAllocator1> & lhs, const ::site_inspection::robot_head_pos_<ContainerAllocator2> & rhs)
{
  return lhs.neck_rotation_theta == rhs.neck_rotation_theta &&
    lhs.neck_front_swing_theta == rhs.neck_front_swing_theta;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::site_inspection::robot_head_pos_<ContainerAllocator1> & lhs, const ::site_inspection::robot_head_pos_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace site_inspection

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::site_inspection::robot_head_pos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::site_inspection::robot_head_pos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::site_inspection::robot_head_pos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::site_inspection::robot_head_pos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::site_inspection::robot_head_pos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::site_inspection::robot_head_pos_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::site_inspection::robot_head_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1abf8b03136e17e9236b9db881fa8e69";
  }

  static const char* value(const ::site_inspection::robot_head_pos_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1abf8b03136e17e9ULL;
  static const uint64_t static_value2 = 0x236b9db881fa8e69ULL;
};

template<class ContainerAllocator>
struct DataType< ::site_inspection::robot_head_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "site_inspection/robot_head_pos";
  }

  static const char* value(const ::site_inspection::robot_head_pos_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::site_inspection::robot_head_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 neck_rotation_theta  # 颈旋转关节角度\n"
"float64 neck_front_swing_theta # 颈前摆关节角度\n"
;
  }

  static const char* value(const ::site_inspection::robot_head_pos_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::site_inspection::robot_head_pos_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.neck_rotation_theta);
      stream.next(m.neck_front_swing_theta);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct robot_head_pos_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::site_inspection::robot_head_pos_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::site_inspection::robot_head_pos_<ContainerAllocator>& v)
  {
    s << indent << "neck_rotation_theta: ";
    Printer<double>::stream(s, indent + "  ", v.neck_rotation_theta);
    s << indent << "neck_front_swing_theta: ";
    Printer<double>::stream(s, indent + "  ", v.neck_front_swing_theta);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SITE_INSPECTION_MESSAGE_ROBOT_HEAD_POS_H
