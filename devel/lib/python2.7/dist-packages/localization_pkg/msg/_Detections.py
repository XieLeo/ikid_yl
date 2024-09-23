# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from localization_pkg/Detections.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import localization_pkg.msg
import std_msgs.msg

class Detections(genpy.Message):
  _md5sum = "f5a76a8205484ff68b3fae6a670e757f"
  _type = "localization_pkg/Detections"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header
ObjectDetection[] objects
LineDetection[] lines
ObstacleDetection[] obstacles

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: localization_pkg/ObjectDetection
geometry_msgs/Pose2D pose        # Pose
uint8 type                       # Type (see field_model::WorldObject::Type)
float32 confidence               # confidence 0..1

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

================================================================================
MSG: localization_pkg/LineDetection
float32 x1
float32 y1
float32 x2
float32 y2
================================================================================
MSG: localization_pkg/ObstacleDetection
geometry_msgs/Point left_lower_corner
geometry_msgs/Point right_lower_corner
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
"""
  __slots__ = ['header','objects','lines','obstacles']
  _slot_types = ['std_msgs/Header','localization_pkg/ObjectDetection[]','localization_pkg/LineDetection[]','localization_pkg/ObstacleDetection[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,objects,lines,obstacles

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Detections, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.objects is None:
        self.objects = []
      if self.lines is None:
        self.lines = []
      if self.obstacles is None:
        self.obstacles = []
    else:
      self.header = std_msgs.msg.Header()
      self.objects = []
      self.lines = []
      self.obstacles = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.objects)
      buff.write(_struct_I.pack(length))
      for val1 in self.objects:
        _v1 = val1.pose
        _x = _v1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.theta))
        _x = val1
        buff.write(_get_struct_Bf().pack(_x.type, _x.confidence))
      length = len(self.lines)
      buff.write(_struct_I.pack(length))
      for val1 in self.lines:
        _x = val1
        buff.write(_get_struct_4f().pack(_x.x1, _x.y1, _x.x2, _x.y2))
      length = len(self.obstacles)
      buff.write(_struct_I.pack(length))
      for val1 in self.obstacles:
        _v2 = val1.left_lower_corner
        _x = _v2
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _v3 = val1.right_lower_corner
        _x = _v3
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.objects is None:
        self.objects = None
      if self.lines is None:
        self.lines = None
      if self.obstacles is None:
        self.obstacles = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.objects = []
      for i in range(0, length):
        val1 = localization_pkg.msg.ObjectDetection()
        _v4 = val1.pose
        _x = _v4
        start = end
        end += 24
        (_x.x, _x.y, _x.theta,) = _get_struct_3d().unpack(str[start:end])
        _x = val1
        start = end
        end += 5
        (_x.type, _x.confidence,) = _get_struct_Bf().unpack(str[start:end])
        self.objects.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.lines = []
      for i in range(0, length):
        val1 = localization_pkg.msg.LineDetection()
        _x = val1
        start = end
        end += 16
        (_x.x1, _x.y1, _x.x2, _x.y2,) = _get_struct_4f().unpack(str[start:end])
        self.lines.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.obstacles = []
      for i in range(0, length):
        val1 = localization_pkg.msg.ObstacleDetection()
        _v5 = val1.left_lower_corner
        _x = _v5
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        _v6 = val1.right_lower_corner
        _x = _v6
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.obstacles.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.objects)
      buff.write(_struct_I.pack(length))
      for val1 in self.objects:
        _v7 = val1.pose
        _x = _v7
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.theta))
        _x = val1
        buff.write(_get_struct_Bf().pack(_x.type, _x.confidence))
      length = len(self.lines)
      buff.write(_struct_I.pack(length))
      for val1 in self.lines:
        _x = val1
        buff.write(_get_struct_4f().pack(_x.x1, _x.y1, _x.x2, _x.y2))
      length = len(self.obstacles)
      buff.write(_struct_I.pack(length))
      for val1 in self.obstacles:
        _v8 = val1.left_lower_corner
        _x = _v8
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _v9 = val1.right_lower_corner
        _x = _v9
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.objects is None:
        self.objects = None
      if self.lines is None:
        self.lines = None
      if self.obstacles is None:
        self.obstacles = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.objects = []
      for i in range(0, length):
        val1 = localization_pkg.msg.ObjectDetection()
        _v10 = val1.pose
        _x = _v10
        start = end
        end += 24
        (_x.x, _x.y, _x.theta,) = _get_struct_3d().unpack(str[start:end])
        _x = val1
        start = end
        end += 5
        (_x.type, _x.confidence,) = _get_struct_Bf().unpack(str[start:end])
        self.objects.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.lines = []
      for i in range(0, length):
        val1 = localization_pkg.msg.LineDetection()
        _x = val1
        start = end
        end += 16
        (_x.x1, _x.y1, _x.x2, _x.y2,) = _get_struct_4f().unpack(str[start:end])
        self.lines.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.obstacles = []
      for i in range(0, length):
        val1 = localization_pkg.msg.ObstacleDetection()
        _v11 = val1.left_lower_corner
        _x = _v11
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        _v12 = val1.right_lower_corner
        _x = _v12
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.obstacles.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
_struct_4f = None
def _get_struct_4f():
    global _struct_4f
    if _struct_4f is None:
        _struct_4f = struct.Struct("<4f")
    return _struct_4f
_struct_Bf = None
def _get_struct_Bf():
    global _struct_Bf
    if _struct_Bf is None:
        _struct_Bf = struct.Struct("<Bf")
    return _struct_Bf
