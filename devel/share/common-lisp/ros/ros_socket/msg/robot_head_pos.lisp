; Auto-generated. Do not edit!


(cl:in-package ros_socket-msg)


;//! \htmlinclude robot_head_pos.msg.html

(cl:defclass <robot_head_pos> (roslisp-msg-protocol:ros-message)
  ((neck_rotation_theta
    :reader neck_rotation_theta
    :initarg :neck_rotation_theta
    :type cl:float
    :initform 0.0)
   (neck_front_swing_theta
    :reader neck_front_swing_theta
    :initarg :neck_front_swing_theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass robot_head_pos (<robot_head_pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_head_pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_head_pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_socket-msg:<robot_head_pos> is deprecated: use ros_socket-msg:robot_head_pos instead.")))

(cl:ensure-generic-function 'neck_rotation_theta-val :lambda-list '(m))
(cl:defmethod neck_rotation_theta-val ((m <robot_head_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_socket-msg:neck_rotation_theta-val is deprecated.  Use ros_socket-msg:neck_rotation_theta instead.")
  (neck_rotation_theta m))

(cl:ensure-generic-function 'neck_front_swing_theta-val :lambda-list '(m))
(cl:defmethod neck_front_swing_theta-val ((m <robot_head_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_socket-msg:neck_front_swing_theta-val is deprecated.  Use ros_socket-msg:neck_front_swing_theta instead.")
  (neck_front_swing_theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_head_pos>) ostream)
  "Serializes a message object of type '<robot_head_pos>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'neck_rotation_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'neck_front_swing_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_head_pos>) istream)
  "Deserializes a message object of type '<robot_head_pos>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'neck_rotation_theta) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'neck_front_swing_theta) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_head_pos>)))
  "Returns string type for a message object of type '<robot_head_pos>"
  "ros_socket/robot_head_pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_head_pos)))
  "Returns string type for a message object of type 'robot_head_pos"
  "ros_socket/robot_head_pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_head_pos>)))
  "Returns md5sum for a message object of type '<robot_head_pos>"
  "1abf8b03136e17e9236b9db881fa8e69")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_head_pos)))
  "Returns md5sum for a message object of type 'robot_head_pos"
  "1abf8b03136e17e9236b9db881fa8e69")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_head_pos>)))
  "Returns full string definition for message of type '<robot_head_pos>"
  (cl:format cl:nil "float64 neck_rotation_theta  # 颈旋转关节角度~%float64 neck_front_swing_theta # 颈前摆关节角度~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_head_pos)))
  "Returns full string definition for message of type 'robot_head_pos"
  (cl:format cl:nil "float64 neck_rotation_theta  # 颈旋转关节角度~%float64 neck_front_swing_theta # 颈前摆关节角度~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_head_pos>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_head_pos>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_head_pos
    (cl:cons ':neck_rotation_theta (neck_rotation_theta msg))
    (cl:cons ':neck_front_swing_theta (neck_front_swing_theta msg))
))
