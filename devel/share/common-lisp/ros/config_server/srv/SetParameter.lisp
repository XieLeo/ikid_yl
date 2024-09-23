; Auto-generated. Do not edit!


(cl:in-package config_server-srv)


;//! \htmlinclude SetParameter-request.msg.html

(cl:defclass <SetParameter-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:string
    :initform "")
   (no_notify
    :reader no_notify
    :initarg :no_notify
    :type cl:string
    :initform ""))
)

(cl:defclass SetParameter-request (<SetParameter-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetParameter-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetParameter-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<SetParameter-request> is deprecated: use config_server-srv:SetParameter-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SetParameter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:name-val is deprecated.  Use config_server-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <SetParameter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:value-val is deprecated.  Use config_server-srv:value instead.")
  (value m))

(cl:ensure-generic-function 'no_notify-val :lambda-list '(m))
(cl:defmethod no_notify-val ((m <SetParameter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config_server-srv:no_notify-val is deprecated.  Use config_server-srv:no_notify instead.")
  (no_notify m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetParameter-request>) ostream)
  "Serializes a message object of type '<SetParameter-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'value))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'no_notify))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'no_notify))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetParameter-request>) istream)
  "Deserializes a message object of type '<SetParameter-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'value) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'no_notify) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'no_notify) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetParameter-request>)))
  "Returns string type for a service object of type '<SetParameter-request>"
  "config_server/SetParameterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetParameter-request)))
  "Returns string type for a service object of type 'SetParameter-request"
  "config_server/SetParameterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetParameter-request>)))
  "Returns md5sum for a message object of type '<SetParameter-request>"
  "ec7a3cf3b2b316cbec7051b32ed868f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetParameter-request)))
  "Returns md5sum for a message object of type 'SetParameter-request"
  "ec7a3cf3b2b316cbec7051b32ed868f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetParameter-request>)))
  "Returns full string definition for message of type '<SetParameter-request>"
  (cl:format cl:nil "string name~%string value~%string no_notify~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetParameter-request)))
  "Returns full string definition for message of type 'SetParameter-request"
  (cl:format cl:nil "string name~%string value~%string no_notify~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetParameter-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'value))
     4 (cl:length (cl:slot-value msg 'no_notify))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetParameter-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetParameter-request
    (cl:cons ':name (name msg))
    (cl:cons ':value (value msg))
    (cl:cons ':no_notify (no_notify msg))
))
;//! \htmlinclude SetParameter-response.msg.html

(cl:defclass <SetParameter-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetParameter-response (<SetParameter-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetParameter-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetParameter-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config_server-srv:<SetParameter-response> is deprecated: use config_server-srv:SetParameter-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetParameter-response>) ostream)
  "Serializes a message object of type '<SetParameter-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetParameter-response>) istream)
  "Deserializes a message object of type '<SetParameter-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetParameter-response>)))
  "Returns string type for a service object of type '<SetParameter-response>"
  "config_server/SetParameterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetParameter-response)))
  "Returns string type for a service object of type 'SetParameter-response"
  "config_server/SetParameterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetParameter-response>)))
  "Returns md5sum for a message object of type '<SetParameter-response>"
  "ec7a3cf3b2b316cbec7051b32ed868f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetParameter-response)))
  "Returns md5sum for a message object of type 'SetParameter-response"
  "ec7a3cf3b2b316cbec7051b32ed868f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetParameter-response>)))
  "Returns full string definition for message of type '<SetParameter-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetParameter-response)))
  "Returns full string definition for message of type 'SetParameter-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetParameter-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetParameter-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetParameter-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetParameter)))
  'SetParameter-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetParameter)))
  'SetParameter-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetParameter)))
  "Returns string type for a service object of type '<SetParameter>"
  "config_server/SetParameter")