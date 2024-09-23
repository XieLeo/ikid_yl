;; Auto-generated. Do not edit!


(when (boundp 'config_server::Save)
  (if (not (find-package "CONFIG_SERVER"))
    (make-package "CONFIG_SERVER"))
  (shadow 'Save (find-package "CONFIG_SERVER")))
(unless (find-package "CONFIG_SERVER::SAVE")
  (make-package "CONFIG_SERVER::SAVE"))
(unless (find-package "CONFIG_SERVER::SAVEREQUEST")
  (make-package "CONFIG_SERVER::SAVEREQUEST"))
(unless (find-package "CONFIG_SERVER::SAVERESPONSE")
  (make-package "CONFIG_SERVER::SAVERESPONSE"))

(in-package "ROS")





(defclass config_server::SaveRequest
  :super ros::object
  :slots (_filename ))

(defmethod config_server::SaveRequest
  (:init
   (&key
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _filename (string __filename))
   self)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass config_server::SaveResponse
  :super ros::object
  :slots ())

(defmethod config_server::SaveResponse
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

(defclass config_server::Save
  :super ros::object
  :slots ())

(setf (get config_server::Save :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get config_server::Save :datatype-) "config_server/Save")
(setf (get config_server::Save :request) config_server::SaveRequest)
(setf (get config_server::Save :response) config_server::SaveResponse)

(defmethod config_server::SaveRequest
  (:response () (instance config_server::SaveResponse :init)))

(setf (get config_server::SaveRequest :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get config_server::SaveRequest :datatype-) "config_server/SaveRequest")
(setf (get config_server::SaveRequest :definition-)
      "string filename
---

")

(setf (get config_server::SaveResponse :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get config_server::SaveResponse :datatype-) "config_server/SaveResponse")
(setf (get config_server::SaveResponse :definition-)
      "string filename
---

")



(provide :config_server/Save "030824f52a0628ead956fb9d67e66ae9")


