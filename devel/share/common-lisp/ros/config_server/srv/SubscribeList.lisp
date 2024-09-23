; Auto-generated. Do not edit!


(cl:in-package config_server-srv)


;//! \htmlinclude SubscribeList-request.msg.html

(cl:defclass <SubscribeList-request> (roslisp-msg-protocol:ros-message)
  ((callback
    :reader callback
    :initarg :callback
    :type cl:string
    :initform "")
   (parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector config_server-msg:ParameterDescription)
   :initform (cl:make-array 0 :element-type 'config_server-msg:ParameterDescription :initial-element (cl:make-instance 'config_server-msg:ParameterDescription))))
)

(cl:defclass SubscribeList-request (<SubscribeList-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SubscribeList-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SubscribeList-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<SubscribeList-request> is deprecated: use config_server-srv:SubscribeList-request instead.")))

(cl:ensure-generic-function 'callback-val :lambda-list '(m))
(cl:defmethod callback-val ((m <SubscribeList-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:callback-val is deprecated.  Use config_server-srv:callback instead.")
  (callback m))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <SubscribeList-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:parameters-val is deprecated.  Use config_server-srv:parameters instead.")
  (parameters m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SubscribeList-request>) ostream)
  "Serializes a message object of type '<SubscribeList-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'callback))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'callback))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parameters))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SubscribeList-request>) istream)
  "Deserializes a message object of type '<SubscribeList-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'callback) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'callback) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SubscribeList-request>)))
  "Returns string type for a service object of type '<SubscribeList-request>"
  "config_server/SubscribeListRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SubscribeList-request)))
  "Returns string type for a service object of type 'SubscribeList-request"
  "config_server/SubscribeListRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SubscribeList-request>)))
  "Returns md5sum for a message object of type '<SubscribeList-request>"
  "b3d53d10785172ca95ba19fea29582f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SubscribeList-request)))
  "Returns md5sum for a message object of type 'SubscribeList-request"
  "b3d53d10785172ca95ba19fea29582f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SubscribeList-request>)))
  "Returns full string definition for message of type '<SubscribeList-request>"
  (cl:format cl:nil "string callback~%ParameterDescription[] parameters~%~%================================================================================~%MSG: config_server/ParameterDescription~%string name~%string type~%float32 min~%float32 max~%float32 step~%string default_value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SubscribeList-request)))
  "Returns full string definition for message of type 'SubscribeList-request"
  (cl:format cl:nil "string callback~%ParameterDescription[] parameters~%~%================================================================================~%MSG: config_server/ParameterDescription~%string name~%string type~%float32 min~%float32 max~%float32 step~%string default_value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SubscribeList-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'callback))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SubscribeList-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SubscribeList-request
    (cl:cons ':callback (callback msg))
    (cl:cons ':parameters (parameters msg))
))
;//! \htmlinclude SubscribeList-response.msg.html

(cl:defclass <SubscribeList-response> (roslisp-msg-protocol:ros-message)
  ((values
    :reader values
    :initarg :values
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass SubscribeList-response (<SubscribeList-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SubscribeList-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SubscribeList-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<SubscribeList-response> is deprecated: use config_server-srv:SubscribeList-response instead.")))

(cl:ensure-generic-function 'values-val :lambda-list '(m))
(cl:defmethod values-val ((m <SubscribeList-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:values-val is deprecated.  Use config_server-srv:values instead.")
  (values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SubscribeList-response>) ostream)
  "Serializes a message object of type '<SubscribeList-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'values))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SubscribeList-response>) istream)
  "Deserializes a message object of type '<SubscribeList-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'values)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SubscribeList-response>)))
  "Returns string type for a service object of type '<SubscribeList-response>"
  "config_server/SubscribeListResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SubscribeList-response)))
  "Returns string type for a service object of type 'SubscribeList-response"
  "config_server/SubscribeListResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SubscribeList-response>)))
  "Returns md5sum for a message object of type '<SubscribeList-response>"
  "b3d53d10785172ca95ba19fea29582f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SubscribeList-response)))
  "Returns md5sum for a message object of type 'SubscribeList-response"
  "b3d53d10785172ca95ba19fea29582f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SubscribeList-response>)))
  "Returns full string definition for message of type '<SubscribeList-response>"
  (cl:format cl:nil "string[] values~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SubscribeList-response)))
  "Returns full string definition for message of type 'SubscribeList-response"
  (cl:format cl:nil "string[] values~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SubscribeList-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SubscribeList-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SubscribeList-response
    (cl:cons ':values (values msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SubscribeList)))
  'SubscribeList-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SubscribeList)))
  'SubscribeList-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SubscribeList)))
  "Returns string type for a service object of type '<SubscribeList>"
  "config_server/SubscribeList")