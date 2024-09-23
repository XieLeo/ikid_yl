; Auto-generated. Do not edit!


(cl:in-package config_server-srv)


;//! \htmlinclude GetParameter-request.msg.html

(cl:defclass <GetParameter-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass GetParameter-request (<GetParameter-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetParameter-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetParameter-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<GetParameter-request> is deprecated: use config_server-srv:GetParameter-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <GetParameter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:name-val is deprecated.  Use config_server-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetParameter-request>) ostream)
  "Serializes a message object of type '<GetParameter-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetParameter-request>) istream)
  "Deserializes a message object of type '<GetParameter-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetParameter-request>)))
  "Returns string type for a service object of type '<GetParameter-request>"
  "config_server/GetParameterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetParameter-request)))
  "Returns string type for a service object of type 'GetParameter-request"
  "config_server/GetParameterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetParameter-request>)))
  "Returns md5sum for a message object of type '<GetParameter-request>"
  "f20c32a0b2a08c9ecdba58674ac1438f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetParameter-request)))
  "Returns md5sum for a message object of type 'GetParameter-request"
  "f20c32a0b2a08c9ecdba58674ac1438f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetParameter-request>)))
  "Returns full string definition for message of type '<GetParameter-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetParameter-request)))
  "Returns full string definition for message of type 'GetParameter-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetParameter-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetParameter-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetParameter-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude GetParameter-response.msg.html

(cl:defclass <GetParameter-response> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:string
    :initform ""))
)

(cl:defclass GetParameter-response (<GetParameter-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetParameter-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetParameter-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<GetParameter-response> is deprecated: use config_server-srv:GetParameter-response instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <GetParameter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:value-val is deprecated.  Use config_server-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetParameter-response>) ostream)
  "Serializes a message object of type '<GetParameter-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetParameter-response>) istream)
  "Deserializes a message object of type '<GetParameter-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetParameter-response>)))
  "Returns string type for a service object of type '<GetParameter-response>"
  "config_server/GetParameterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetParameter-response)))
  "Returns string type for a service object of type 'GetParameter-response"
  "config_server/GetParameterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetParameter-response>)))
  "Returns md5sum for a message object of type '<GetParameter-response>"
  "f20c32a0b2a08c9ecdba58674ac1438f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetParameter-response)))
  "Returns md5sum for a message object of type 'GetParameter-response"
  "f20c32a0b2a08c9ecdba58674ac1438f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetParameter-response>)))
  "Returns full string definition for message of type '<GetParameter-response>"
  (cl:format cl:nil "string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetParameter-response)))
  "Returns full string definition for message of type 'GetParameter-response"
  (cl:format cl:nil "string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetParameter-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'value))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetParameter-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetParameter-response
    (cl:cons ':value (value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetParameter)))
  'GetParameter-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetParameter)))
  'GetParameter-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetParameter)))
  "Returns string type for a service object of type '<GetParameter>"
  "config_server/GetParameter")