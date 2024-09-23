; Auto-generated. Do not edit!


(cl:in-package realtime_detect_pkg-msg)


;//! \htmlinclude all_image_points.msg.html

(cl:defclass <all_image_points> (roslisp-msg-protocol:ros-message)
  ((ball_xyxy
    :reader ball_xyxy
    :initarg :ball_xyxy
    :type (cl:vector realtime_detect_pkg-msg:image_points)
   :initform (cl:make-array 0 :element-type 'realtime_detect_pkg-msg:image_points :initial-element (cl:make-instance 'realtime_detect_pkg-msg:image_points)))
   (goalpost_xyxy
    :reader goalpost_xyxy
    :initarg :goalpost_xyxy
    :type (cl:vector realtime_detect_pkg-msg:image_points)
   :initform (cl:make-array 0 :element-type 'realtime_detect_pkg-msg:image_points :initial-element (cl:make-instance 'realtime_detect_pkg-msg:image_points)))
   (robot_xyxy
    :reader robot_xyxy
    :initarg :robot_xyxy
    :type (cl:vector realtime_detect_pkg-msg:image_points)
   :initform (cl:make-array 0 :element-type 'realtime_detect_pkg-msg:image_points :initial-element (cl:make-instance 'realtime_detect_pkg-msg:image_points)))
   (L_mark_xyxy
    :reader L_mark_xyxy
    :initarg :L_mark_xyxy
    :type (cl:vector realtime_detect_pkg-msg:image_points)
   :initform (cl:make-array 0 :element-type 'realtime_detect_pkg-msg:image_points :initial-element (cl:make-instance 'realtime_detect_pkg-msg:image_points)))
   (T_mark_xyxy
    :reader T_mark_xyxy
    :initarg :T_mark_xyxy
    :type (cl:vector realtime_detect_pkg-msg:image_points)
   :initform (cl:make-array 0 :element-type 'realtime_detect_pkg-msg:image_points :initial-element (cl:make-instance 'realtime_detect_pkg-msg:image_points)))
   (X_mark_xyxy
    :reader X_mark_xyxy
    :initarg :X_mark_xyxy
    :type (cl:vector realtime_detect_pkg-msg:image_points)
   :initform (cl:make-array 0 :element-type 'realtime_detect_pkg-msg:image_points :initial-element (cl:make-instance 'realtime_detect_pkg-msg:image_points))))
)

