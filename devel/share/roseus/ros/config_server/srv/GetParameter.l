;; Auto-generated. Do not edit!


(when (boundp 'config_server::GetParameter)
  (if (not (find-package "CONFIG_SERVER"))
    (make-package "CONFIG_SERVER"))
  (shadow 'GetParameter (find-package "CONFIG_SERVER")))
(unless (find-package "CONFIG_SERVER::GETPARAMETER")
  (make-package "CONFIG_SERVER::GETPARAMETER"))
(unless (find-package "CONFIG_SERVER::GETPARAMETERREQUEST")
  (make-package "CONFIG_SERVER::GETPARAMETERREQUEST"))
(unless (find-package "CONFIG_SERVER::GETPARAMETERRESPONSE")
  (make-package "CONFIG_SERVER::GETPARAMETERRESPONSE"))

(in-package "ROS")





(defclass config_server::GetParameterRequest
  :super ros::object
  :slots (_name ))

(defmethod config_server::GetParameterRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass config_server::GetParameterResponse
  :super ros::object
  :slots (_value ))

(defmethod config_server::GetParameterResponse
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

(defclass config_server::GetParameter
  :super ros::object
  :slots ())

(setf (get config_server::GetParameter :md5sum-) "f20c32a0b2a08c9ecdba58674ac1438f")
(setf (get config_server::GetParameter :datatype-) "config_server/GetParameter")
(setf (get config_server::GetParameter :request) config_server::GetParameterRequest)
(setf (get config_server::GetParameter :response) config_server::GetParameterResponse)

(defmethod config_server::GetParameterRequest
  (:response () (instance config_server::GetParameterResponse :init)))

(setf (get config_server::GetParameterRequest :md5sum-) "f20c32a0b2a08c9ecdba58674ac1438f")
(setf (get config_server::GetParameterRequest :datatype-) "config_server/GetParameterRequest")
(setf (get config_server::GetParameterRequest :definition-)
      "string name
---
string value
")

(setf (get config_server::GetParameterResponse :md5sum-) "f20c32a0b2a08c9ecdba58674ac1438f")
(setf (get config_server::GetParameterResponse :datatype-) "config_server/GetParameterResponse")
(setf (get config_server::GetParameterResponse :definition-)
      "string name
---
string value
")



(provide :config_server/GetParameter "f20c32a0b2a08c9ecdba58674ac1438f")


