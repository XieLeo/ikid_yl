; Auto-generated. Do not edit!


(cl:in-package localization_pkg-msg)


;//! \htmlinclude Detections.msg.html

(cl:defclass <Detections> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (objects
    :reader objects
    :initarg :objects
    :type (cl:vector localization_pkg-msg:ObjectDetection)
   :initform (cl:make-array 0 :element-type 'localization_pkg-msg:ObjectDetection :initial-element (cl:make-instance 'localization_pkg-msg:ObjectDetection)))
   (lines
    :reader lines
    :initarg :lines
    :type (cl:vector localization_pkg-msg:LineDetection)
   :initform (cl:make-array 0 :element-type 'localization_pkg-msg:LineDetection :initial-element (cl:make-instance 'localization_pkg-msg:LineDetection)))
   (obstacles
    :reader obstacles
    :initarg :obstacles
    :type (cl:vector localization_pkg-msg:ObstacleDetection)
   :initform (cl:make-array 0 :element-type 'localization_pkg-msg:ObstacleDetection :initial-element (cl:make-instance 'localization_pkg-msg:ObstacleDetection))))
)

(cl:defclass Detections (<Detections>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detections>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detections)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization_pkg-msg:<Detections> is deprecated: use localization_pkg-msg:Detections instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_pkg-msg:header-val is deprecated.  Use localization_pkg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_pkg-msg:objects-val is deprecated.  Use localization_pkg-msg:objects instead.")
  (objects m))

(cl:ensure-generic-function 'lines-val :lambda-list '(m))
(cl:defmethod lines-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_pkg-msg:lines-val is deprecated.  Use localization_pkg-msg:lines instead.")
  (lines m))

(cl:ensure-generic-function 'obstacles-val :lambda-list '(m))
(cl:defmethod obstacles-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_pkg-msg:obstacles-val is deprecated.  Use localization_pkg-msg:obstacles instead.")
  (obstacles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detections>) ostream)
  "Serializes a message object of type '<Detections>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lines))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'lines))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detections>) istream)
  "Deserializes a message object of type '<Detections>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'localization_pkg-msg:ObjectDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lines) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lines)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'localization_pkg-msg:LineDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'localization_pkg-msg:ObstacleDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detections>)))
  "Returns string type for a message object of type '<Detections>"
  "localization_pkg/Detections")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detections)))
  "Returns string type for a message object of type 'Detections"
  "localization_pkg/Detections")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detections>)))
  "Returns md5sum for a message object of type '<Detections>"
  "f5a76a8205484ff68b3fae6a670e757f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detections)))
  "Returns md5sum for a message object of type 'Detections"
  "f5a76a8205484ff68b3fae6a670e757f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detections>)))
  "Returns full string definition for message of type '<Detections>"
  (cl:format cl:nil "Header header~%ObjectDetection[] objects~%LineDetection[] lines~%ObstacleDetection[] obstacles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: localization_pkg/ObjectDetection~%geometry_msgs/Pose2D pose        # Pose~%uint8 type                       # Type (see field_model::WorldObject::Type)~%float32 confidence               # confidence 0..1~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: localization_pkg/LineDetection~%float32 x1~%float32 y1~%float32 x2~%float32 y2~%================================================================================~%MSG: localization_pkg/ObstacleDetection~%geometry_msgs/Point left_lower_corner~%geometry_msgs/Point right_lower_corner~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detections)))
  "Returns full string definition for message of type 'Detections"
  (cl:format cl:nil "Header header~%ObjectDetection[] objects~%LineDetection[] lines~%ObstacleDetection[] obstacles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: localization_pkg/ObjectDetection~%geometry_msgs/Pose2D pose        # Pose~%uint8 type                       # Type (see field_model::WorldObject::Type)~%float32 confidence               # confidence 0..1~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: localization_pkg/LineDetection~%float32 x1~%float32 y1~%float32 x2~%float32 y2~%================================================================================~%MSG: localization_pkg/ObstacleDetection~%geometry_msgs/Point left_lower_corner~%geometry_msgs/Point right_lower_corner~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detections>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lines) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detections>))
  "Converts a ROS message object to a list"
  (cl:list 'Detections
    (cl:cons ':header (header msg))
    (cl:cons ':objects (objects msg))
    (cl:cons ':lines (lines msg))
    (cl:cons ':obstacles (obstacles msg))
))