(cl:defclass all_image_points (<all_image_points>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <all_image_points>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'all_image_points)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realtime_detect_pkg-msg:<all_image_points> is deprecated: use realtime_detect_pkg-msg:all_image_points instead.")))

(cl:ensure-generic-function 'ball_xyxy-val :lambda-list '(m))
(cl:defmethod ball_xyxy-val ((m <all_image_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realtime_detect_pkg-msg:ball_xyxy-val is deprecated.  Use realtime_detect_pkg-msg:ball_xyxy instead.")
  (ball_xyxy m))

(cl:ensure-generic-function 'goalpost_xyxy-val :lambda-list '(m))
(cl:defmethod goalpost_xyxy-val ((m <all_image_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realtime_detect_pkg-msg:goalpost_xyxy-val is deprecated.  Use realtime_detect_pkg-msg:goalpost_xyxy instead.")
  (goalpost_xyxy m))

(cl:ensure-generic-function 'robot_xyxy-val :lambda-list '(m))
(cl:defmethod robot_xyxy-val ((m <all_image_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realtime_detect_pkg-msg:robot_xyxy-val is deprecated.  Use realtime_detect_pkg-msg:robot_xyxy instead.")
  (robot_xyxy m))

(cl:ensure-generic-function 'L_mark_xyxy-val :lambda-list '(m))
(cl:defmethod L_mark_xyxy-val ((m <all_image_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realtime_detect_pkg-msg:L_mark_xyxy-val is deprecated.  Use realtime_detect_pkg-msg:L_mark_xyxy instead.")
  (L_mark_xyxy m))

(cl:ensure-generic-function 'T_mark_xyxy-val :lambda-list '(m))
(cl:defmethod T_mark_xyxy-val ((m <all_image_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realtime_detect_pkg-msg:T_mark_xyxy-val is deprecated.  Use realtime_detect_pkg-msg:T_mark_xyxy instead.")
  (T_mark_xyxy m))

(cl:ensure-generic-function 'X_mark_xyxy-val :lambda-list '(m))
(cl:defmethod X_mark_xyxy-val ((m <all_image_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realtime_detect_pkg-msg:X_mark_xyxy-val is deprecated.  Use realtime_detect_pkg-msg:X_mark_xyxy instead.")
  (X_mark_xyxy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <all_image_points>) ostream)
  "Serializes a message object of type '<all_image_points>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ball_xyxy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ball_xyxy))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goalpost_xyxy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'goalpost_xyxy))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'robot_xyxy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'robot_xyxy))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'L_mark_xyxy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'L_mark_xyxy))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'T_mark_xyxy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'T_mark_xyxy))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'X_mark_xyxy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'X_mark_xyxy))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <all_image_points>) istream)
  "Deserializes a message object of type '<all_image_points>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ball_xyxy) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ball_xyxy)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'realtime_detect_pkg-msg:image_points))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goalpost_xyxy) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goalpost_xyxy)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'realtime_detect_pkg-msg:image_points))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'robot_xyxy) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'robot_xyxy)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'realtime_detect_pkg-msg:image_points))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'L_mark_xyxy) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'L_mark_xyxy)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'realtime_detect_pkg-msg:image_points))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'T_mark_xyxy) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'T_mark_xyxy)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'realtime_detect_pkg-msg:image_points))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'X_mark_xyxy) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'X_mark_xyxy)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'realtime_detect_pkg-msg:image_points))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<all_image_points>)))
  "Returns string type for a message object of type '<all_image_points>"
  "realtime_detect_pkg/all_image_points")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'all_image_points)))
  "Returns string type for a message object of type 'all_image_points"
  "realtime_detect_pkg/all_image_points")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<all_image_points>)))
  "Returns md5sum for a message object of type '<all_image_points>"
  "c8cd15673e10b541cdf32b31b8a02c11")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'all_image_points)))
  "Returns md5sum for a message object of type 'all_image_points"
  "c8cd15673e10b541cdf32b31b8a02c11")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<all_image_points>)))
  "Returns full string definition for message of type '<all_image_points>"
  (cl:format cl:nil "image_points[] ball_xyxy~%image_points[] goalpost_xyxy~%image_points[] robot_xyxy~%image_points[] L_mark_xyxy~%image_points[] T_mark_xyxy~%image_points[] X_mark_xyxy~%~%================================================================================~%MSG: realtime_detect_pkg/image_points~%int32[4] coordinates  # 用于存储一个检测框的四个坐标 [x1, y1, x2, y2]~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'all_image_points)))
  "Returns full string definition for message of type 'all_image_points"
  (cl:format cl:nil "image_points[] ball_xyxy~%image_points[] goalpost_xyxy~%image_points[] robot_xyxy~%image_points[] L_mark_xyxy~%image_points[] T_mark_xyxy~%image_points[] X_mark_xyxy~%~%================================================================================~%MSG: realtime_detect_pkg/image_points~%int32[4] coordinates  # 用于存储一个检测框的四个坐标 [x1, y1, x2, y2]~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <all_image_points>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ball_xyxy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goalpost_xyxy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'robot_xyxy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'L_mark_xyxy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'T_mark_xyxy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'X_mark_xyxy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <all_image_points>))
  "Converts a ROS message object to a list"
  (cl:list 'all_image_points
    (cl:cons ':ball_xyxy (ball_xyxy msg))
    (cl:cons ':goalpost_xyxy (goalpost_xyxy msg))
    (cl:cons ':robot_xyxy (robot_xyxy msg))
    (cl:cons ':L_mark_xyxy (L_mark_xyxy msg))
    (cl:cons ':T_mark_xyxy (T_mark_xyxy msg))
    (cl:cons ':X_mark_xyxy (X_mark_xyxy msg))
))
