;; Auto-generated. Do not edit!


(when (boundp 'ros_socket::robot_joint)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'robot_joint (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::ROBOT_JOINT")
  (make-package "ROS_SOCKET::ROBOT_JOINT"))

(in-package "ROS")
;;//! \htmlinclude robot_joint.msg.html


(defclass ros_socket::robot_joint
  :super ros::object
  :slots (_joint ))

(defmethod ros_socket::robot_joint
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

(setf (get ros_socket::robot_joint :md5sum-) "2d98f45f5f7d408b6a0d45a64e4813c5")
(setf (get ros_socket::robot_joint :datatype-) "ros_socket/robot_joint")
(setf (get ros_socket::robot_joint :definition-)
      "float64[] joint  # 各关节位置数据
")



(provide :ros_socket/robot_joint "2d98f45f5f7d408b6a0d45a64e4813c5")


