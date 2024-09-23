;; Auto-generated. Do not edit!


(when (boundp 'localization_pkg::CompassHeading)
  (if (not (find-package "LOCALIZATION_PKG"))
    (make-package "LOCALIZATION_PKG"))
  (shadow 'CompassHeading (find-package "LOCALIZATION_PKG")))
(unless (find-package "LOCALIZATION_PKG::COMPASSHEADING")
  (make-package "LOCALIZATION_PKG::COMPASSHEADING"))

(in-package "ROS")
;;//! \htmlinclude CompassHeading.msg.html


(defclass localization_pkg::CompassHeading
  :super ros::object
  :slots (_stamp _heading ))

(defmethod localization_pkg::CompassHeading
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:heading __heading) 0.0)
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _heading (float __heading))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; float32 _heading
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get localization_pkg::CompassHeading :md5sum-) "5ad4832863e6aeae982283d427018cbf")
(setf (get localization_pkg::CompassHeading :datatype-) "localization_pkg/CompassHeading")
(setf (get localization_pkg::CompassHeading :definition-)
      "time stamp
float32 heading
")



(provide :localization_pkg/CompassHeading "5ad4832863e6aeae982283d427018cbf")


