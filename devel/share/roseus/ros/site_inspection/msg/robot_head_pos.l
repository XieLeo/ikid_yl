;; Auto-generated. Do not edit!


(when (boundp 'site_inspection::robot_head_pos)
  (if (not (find-package "SITE_INSPECTION"))
    (make-package "SITE_INSPECTION"))
  (shadow 'robot_head_pos (find-package "SITE_INSPECTION")))
(unless (find-package "SITE_INSPECTION::ROBOT_HEAD_POS")
  (make-package "SITE_INSPECTION::ROBOT_HEAD_POS"))

(in-package "ROS")
;;//! \htmlinclude robot_head_pos.msg.html


(defclass site_inspection::robot_head_pos
  :super ros::object
  :slots (_neck_rotation_theta _neck_front_swing_theta ))

(defmethod site_inspection::robot_head_pos
  (:init
   (&key
    ((:neck_rotation_theta __neck_rotation_theta) 0.0)
    ((:neck_front_swing_theta __neck_front_swing_theta) 0.0)
    )
   (send-super :init)
   (setq _neck_rotation_theta (float __neck_rotation_theta))
   (setq _neck_front_swing_theta (float __neck_front_swing_theta))
   self)
  (:neck_rotation_theta
   (&optional __neck_rotation_theta)
   (if __neck_rotation_theta (setq _neck_rotation_theta __neck_rotation_theta)) _neck_rotation_theta)
  (:neck_front_swing_theta
   (&optional __neck_front_swing_theta)
   (if __neck_front_swing_theta (setq _neck_front_swing_theta __neck_front_swing_theta)) _neck_front_swing_theta)
  (:serialization-length
   ()
   (+
    ;; float64 _neck_rotation_theta
    8
    ;; float64 _neck_front_swing_theta
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _neck_rotation_theta
       (sys::poke _neck_rotation_theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _neck_front_swing_theta
       (sys::poke _neck_front_swing_theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _neck_rotation_theta
     (setq _neck_rotation_theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _neck_front_swing_theta
     (setq _neck_front_swing_theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get site_inspection::robot_head_pos :md5sum-) "1abf8b03136e17e9236b9db881fa8e69")
(setf (get site_inspection::robot_head_pos :datatype-) "site_inspection/robot_head_pos")
(setf (get site_inspection::robot_head_pos :definition-)
      "float64 neck_rotation_theta  # 颈旋转关节角度
float64 neck_front_swing_theta # 颈前摆关节角度
")



(provide :site_inspection/robot_head_pos "1abf8b03136e17e9236b9db881fa8e69")


