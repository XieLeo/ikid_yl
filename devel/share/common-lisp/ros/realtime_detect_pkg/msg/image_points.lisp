; Auto-generated. Do not edit!


(cl:in-package realtime_detect_pkg-msg)


;//! \htmlinclude image_points.msg.html

(cl:defclass <image_points> (roslisp-msg-protocol:ros-message)
  ((coordinates
    :reader coordinates
    :initarg :coordinates
    :type (cl:vector cl:integer)
   :initform (cl:make-array 4 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass image_points (<image_points>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <image_points>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'image_points)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realtime_detect_pkg-msg:<image_points> is deprecated: use realtime_detect_pkg-msg:image_points instead.")))

(cl:ensure-generic-function 'coordinates-val :lambda-list '(m))
(cl:defmethod coordinates-val ((m <image_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realtime_detect_pkg-msg:coordinates-val is deprecated.  Use realtime_detect_pkg-msg:coordinates instead.")
  (coordinates m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <image_points>) ostream)
  "Serializes a message object of type '<image_points>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'coordinates))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <image_points>) istream)
  "Deserializes a message object of type '<image_points>"
  (cl:setf (cl:slot-value msg 'coordinates) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'coordinates)))
    (cl:dotimes (i 4)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<image_points>)))
  "Returns string type for a message object of type '<image_points>"
  "realtime_detect_pkg/image_points")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'image_points)))
  "Returns string type for a message object of type 'image_points"
  "realtime_detect_pkg/image_points")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<image_points>)))
  "Returns md5sum for a message object of type '<image_points>"
  "39d95add7fb2b7fc613712df91e2c161")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'image_points)))
  "Returns md5sum for a message object of type 'image_points"
  "39d95add7fb2b7fc613712df91e2c161")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<image_points>)))
  "Returns full string definition for message of type '<image_points>"
  (cl:format cl:nil "int32[4] coordinates  # 用于存储一个检测框的四个坐标 [x1, y1, x2, y2]~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'image_points)))
  "Returns full string definition for message of type 'image_points"
  (cl:format cl:nil "int32[4] coordinates  # 用于存储一个检测框的四个坐标 [x1, y1, x2, y2]~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <image_points>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'coordinates) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <image_points>))
  "Converts a ROS message object to a list"
  (cl:list 'image_points
    (cl:cons ':coordinates (coordinates msg))
))
