# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from localization_pkg/Particle.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg

class Particle(genpy.Message):
  _md5sum = "9d383f6b0a152c96c1ec3decf6abd3d3"
  _type = "localization_pkg/Particle"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """geometry_msgs/Pose2D pose
float32 weight

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
"""
  __slots__ = ['pose','weight']
  _slot_types = ['geometry_msgs/Pose2D','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       pose,weight

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Particle, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.pose is None:
        self.pose = geometry_msgs.msg.Pose2D()
      if self.weight is None:
        self.weight = 0.
    else:
      self.pose = geometry_msgs.msg.Pose2D()
      self.weight = 0.

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
      buff.write(_get_struct_3df().pack(_x.pose.x, _x.pose.y, _x.pose.theta, _x.weight))
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
      if self.pose is None:
        self.pose = geometry_msgs.msg.Pose2D()
      end = 0
      _x = self
      start = end
      end += 28
      (_x.pose.x, _x.pose.y, _x.pose.theta, _x.weight,) = _get_struct_3df().unpack(str[start:end])
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
      buff.write(_get_struct_3df().pack(_x.pose.x, _x.pose.y, _x.pose.theta, _x.weight))
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
      if self.pose is None:
        self.pose = geometry_msgs.msg.Pose2D()
      end = 0
      _x = self
      start = end
      end += 28
      (_x.pose.x, _x.pose.y, _x.pose.theta, _x.weight,) = _get_struct_3df().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3df = None
def _get_struct_3df():
    global _struct_3df
    if _struct_3df is None:
        _struct_3df = struct.Struct("<3df")
    return _struct_3df
