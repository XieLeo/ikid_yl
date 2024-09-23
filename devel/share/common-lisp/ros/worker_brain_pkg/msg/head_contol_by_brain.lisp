; Auto-generated. Do not edit!


(cl:in-package worker_brain_pkg-msg)


;//! \htmlinclude head_contol_by_brain.msg.html

(cl:defclass <head_contol_by_brain> (roslisp-msg-protocol:ros-message)
  ((neck_rotation_theta_angle
    :reader neck_rotation_theta_angle
    :initarg :neck_rotation_theta_angle
    :type cl:float
    :initform 0.0)
   (neck_front_swing_theta_angle
    :reader neck_front_swing_theta_angle
    :initarg :neck_front_swing_theta_angle
    :type cl:float
    :initform 0.0)
   (is_find_state
    :reader is_find_state
    :initarg :is_find_state
    :type cl:boolean
    :initform cl:nil)
   (is_follow_state
    :reader is_follow_state
    :initarg :is_follow_state
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass head_contol_by_brain (<head_contol_by_brain>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <head_contol_by_brain>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'head_contol_by_brain)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name worker_brain_pkg-msg:<head_contol_by_brain> is deprecated: use worker_brain_pkg-msg:head_contol_by_brain instead.")))

(cl:ensure-generic-function 'neck_rotation_theta_angle-val :lambda-list '(m))
(cl:defmethod neck_rotation_theta_angle-val ((m <head_contol_by_brain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader worker_brain_pkg-msg:neck_rotation_theta_angle-val is deprecated.  Use worker_brain_pkg-msg:neck_rotation_theta_angle instead.")
  (neck_rotation_theta_angle m))

(cl:ensure-generic-function 'neck_front_swing_theta_angle-val :lambda-list '(m))
(cl:defmethod neck_front_swing_theta_angle-val ((m <head_contol_by_brain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader worker_brain_pkg-msg:neck_front_swing_theta_angle-val is deprecated.  Use worker_brain_pkg-msg:neck_front_swing_theta_angle instead.")
  (neck_front_swing_theta_angle m))

(cl:ensure-generic-function 'is_find_state-val :lambda-list '(m))
(cl:defmethod is_find_state-val ((m <head_contol_by_brain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader worker_brain_pkg-msg:is_find_state-val is deprecated.  Use worker_brain_pkg-msg:is_find_state instead.")
  (is_find_state m))

(cl:ensure-generic-function 'is_follow_state-val :lambda-list '(m))
(cl:defmethod is_follow_state-val ((m <head_contol_by_brain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader worker_brain_pkg-msg:is_follow_state-val is deprecated.  Use worker_brain_pkg-msg:is_follow_state instead.")
  (is_follow_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <head_contol_by_brain>) ostream)
  "Serializes a message object of type '<head_contol_by_brain>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'neck_rotation_theta_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'neck_front_swing_theta_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_find_state) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_follow_state) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <head_contol_by_brain>) istream)
  "Deserializes a message object of type '<head_contol_by_brain>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'neck_rotation_theta_angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'neck_front_swing_theta_angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'is_find_state) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_follow_state) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<head_contol_by_brain>)))
  "Returns string type for a message object of type '<head_contol_by_brain>"
  "worker_brain_pkg/head_contol_by_brain")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'head_contol_by_brain)))
  "Returns string type for a message object of type 'head_contol_by_brain"
  "worker_brain_pkg/head_contol_by_brain")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<head_contol_by_brain>)))
  "Returns md5sum for a message object of type '<head_contol_by_brain>"
  "e40d90720bf88cd6f3200a64bcb87dbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'head_contol_by_brain)))
  "Returns md5sum for a message object of type 'head_contol_by_brain"
  "e40d90720bf88cd6f3200a64bcb87dbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<head_contol_by_brain>)))
  "Returns full string definition for message of type '<head_contol_by_brain>"
  (cl:format cl:nil "float64 neck_rotation_theta_angle  # 颈旋转关节角度~%float64 neck_front_swing_theta_angle # 颈前摆关节角度~%bool is_find_state # 是否找球状态~%bool is_follow_state # 是否跟球状态~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'head_contol_by_brain)))
  "Returns full string definition for message of type 'head_contol_by_brain"
  (cl:format cl:nil "float64 neck_rotation_theta_angle  # 颈旋转关节角度~%float64 neck_front_swing_theta_angle # 颈前摆关节角度~%bool is_find_state # 是否找球状态~%bool is_follow_state # 是否跟球状态~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <head_contol_by_brain>))
  (cl:+ 0
     8
     8
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <head_contol_by_brain>))
  "Converts a ROS message object to a list"
  (cl:list 'head_contol_by_brain
    (cl:cons ':neck_rotation_theta_angle (neck_rotation_theta_angle msg))
    (cl:cons ':neck_front_swing_theta_angle (neck_front_swing_theta_angle msg))
    (cl:cons ':is_find_state (is_find_state msg))
    (cl:cons ':is_follow_state (is_follow_state msg))
))
