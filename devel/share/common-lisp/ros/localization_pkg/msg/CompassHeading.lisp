; Auto-generated. Do not edit!


(cl:in-package localization_pkg-msg)


;//! \htmlinclude CompassHeading.msg.html

(cl:defclass <CompassHeading> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0))
)

(cl:defclass CompassHeading (<CompassHeading>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CompassHeading>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CompassHeading)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization_pkg-msg:<CompassHeading> is deprecated: use localization_pkg-msg:CompassHeading instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <CompassHeading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_pkg-msg:stamp-val is deprecated.  Use localization_pkg-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <CompassHeading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_pkg-msg:heading-val is deprecated.  Use localization_pkg-msg:heading instead.")
  (heading m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CompassHeading>) ostream)
  "Serializes a message object of type '<CompassHeading>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CompassHeading>) istream)
  "Deserializes a message object of type '<CompassHeading>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CompassHeading>)))
  "Returns string type for a message object of type '<CompassHeading>"
  "localization_pkg/CompassHeading")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CompassHeading)))
  "Returns string type for a message object of type 'CompassHeading"
  "localization_pkg/CompassHeading")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CompassHeading>)))
  "Returns md5sum for a message object of type '<CompassHeading>"
  "5ad4832863e6aeae982283d427018cbf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CompassHeading)))
  "Returns md5sum for a message object of type 'CompassHeading"
  "5ad4832863e6aeae982283d427018cbf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CompassHeading>)))
  "Returns full string definition for message of type '<CompassHeading>"
  (cl:format cl:nil "time stamp~%float32 heading~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CompassHeading)))
  "Returns full string definition for message of type 'CompassHeading"
  (cl:format cl:nil "time stamp~%float32 heading~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CompassHeading>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CompassHeading>))
  "Converts a ROS message object to a list"
  (cl:list 'CompassHeading
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':heading (heading msg))
))
