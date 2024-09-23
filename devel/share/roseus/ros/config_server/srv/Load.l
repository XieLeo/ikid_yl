;; Auto-generated. Do not edit!


(when (boundp 'config_server::Load)
  (if (not (find-package "CONFIG_SERVER"))
    (make-package "CONFIG_SERVER"))
  (shadow 'Load (find-package "CONFIG_SERVER")))
(unless (find-package "CONFIG_SERVER::LOAD")
  (make-package "CONFIG_SERVER::LOAD"))
(unless (find-package "CONFIG_SERVER::LOADREQUEST")
  (make-package "CONFIG_SERVER::LOADREQUEST"))
(unless (find-package "CONFIG_SERVER::LOADRESPONSE")
  (make-package "CONFIG_SERVER::LOADRESPONSE"))

(in-package "ROS")





(defclass config_server::LoadRequest
  :super ros::object
  :slots (_filename ))

(defmethod config_server::LoadRequest
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

(defclass config_server::LoadResponse
  :super ros::object
  :slots ())

(defmethod config_server::LoadResponse
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

(defclass config_server::Load
  :super ros::object
  :slots ())

(setf (get config_server::Load :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get config_server::Load :datatype-) "config_server/Load")
(setf (get config_server::Load :request) config_server::LoadRequest)
(setf (get config_server::Load :response) config_server::LoadResponse)

(defmethod config_server::LoadRequest
  (:response () (instance config_server::LoadResponse :init)))

(setf (get config_server::LoadRequest :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get config_server::LoadRequest :datatype-) "config_server/LoadRequest")
(setf (get config_server::LoadRequest :definition-)
      "string filename
---

")

(setf (get config_server::LoadResponse :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get config_server::LoadResponse :datatype-) "config_server/LoadResponse")
(setf (get config_server::LoadResponse :definition-)
      "string filename
---

")



(provide :config_server/Load "030824f52a0628ead956fb9d67e66ae9")


