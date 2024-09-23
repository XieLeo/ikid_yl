; Auto-generated. Do not edit!


(cl:in-package config_server-msg)


;//! \htmlinclude ParameterList.msg.html

(cl:defclass <ParameterList> (roslisp-msg-protocol:ros-message)
  ((parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector config_server-msg:ParameterDescription)
   :initform (cl:make-array 0 :element-type 'config_server-msg:ParameterDescription :initial-element (cl:make-instance 'config_server-msg:ParameterDescription))))
)

(cl:defclass ParameterList (<ParameterList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ParameterList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ParameterList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-msg:<ParameterList> is deprecated: use config_server-msg:ParameterList instead.")))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <ParameterList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-msg:parameters-val is deprecated.  Use config_server-msg:parameters instead.")
  (parameters m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ParameterList>) ostream)
  "Serializes a message object of type '<ParameterList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parameters))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ParameterList>) istream)
  "Deserializes a message object of type '<ParameterList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'parameters) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'parameters)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'config_server-msg:ParameterDescription))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ParameterList>)))
  "Returns string type for a message object of type '<ParameterList>"
  "config_server/ParameterList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ParameterList)))
  "Returns string type for a message object of type 'ParameterList"
  "config_server/ParameterList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ParameterList>)))
  "Returns md5sum for a message object of type '<ParameterList>"
  "b43150e18cd687d16ddbddaf1454c72c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ParameterList)))
  "Returns md5sum for a message object of type 'ParameterList"
  "b43150e18cd687d16ddbddaf1454c72c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ParameterList>)))
  "Returns full string definition for message of type '<ParameterList>"
  (cl:format cl:nil "ParameterDescription[] parameters~%================================================================================~%MSG: config_server/ParameterDescription~%string name~%string type~%float32 min~%float32 max~%float32 step~%string default_value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ParameterList)))
  "Returns full string definition for message of type 'ParameterList"
  (cl:format cl:nil "ParameterDescription[] parameters~%================================================================================~%MSG: config_server/ParameterDescription~%string name~%string type~%float32 min~%float32 max~%float32 step~%string default_value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ParameterList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ParameterList>))
  "Converts a ROS message object to a list"
  (cl:list 'ParameterList
    (cl:cons ':parameters (parameters msg))
))
