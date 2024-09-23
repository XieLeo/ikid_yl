; Auto-generated. Do not edit!


(cl:in-package localization_pkg-msg)


;//! \htmlinclude ObstacleDetection.msg.html

(cl:defclass <ObstacleDetection> (roslisp-msg-protocol:ros-message)
  ((left_lower_corner
    :reader left_lower_corner
    :initarg :left_lower_corner
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (right_lower_corner
    :reader right_lower_corner
    :initarg :right_lower_corner
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass ObstacleDetection (<ObstacleDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization_pkg-msg:<ObstacleDetection> is deprecated: use localization_pkg-msg:ObstacleDetection instead.")))

(cl:ensure-generic-function 'left_lower_corner-val :lambda-list '(m))
(cl:defmethod left_lower_corner-val ((m <ObstacleDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_pkg-msg:left_lower_corner-val is deprecated.  Use localization_pkg-msg:left_lower_corner instead.")
  (left_lower_corner m))

(cl:ensure-generic-function 'right_lower_corner-val :lambda-list '(m))
(cl:defmethod right_lower_corner-val ((m <ObstacleDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_pkg-msg:right_lower_corner-val is deprecated.  Use localization_pkg-msg:right_lower_corner instead.")
  (right_lower_corner m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleDetection>) ostream)
  "Serializes a message object of type '<ObstacleDetection>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'left_lower_corner) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'right_lower_corner) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleDetection>) istream)
  "Deserializes a message object of type '<ObstacleDetection>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'left_lower_corner) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'right_lower_corner) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleDetection>)))
  "Returns string type for a message object of type '<ObstacleDetection>"
  "localization_pkg/ObstacleDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleDetection)))
  "Returns string type for a message object of type 'ObstacleDetection"
  "localization_pkg/ObstacleDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleDetection>)))
  "Returns md5sum for a message object of type '<ObstacleDetection>"
  "d667fd4ba057e0adbc55ef5b683aec9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleDetection)))
  "Returns md5sum for a message object of type 'ObstacleDetection"
  "d667fd4ba057e0adbc55ef5b683aec9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleDetection>)))
  "Returns full string definition for message of type '<ObstacleDetection>"
  (cl:format cl:nil "geometry_msgs/Point left_lower_corner~%geometry_msgs/Point right_lower_corner~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleDetection)))
  "Returns full string definition for message of type 'ObstacleDetection"
  (cl:format cl:nil "geometry_msgs/Point left_lower_corner~%geometry_msgs/Point right_lower_corner~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleDetection>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'left_lower_corner))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'right_lower_corner))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleDetection
    (cl:cons ':left_lower_corner (left_lower_corner msg))
    (cl:cons ':right_lower_corner (right_lower_corner msg))
))
