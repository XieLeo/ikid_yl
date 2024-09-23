;; Auto-generated. Do not edit!


(when (boundp 'config_server::SubscribeList)
  (if (not (find-package "CONFIG_SERVER"))
    (make-package "CONFIG_SERVER"))
  (shadow 'SubscribeList (find-package "CONFIG_SERVER")))
(unless (find-package "CONFIG_SERVER::SUBSCRIBELIST")
  (make-package "CONFIG_SERVER::SUBSCRIBELIST"))
(unless (find-package "CONFIG_SERVER::SUBSCRIBELISTREQUEST")
  (make-package "CONFIG_SERVER::SUBSCRIBELISTREQUEST"))
(unless (find-package "CONFIG_SERVER::SUBSCRIBELISTRESPONSE")
  (make-package "CONFIG_SERVER::SUBSCRIBELISTRESPONSE"))

(in-package "ROS")





(defclass config_server::SubscribeListRequest
  :super ros::object
  :slots (_callback _parameters ))

(defmethod config_server::SubscribeListRequest
  (:init
   (&key
    ((:callback __callback) "")
    ((:parameters __parameters) (let (r) (dotimes (i 0) (push (instance config_server::ParameterDescription :init) r)) r))
    )
   (send-super :init)
   (setq _callback (string __callback))
   (setq _parameters __parameters)
   self)
  (:callback
   (&optional __callback)
   (if __callback (setq _callback __callback)) _callback)
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
    ;; string _callback
    4 (length _callback)
    ;; config_server/ParameterDescription[] _parameters
    (apply #'+ (send-all _parameters :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _callback
       (write-long (length _callback) s) (princ _callback s)
     ;; config_server/ParameterDescription[] _parameters
     (write-long (length _parameters) s)
     (dolist (elem _parameters)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _callback
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _callback (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(defclass config_server::SubscribeListResponse
  :super ros::object
  :slots (_values ))

(defmethod config_server::SubscribeListResponse
  (:init
   (&key
    ((:values __values) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _values __values)
   self)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:serialization-length
   ()
   (+
    ;; string[] _values
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _values)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _values
     (write-long (length _values) s)
     (dolist (elem _values)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _values i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass config_server::SubscribeList
  :super ros::object
  :slots ())

(setf (get config_server::SubscribeList :md5sum-) "b3d53d10785172ca95ba19fea29582f8")
(setf (get config_server::SubscribeList :datatype-) "config_server/SubscribeList")
(setf (get config_server::SubscribeList :request) config_server::SubscribeListRequest)
(setf (get config_server::SubscribeList :response) config_server::SubscribeListResponse)

(defmethod config_server::SubscribeListRequest
  (:response () (instance config_server::SubscribeListResponse :init)))

(setf (get config_server::SubscribeListRequest :md5sum-) "b3d53d10785172ca95ba19fea29582f8")
(setf (get config_server::SubscribeListRequest :datatype-) "config_server/SubscribeListRequest")
(setf (get config_server::SubscribeListRequest :definition-)
      "string callback
ParameterDescription[] parameters

================================================================================
MSG: config_server/ParameterDescription
string name
string type
float32 min
float32 max
float32 step
---
string[] values
")

(setf (get config_server::SubscribeListResponse :md5sum-) "b3d53d10785172ca95ba19fea29582f8")
(setf (get config_server::SubscribeListResponse :datatype-) "config_server/SubscribeListResponse")
(setf (get config_server::SubscribeListResponse :definition-)
      "string callback
ParameterDescription[] parameters

================================================================================
MSG: config_server/ParameterDescription
string name
string type
float32 min
float32 max
float32 step
---
string[] values
")



(provide :config_server/SubscribeList "b3d53d10785172ca95ba19fea29582f8")


