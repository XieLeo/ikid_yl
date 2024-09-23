; Auto-generated. Do not edit!


(cl:in-package ros_socket-msg)


;//! \htmlinclude robot_joint.msg.html

(cl:defclass <robot_joint> (roslisp-msg-protocol:ros-message)
  ((joint
    :reader joint
    :initarg :joint
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass robot_joint (<robot_joint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_joint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_joint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_socket-msg:<robot_joint> is deprecated: use ros_socket-msg:robot_joint instead.")))

(cl:ensure-generic-function 'joint-val :lambda-list '(m))
(cl:defmethod joint-val ((m <robot_joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_socket-msg:joint-val is deprecated.  Use ros_socket-msg:joint instead.")
  (joint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_joint>) ostream)
  "Serializes a message object of type '<robot_joint>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'joint))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_joint>) istream)
  "Deserializes a message object of type '<robot_joint>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_joint>)))
  "Returns string type for a message object of type '<robot_joint>"
  "ros_socket/robot_joint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_joint)))
  "Returns string type for a message object of type 'robot_joint"
  "ros_socket/robot_joint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_joint>)))
  "Returns md5sum for a message object of type '<robot_joint>"
  "2d98f45f5f7d408b6a0d45a64e4813c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_joint)))
  "Returns md5sum for a message object of type 'robot_joint"
  "2d98f45f5f7d408b6a0d45a64e4813c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_joint>)))
  "Returns full string definition for message of type '<robot_joint>"
  (cl:format cl:nil "float64[] joint  # 各关节位置数据~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_joint)))
  "Returns full string definition for message of type 'robot_joint"
  (cl:format cl:nil "float64[] joint  # 各关节位置数据~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_joint>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_joint>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_joint
    (cl:cons ':joint (joint msg))
))
