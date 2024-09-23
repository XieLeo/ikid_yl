;; Auto-generated. Do not edit!


(when (boundp 'ikid_motion_control::robot_joint)
  (if (not (find-package "IKID_MOTION_CONTROL"))
    (make-package "IKID_MOTION_CONTROL"))
  (shadow 'robot_joint (find-package "IKID_MOTION_CONTROL")))
(unless (find-package "IKID_MOTION_CONTROL::ROBOT_JOINT")
  (make-package "IKID_MOTION_CONTROL::ROBOT_JOINT"))

(in-package "ROS")
;;//! \htmlinclude robot_joint.msg.html


(defclass ikid_motion_control::robot_joint
  :super ros::object
  :slots (_joint ))

(defmethod ikid_motion_control::robot_joint
  (:init
   (&key
    ((:joint __joint) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint __joint)
   self)
  (:joint
   (&optional __joint)
   (if __joint (setq _joint __joint)) _joint)
  (:serialization-length
   ()
   (+
    ;; float64[] _joint
    (* 8    (length _joint)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _joint
     (write-long (length _joint) s)
     (dotimes (i (length _joint))
       (sys::poke (elt _joint i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _joint
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get ikid_motion_control::robot_joint :md5sum-) "2d98f45f5f7d408b6a0d45a64e4813c5")
(setf (get ikid_motion_control::robot_joint :datatype-) "ikid_motion_control/robot_joint")
(setf (get ikid_motion_control::robot_joint :definition-)
      "float64[] joint  # 各关节位置数据
")



(provide :ikid_motion_control/robot_joint "2d98f45f5f7d408b6a0d45a64e4813c5")


