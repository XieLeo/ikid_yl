;; Auto-generated. Do not edit!


(when (boundp 'localization_pkg::ParticleSet)
  (if (not (find-package "LOCALIZATION_PKG"))
    (make-package "LOCALIZATION_PKG"))
  (shadow 'ParticleSet (find-package "LOCALIZATION_PKG")))
(unless (find-package "LOCALIZATION_PKG::PARTICLESET")
  (make-package "LOCALIZATION_PKG::PARTICLESET"))

(in-package "ROS")
;;//! \htmlinclude ParticleSet.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass localization_pkg::ParticleSet
  :super ros::object
  :slots (_header _particles ))

(defmethod localization_pkg::ParticleSet
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:particles __particles) (let (r) (dotimes (i 0) (push (instance localization_pkg::Particle :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _particles __particles)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:particles
   (&rest __particles)
   (if (keywordp (car __particles))
       (send* _particles __particles)
     (progn
       (if __particles (setq _particles (car __particles)))
       _particles)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; localization_pkg/Particle[] _particles
    (apply #'+ (send-all _particles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; localization_pkg/Particle[] _particles
     (write-long (length _particles) s)
     (dolist (elem _particles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; localization_pkg/Particle[] _particles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _particles (let (r) (dotimes (i n) (push (instance localization_pkg::Particle :init) r)) r))
     (dolist (elem- _particles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get localization_pkg::ParticleSet :md5sum-) "4d32c9e0abdc8871f449c29f3a280317")
(setf (get localization_pkg::ParticleSet :datatype-) "localization_pkg/ParticleSet")
(setf (get localization_pkg::ParticleSet :definition-)
      "Header header
Particle[] particles

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: localization_pkg/Particle
geometry_msgs/Pose2D pose
float32 weight

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

")



(provide :localization_pkg/ParticleSet "4d32c9e0abdc8871f449c29f3a280317")


