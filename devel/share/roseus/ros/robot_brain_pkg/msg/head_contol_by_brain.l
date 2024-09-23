;; Auto-generated. Do not edit!


(when (boundp 'robot_brain_pkg::head_contol_by_brain)
  (if (not (find-package "ROBOT_BRAIN_PKG"))
    (make-package "ROBOT_BRAIN_PKG"))
  (shadow 'head_contol_by_brain (find-package "ROBOT_BRAIN_PKG")))
(unless (find-package "ROBOT_BRAIN_PKG::HEAD_CONTOL_BY_BRAIN")
  (make-package "ROBOT_BRAIN_PKG::HEAD_CONTOL_BY_BRAIN"))

(in-package "ROS")
;;//! \htmlinclude head_contol_by_brain.msg.html


(defclass robot_brain_pkg::head_contol_by_brain
  :super ros::object
  :slots (_neck_rotation_theta_angle _neck_front_swing_theta_angle _is_find_state _is_follow_state ))

(defmethod robot_brain_pkg::head_contol_by_brain
  (:init
   (&key
    ((:neck_rotation_theta_angle __neck_rotation_theta_angle) 0.0)
    ((:neck_front_swing_theta_angle __neck_front_swing_theta_angle) 0.0)
    ((:is_find_state __is_find_state) nil)
    ((:is_follow_state __is_follow_state) nil)
    )
   (send-super :init)
   (setq _neck_rotation_theta_angle (float __neck_rotation_theta_angle))
   (setq _neck_front_swing_theta_angle (float __neck_front_swing_theta_angle))
   (setq _is_find_state __is_find_state)
   (setq _is_follow_state __is_follow_state)
   self)
  (:neck_rotation_theta_angle
   (&optional __neck_rotation_theta_angle)
   (if __neck_rotation_theta_angle (setq _neck_rotation_theta_angle __neck_rotation_theta_angle)) _neck_rotation_theta_angle)
  (:neck_front_swing_theta_angle
   (&optional __neck_front_swing_theta_angle)
   (if __neck_front_swing_theta_angle (setq _neck_front_swing_theta_angle __neck_front_swing_theta_angle)) _neck_front_swing_theta_angle)
  (:is_find_state
   (&optional __is_find_state)
   (if __is_find_state (setq _is_find_state __is_find_state)) _is_find_state)
  (:is_follow_state
   (&optional __is_follow_state)
   (if __is_follow_state (setq _is_follow_state __is_follow_state)) _is_follow_state)
  (:serialization-length
   ()
   (+
    ;; float64 _neck_rotation_theta_angle
    8
    ;; float64 _neck_front_swing_theta_angle
    8
    ;; bool _is_find_state
    1
    ;; bool _is_follow_state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _neck_rotation_theta_angle
       (sys::poke _neck_rotation_theta_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _neck_front_swing_theta_angle
       (sys::poke _neck_front_swing_theta_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _is_find_state
       (if _is_find_state (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_follow_state
       (if _is_follow_state (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _neck_rotation_theta_angle
     (setq _neck_rotation_theta_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _neck_front_swing_theta_angle
     (setq _neck_front_swing_theta_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _is_find_state
     (setq _is_find_state (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_follow_state
     (setq _is_follow_state (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robot_brain_pkg::head_contol_by_brain :md5sum-) "e40d90720bf88cd6f3200a64bcb87dbc")
(setf (get robot_brain_pkg::head_contol_by_brain :datatype-) "robot_brain_pkg/head_contol_by_brain")
(setf (get robot_brain_pkg::head_contol_by_brain :definition-)
      "float64 neck_rotation_theta_angle  # 颈旋转关节角度
float64 neck_front_swing_theta_angle # 颈前摆关节角度
bool is_find_state # 是否找球状态
bool is_follow_state # 是否跟球状态
")



(provide :robot_brain_pkg/head_contol_by_brain "e40d90720bf88cd6f3200a64bcb87dbc")


