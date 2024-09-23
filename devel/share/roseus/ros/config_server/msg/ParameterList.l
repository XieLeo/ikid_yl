;; Auto-generated. Do not edit!


(when (boundp 'config_server::ParameterList)
  (if (not (find-package "CONFIG_SERVER"))
    (make-package "CONFIG_SERVER"))
  (shadow 'ParameterList (find-package "CONFIG_SERVER")))
(unless (find-package "CONFIG_SERVER::PARAMETERLIST")
  (make-package "CONFIG_SERVER::PARAMETERLIST"))

(in-package "ROS")
;;//! \htmlinclude ParameterList.msg.html


(defclass config_server::ParameterList
  :super ros::object
  :slots (_parameters ))

(defmethod config_server::ParameterList
  (:init
   (&key
    ((:parameters __parameters) (let (r) (dotimes (i 0) (push (instance config_server::ParameterDescription :init) r)) r))
    )
   (send-super :init)
   (setq _parameters __parameters)
   self)
  (:parameters
   (&rest __parameters)
   (if (keywordp (car __parameters))
       (send* _parameters __parameters)
     (progn
       (if __parameters (setq _parameters (car __parameters)))
       _parameters)))
  (:serialization-length
   ()
   (+
    ;; config_server/ParameterDescription[] _parameters
    (apply #'+ (send-all _parameters :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; config_server/ParameterDescription[] _parameters
     (write-long (length _parameters) s)
     (dolist (elem _parameters)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; config_server/ParameterDescription[] _parameters
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _parameters (let (r) (dotimes (i n) (push (instance config_server::ParameterDescription :init) r)) r))
     (dolist (elem- _parameters)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get config_server::ParameterList :md5sum-) "b43150e18cd687d16ddbddaf1454c72c")
(setf (get config_server::ParameterList :datatype-) "config_server/ParameterList")
(setf (get config_server::ParameterList :definition-)
      "ParameterDescription[] parameters
================================================================================
MSG: config_server/ParameterDescription
string name
string type
float32 min
float32 max
float32 step
string default_value
")



(provide :config_server/ParameterList "b43150e18cd687d16ddbddaf1454c72c")


