;; Auto-generated. Do not edit!


(when (boundp 'config_server::SetParameter)
  (if (not (find-package "CONFIG_SERVER"))
    (make-package "CONFIG_SERVER"))
  (shadow 'SetParameter (find-package "CONFIG_SERVER")))
(unless (find-package "CONFIG_SERVER::SETPARAMETER")
  (make-package "CONFIG_SERVER::SETPARAMETER"))
(unless (find-package "CONFIG_SERVER::SETPARAMETERREQUEST")
  (make-package "CONFIG_SERVER::SETPARAMETERREQUEST"))
(unless (find-package "CONFIG_SERVER::SETPARAMETERRESPONSE")
  (make-package "CONFIG_SERVER::SETPARAMETERRESPONSE"))

(in-package "ROS")





(defclass config_server::SetParameterRequest
  :super ros::object
  :slots (_name _value _no_notify ))

(defmethod config_server::SetParameterRequest
  (:init
   (&key
    ((:name __name) "")
    ((:value __value) "")
    ((:no_notify __no_notify) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _value (string __value))
   (setq _no_notify (string __no_notify))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:no_notify
   (&optional __no_notify)
   (if __no_notify (setq _no_notify __no_notify)) _no_notify)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _value
    4 (length _value)
    ;; string _no_notify
    4 (length _no_notify)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _value
       (write-long (length _value) s) (princ _value s)
     ;; string _no_notify
       (write-long (length _no_notify) s) (princ _no_notify s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _value
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _value (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _no_notify
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _no_notify (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass config_server::SetParameterResponse
  :super ros::object
  :slots ())

(defmethod config_server::SetParameterResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass config_server::SetParameter
  :super ros::object
  :slots ())

(setf (get config_server::SetParameter :md5sum-) "ec7a3cf3b2b316cbec7051b32ed868f7")
(setf (get config_server::SetParameter :datatype-) "config_server/SetParameter")
(setf (get config_server::SetParameter :request) config_server::SetParameterRequest)
(setf (get config_server::SetParameter :response) config_server::SetParameterResponse)

(defmethod config_server::SetParameterRequest
  (:response () (instance config_server::SetParameterResponse :init)))

(setf (get config_server::SetParameterRequest :md5sum-) "ec7a3cf3b2b316cbec7051b32ed868f7")
(setf (get config_server::SetParameterRequest :datatype-) "config_server/SetParameterRequest")
(setf (get config_server::SetParameterRequest :definition-)
      "string name
string value
string no_notify
---
")

(setf (get config_server::SetParameterResponse :md5sum-) "ec7a3cf3b2b316cbec7051b32ed868f7")
(setf (get config_server::SetParameterResponse :datatype-) "config_server/SetParameterResponse")
(setf (get config_server::SetParameterResponse :definition-)
      "string name
string value
string no_notify
---
")



(provide :config_server/SetParameter "ec7a3cf3b2b316cbec7051b32ed868f7")


