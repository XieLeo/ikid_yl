;; Auto-generated. Do not edit!


(when (boundp 'localization_pkg::ObstacleDetection)
  (if (not (find-package "LOCALIZATION_PKG"))
    (make-package "LOCALIZATION_PKG"))
  (shadow 'ObstacleDetection (find-package "LOCALIZATION_PKG")))
(unless (find-package "LOCALIZATION_PKG::OBSTACLEDETECTION")
  (make-package "LOCALIZATION_PKG::OBSTACLEDETECTION"))

(in-package "ROS")
;;//! \htmlinclude ObstacleDetection.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass localization_pkg::ObstacleDetection
  :super ros::object
  :slots (_left_lower_corner _right_lower_corner ))

(defmethod localization_pkg::ObstacleDetection
  (:init
   (&key
    ((:left_lower_corner __left_lower_corner) (instance geometry_msgs::Point :init))
    ((:right_lower_corner __right_lower_corner) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _left_lower_corner __left_lower_corner)
   (setq _right_lower_corner __right_lower_corner)
   self)
  (:left_lower_corner
   (&rest __left_lower_corner)
   (if (keywordp (car __left_lower_corner))
       (send* _left_lower_corner __left_lower_corner)
     (progn
       (if __left_lower_corner (setq _left_lower_corner (car __left_lower_corner)))
       _left_lower_corner)))
  (:right_lower_corner
   (&rest __right_lower_corner)
   (if (keywordp (car __right_lower_corner))
       (send* _right_lower_corner __right_lower_corner)
     (progn
       (if __right_lower_corner (setq _right_lower_corner (car __right_lower_corner)))
       _right_lower_corner)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _left_lower_corner
    (send _left_lower_corner :serialization-length)
    ;; geometry_msgs/Point _right_lower_corner
    (send _right_lower_corner :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _left_lower_corner
       (send _left_lower_corner :serialize s)
     ;; geometry_msgs/Point _right_lower_corner
       (send _right_lower_corner :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _left_lower_corner
     (send _left_lower_corner :deserialize buf ptr-) (incf ptr- (send _left_lower_corner :serialization-length))
   ;; geometry_msgs/Point _right_lower_corner
     (send _right_lower_corner :deserialize buf ptr-) (incf ptr- (send _right_lower_corner :serialization-length))
   ;;
   self)
  )

(setf (get localization_pkg::ObstacleDetection :md5sum-) "d667fd4ba057e0adbc55ef5b683aec9a")
(setf (get localization_pkg::ObstacleDetection :datatype-) "localization_pkg/ObstacleDetection")
(setf (get localization_pkg::ObstacleDetection :definition-)
      "geometry_msgs/Point left_lower_corner
geometry_msgs/Point right_lower_corner
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :localization_pkg/ObstacleDetection "d667fd4ba057e0adbc55ef5b683aec9a")


