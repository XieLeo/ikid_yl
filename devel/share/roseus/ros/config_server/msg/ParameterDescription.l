;; Auto-generated. Do not edit!


(when (boundp 'config_server::ParameterDescription)
  (if (not (find-package "CONFIG_SERVER"))
    (make-package "CONFIG_SERVER"))
  (shadow 'ParameterDescription (find-package "CONFIG_SERVER")))
(unless (find-package "CONFIG_SERVER::PARAMETERDESCRIPTION")
  (make-package "CONFIG_SERVER::PARAMETERDESCRIPTION"))

(in-package "ROS")
;;//! \htmlinclude ParameterDescription.msg.html


(defclass config_server::ParameterDescription
  :super ros::object
  :slots (_name _type _min _max _step _default_value ))

(defmethod config_server::ParameterDescription
  (:init
   (&key
    ((:name __name) "")
    ((:type __type) "")
    ((:min __min) 0.0)
    ((:max __max) 0.0)
    ((:step __step) 0.0)
    ((:default_value __default_value) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _type (string __type))
   (setq _min (float __min))
   (setq _max (float __max))
   (setq _step (float __step))
   (setq _default_value (string __default_value))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:min
   (&optional __min)
   (if __min (setq _min __min)) _min)
  (:max
   (&optional __max)
   (if __max (setq _max __max)) _max)
  (:step
   (&optional __step)
   (if __step (setq _step __step)) _step)
  (:default_value
   (&optional __default_value)
   (if __default_value (setq _default_value __default_value)) _default_value)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _type
    4 (length _type)
    ;; float32 _min
    4
    ;; float32 _max
    4
    ;; float32 _step
    4
    ;; string _default_value
    4 (length _default_value)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; float32 _min
       (sys::poke _min (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max
       (sys::poke _max (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _step
       (sys::poke _step (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _default_value
       (write-long (length _default_value) s) (princ _default_value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _min
     (setq _min (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max
     (setq _max (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _step
     (setq _step (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _default_value
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _default_value (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get config_server::ParameterDescription :md5sum-) "9c0245078b378ba3521082c9d4eee955")
(setf (get config_server::ParameterDescription :datatype-) "config_server/ParameterDescription")
(setf (get config_server::ParameterDescription :definition-)
      "string name
string type
float32 min
float32 max
float32 step
string default_value
")



(provide :config_server/ParameterDescription "9c0245078b378ba3521082c9d4eee955")


