// Generated by gencpp from file config_server/GetParameterResponse.msg
// DO NOT EDIT!


#ifndef CONFIG_SERVER_MESSAGE_GETPARAMETERRESPONSE_H
#define CONFIG_SERVER_MESSAGE_GETPARAMETERRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace config_server
{
template <class ContainerAllocator>
struct GetParameterResponse_
{
  typedef GetParameterResponse_<ContainerAllocator> Type;

  GetParameterResponse_()
    : value()  {
    }
  GetParameterResponse_(const ContainerAllocator& _alloc)
    : value(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _value_type;
  _value_type value;





  typedef boost::shared_ptr< ::config_server::GetParameterResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::config_server::GetParameterResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetParameterResponse_

typedef ::config_server::GetParameterResponse_<std::allocator<void> > GetParameterResponse;

typedef boost::shared_ptr< ::config_server::GetParameterResponse > GetParameterResponsePtr;
typedef boost::shared_ptr< ::config_server::GetParameterResponse const> GetParameterResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::config_server::GetParameterResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::config_server::GetParameterResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::config_server::GetParameterResponse_<ContainerAllocator1> & lhs, const ::config_server::GetParameterResponse_<ContainerAllocator2> & rhs)
{
  return lhs.value == rhs.value;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::config_server::GetParameterResponse_<ContainerAllocator1> & lhs, const ::config_server::GetParameterResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace config_server

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::config_server::GetParameterResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::config_server::GetParameterResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::config_server::GetParameterResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::config_server::GetParameterResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::config_server::GetParameterResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::config_server::GetParameterResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::config_server::GetParameterResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "64e58419496c7248b4ef25731f88b8c3";
  }

  static const char* value(const ::config_server::GetParameterResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x64e58419496c7248ULL;
  static const uint64_t static_value2 = 0xb4ef25731f88b8c3ULL;
};

template<class ContainerAllocator>
struct DataType< ::config_server::GetParameterResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "config_server/GetParameterResponse";
  }

  static const char* value(const ::config_server::GetParameterResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::config_server::GetParameterResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string value\n"
;
  }

  static const char* value(const ::config_server::GetParameterResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::config_server::GetParameterResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.value);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetParameterResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::config_server::GetParameterResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::config_server::GetParameterResponse_<ContainerAllocator>& v)
  {
    s << indent << "value: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.value);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONFIG_SERVER_MESSAGE_GETPARAMETERRESPONSE_H
