; Auto-generated. Do not edit!


(cl:in-package config_server-srv)


;//! \htmlinclude Subscribe-request.msg.html

(cl:defclass <Subscribe-request> (roslisp-msg-protocol:ros-message)
  ((prop
    :reader prop
    :initarg :prop
    :type cl:string
    :initform "")
   (callback
    :reader callback
    :initarg :callback
    :type cl:string
    :initform "")
   (desc
    :reader desc
    :initarg :desc
    :type config_server-msg:ParameterDescription
    :initform (cl:make-instance 'config_server-msg:ParameterDescription)))
)

(cl:defclass Subscribe-request (<Subscribe-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Subscribe-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Subscribe-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<Subscribe-request> is deprecated: use config_server-srv:Subscribe-request instead.")))

(cl:ensure-generic-function 'prop-val :lambda-list '(m))
(cl:defmethod prop-val ((m <Subscribe-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:prop-val is deprecated.  Use config_server-srv:prop instead.")
  (prop m))

(cl:ensure-generic-function 'callback-val :lambda-list '(m))
(cl:defmethod callback-val ((m <Subscribe-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:callback-val is deprecated.  Use config_server-srv:callback instead.")
  (callback m))

(cl:ensure-generic-function 'desc-val :lambda-list '(m))
(cl:defmethod desc-val ((m <Subscribe-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:desc-val is deprecated.  Use config_server-srv:desc instead.")
  (desc m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Subscribe-request>) ostream)
  "Serializes a message object of type '<Subscribe-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'prop))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'prop))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'callback))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'callback))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'desc) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Subscribe-request>) istream)
  "Deserializes a message object of type '<Subscribe-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'prop) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'prop) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'callback) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'callback) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'desc) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Subscribe-request>)))
  "Returns string type for a service object of type '<Subscribe-request>"
  "config_server/SubscribeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Subscribe-request)))
  "Returns string type for a service object of type 'Subscribe-request"
  "config_server/SubscribeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Subscribe-request>)))
  "Returns md5sum for a message object of type '<Subscribe-request>"
  "3aed6858ba7841ecfc55a9e55271bc42")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Subscribe-request)))
  "Returns md5sum for a message object of type 'Subscribe-request"
  "3aed6858ba7841ecfc55a9e55271bc42")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Subscribe-request>)))
  "Returns full string definition for message of type '<Subscribe-request>"
  (cl:format cl:nil "string prop~%string callback~%ParameterDescription desc~%~%================================================================================~%MSG: config_server/ParameterDescription~%string name~%string type~%float32 min~%float32 max~%float32 step~%string default_value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Subscribe-request)))
  "Returns full string definition for message of type 'Subscribe-request"
  (cl:format cl:nil "string prop~%string callback~%ParameterDescription desc~%~%================================================================================~%MSG: config_server/ParameterDescription~%string name~%string type~%float32 min~%float32 max~%float32 step~%string default_value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Subscribe-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'prop))
     4 (cl:length (cl:slot-value msg 'callback))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'desc))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Subscribe-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Subscribe-request
    (cl:cons ':prop (prop msg))
    (cl:cons ':callback (callback msg))
    (cl:cons ':desc (desc msg))
))
;//! \htmlinclude Subscribe-response.msg.html

(cl:defclass <Subscribe-response> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:string
    :initform ""))
)

(cl:defclass Subscribe-response (<Subscribe-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Subscribe-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Subscribe-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<Subscribe-response> is deprecated: use config_server-srv:Subscribe-response instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <Subscribe-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:value-val is deprecated.  Use config_server-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Subscribe-response>) ostream)
  "Serializes a message object of type '<Subscribe-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Subscribe-response>) istream)
  "Deserializes a message object of type '<Subscribe-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'value) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Subscribe-response>)))
  "Returns string type for a service object of type '<Subscribe-response>"
  "config_server/SubscribeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Subscribe-response)))
  "Returns string type for a service object of type 'Subscribe-response"
  "config_server/SubscribeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Subscribe-response>)))
  "Returns md5sum for a message object of type '<Subscribe-response>"
  "3aed6858ba7841ecfc55a9e55271bc42")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Subscribe-response)))
  "Returns md5sum for a message object of type 'Subscribe-response"
  "3aed6858ba7841ecfc55a9e55271bc42")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Subscribe-response>)))
  "Returns full string definition for message of type '<Subscribe-response>"
  (cl:format cl:nil "string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Subscribe-response)))
  "Returns full string definition for message of type 'Subscribe-response"
  (cl:format cl:nil "string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Subscribe-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'value))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Subscribe-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Subscribe-response
    (cl:cons ':value (value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Subscribe)))
  'Subscribe-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Subscribe)))
  'Subscribe-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Subscribe)))
  "Returns string type for a service object of type '<Subscribe>"
  "config_server/Subscribe")