; Auto-generated. Do not edit!


(cl:in-package config_server-srv)


;//! \htmlinclude Save-request.msg.html

(cl:defclass <Save-request> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform ""))
)

(cl:defclass Save-request (<Save-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Save-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Save-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<Save-request> is deprecated: use config_server-srv:Save-request instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <Save-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:filename-val is deprecated.  Use config_server-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Save-request>) ostream)
  "Serializes a message object of type '<Save-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Save-request>) istream)
  "Deserializes a message object of type '<Save-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Save-request>)))
  "Returns string type for a service object of type '<Save-request>"
  "config_server/SaveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Save-request)))
  "Returns string type for a service object of type 'Save-request"
  "config_server/SaveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Save-request>)))
  "Returns md5sum for a message object of type '<Save-request>"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Save-request)))
  "Returns md5sum for a message object of type 'Save-request"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Save-request>)))
  "Returns full string definition for message of type '<Save-request>"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Save-request)))
  "Returns full string definition for message of type 'Save-request"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Save-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Save-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Save-request
    (cl:cons ':filename (filename msg))
))
;//! \htmlinclude Save-response.msg.html

(cl:defclass <Save-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Save-response (<Save-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Save-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Save-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<Save-response> is deprecated: use config_server-srv:Save-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Save-response>) ostream)
  "Serializes a message object of type '<Save-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Save-response>) istream)
  "Deserializes a message object of type '<Save-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Save-response>)))
  "Returns string type for a service object of type '<Save-response>"
  "config_server/SaveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Save-response)))
  "Returns string type for a service object of type 'Save-response"
  "config_server/SaveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Save-response>)))
  "Returns md5sum for a message object of type '<Save-response>"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Save-response)))
  "Returns md5sum for a message object of type 'Save-response"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Save-response>)))
  "Returns full string definition for message of type '<Save-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Save-response)))
  "Returns full string definition for message of type 'Save-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Save-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Save-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Save-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Save)))
  'Save-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Save)))
  'Save-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Save)))
  "Returns string type for a service object of type '<Save>"
  "config_server/Save")