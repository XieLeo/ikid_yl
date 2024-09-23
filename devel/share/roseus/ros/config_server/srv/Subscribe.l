;; Auto-generated. Do not edit!


(when (boundp 'config_server::Subscribe)
  (if (not (find-package "CONFIG_SERVER"))
    (make-package "CONFIG_SERVER"))
  (shadow 'Subscribe (find-package "CONFIG_SERVER")))
(unless (find-package "CONFIG_SERVER::SUBSCRIBE")
  (make-package "CONFIG_SERVER::SUBSCRIBE"))
(unless (find-package "CONFIG_SERVER::SUBSCRIBEREQUEST")
  (make-package "CONFIG_SERVER::SUBSCRIBEREQUEST"))
(unless (find-package "CONFIG_SERVER::SUBSCRIBERESPONSE")
  (make-package "CONFIG_SERVER::SUBSCRIBERESPONSE"))

(in-package "ROS")





(defclass config_server::SubscribeRequest
  :super ros::object
  :slots (_prop _callback _desc ))

(defmethod config_server::SubscribeRequest
  (:init
   (&key
    ((:prop __prop) "")
    ((:callback __callback) "")
    ((:desc __desc) (instance config_server::ParameterDescription :init))
    )
   (send-super :init)
   (setq _prop (string __prop))
   (setq _callback (string __callback))
   (setq _desc __desc)
   self)
  (:prop
   (&optional __prop)
   (if __prop (setq _prop __prop)) _prop)
  (:callback
   (&optional __callback)
   (if __callback (setq _callback __callback)) _callback)
  (:desc
   (&rest __desc)
   (if (keywordp (car __desc))
       (send* _desc __desc)
     (progn
       (if __desc (setq _desc (car __desc)))
       _desc)))
  (:serialization-length
   ()
   (+
    ;; string _prop
    4 (length _prop)
    ;; string _callback
    4 (length _callback)
    ;; config_server/ParameterDescription _desc
    (send _desc :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _prop
       (write-long (length _prop) s) (princ _prop s)
     ;; string _callback
       (write-long (length _callback) s) (princ _callback s)
     ;; config_server/ParameterDescription _desc
       (send _desc :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _prop
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _prop (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _callback
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _callback (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; config_server/ParameterDescription _desc
     (send _desc :deserialize buf ptr-) (incf ptr- (send _desc :serialization-length))
   ;;
   self)
  )

(defclass config_server::SubscribeResponse
  :super ros::object
  :slots (_value ))

(defmethod config_server::SubscribeResponse
  (:init
   (&key
    ((:value __value) "")
    )
   (send-super :init)
   (setq _value (string __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _value
    4 (length _value)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _value
       (write-long (length _value) s) (princ _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _value
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _value (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass config_server::Subscribe
  :super ros::object
  :slots ())

(setf (get config_server::Subscribe :md5sum-) "3aed6858ba7841ecfc55a9e55271bc42")
(setf (get config_server::Subscribe :datatype-) "config_server/Subscribe")
(setf (get config_server::Subscribe :request) config_server::SubscribeRequest)
(setf (get config_server::Subscribe :response) config_server::SubscribeResponse)

(defmethod config_server::SubscribeRequest
  (:response () (instance config_server::SubscribeResponse :init)))

(setf (get config_server::SubscribeRequest :md5sum-) "3aed6858ba7841ecfc55a9e55271bc42")
(setf (get config_server::SubscribeRequest :datatype-) "config_server/SubscribeRequest")
(setf (get config_server::SubscribeRequest :definition-)
      "string prop
string callback
ParameterDescription desc

================================================================================
MSG: config_server/ParameterDescription
string name
string type
float32 min
float32 max
float32 step
---
string value
")

(setf (get config_server::SubscribeResponse :md5sum-) "3aed6858ba7841ecfc55a9e55271bc42")
(setf (get config_server::SubscribeResponse :datatype-) "config_server/SubscribeResponse")
(setf (get config_server::SubscribeResponse :definition-)
      "string prop
string callback
ParameterDescription desc

================================================================================
MSG: config_server/ParameterDescription
string name
string type
float32 min
float32 max
float32 step
---
string value
")



(provide :config_server/Subscribe "3aed6858ba7841ecfc55a9e55271bc42")


