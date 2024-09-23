;; Auto-generated. Do not edit!


(when (boundp 'realtime_detect_pkg::image_points)
  (if (not (find-package "REALTIME_DETECT_PKG"))
    (make-package "REALTIME_DETECT_PKG"))
  (shadow 'image_points (find-package "REALTIME_DETECT_PKG")))
(unless (find-package "REALTIME_DETECT_PKG::IMAGE_POINTS")
  (make-package "REALTIME_DETECT_PKG::IMAGE_POINTS"))

(in-package "ROS")
;;//! \htmlinclude image_points.msg.html


(defclass realtime_detect_pkg::image_points
  :super ros::object
  :slots (_coordinates ))

(defmethod realtime_detect_pkg::image_points
  (:init
   (&key
    ((:coordinates __coordinates) (make-array 4 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _coordinates __coordinates)
   self)
  (:coordinates
   (&optional __coordinates)
   (if __coordinates (setq _coordinates __coordinates)) _coordinates)
  (:serialization-length
   ()
   (+
    ;; int32[4] _coordinates
    (* 4    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[4] _coordinates
     (dotimes (i 4)
       (write-long (elt _coordinates i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[4] _coordinates
   (dotimes (i (length _coordinates))
     (setf (elt _coordinates i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get realtime_detect_pkg::image_points :md5sum-) "39d95add7fb2b7fc613712df91e2c161")
(setf (get realtime_detect_pkg::image_points :datatype-) "realtime_detect_pkg/image_points")
(setf (get realtime_detect_pkg::image_points :definition-)
      "int32[4] coordinates  # 用于存储一个检测框的四个坐标 [x1, y1, x2, y2]
")



(provide :realtime_detect_pkg/image_points "39d95add7fb2b7fc613712df91e2c161")


