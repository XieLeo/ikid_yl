;; Auto-generated. Do not edit!


(when (boundp 'localization_pkg::Detections)
  (if (not (find-package "LOCALIZATION_PKG"))
    (make-package "LOCALIZATION_PKG"))
  (shadow 'Detections (find-package "LOCALIZATION_PKG")))
(unless (find-package "LOCALIZATION_PKG::DETECTIONS")
  (make-package "LOCALIZATION_PKG::DETECTIONS"))

(in-package "ROS")
;;//! \htmlinclude Detections.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass localization_pkg::Detections
  :super ros::object
  :slots (_header _objects _lines _obstacles ))

(defmethod localization_pkg::Detections
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:objects __objects) (let (r) (dotimes (i 0) (push (instance localization_pkg::ObjectDetection :init) r)) r))
    ((:lines __lines) (let (r) (dotimes (i 0) (push (instance localization_pkg::LineDetection :init) r)) r))
    ((:obstacles __obstacles) (let (r) (dotimes (i 0) (push (instance localization_pkg::ObstacleDetection :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _objects __objects)
   (setq _lines __lines)
   (setq _obstacles __obstacles)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:objects
   (&rest __objects)
   (if (keywordp (car __objects))
       (send* _objects __objects)
     (progn
       (if __objects (setq _objects (car __objects)))
       _objects)))
  (:lines
   (&rest __lines)
   (if (keywordp (car __lines))
       (send* _lines __lines)
     (progn
       (if __lines (setq _lines (car __lines)))
       _lines)))
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; localization_pkg/ObjectDetection[] _objects
    (apply #'+ (send-all _objects :serialization-length)) 4
    ;; localization_pkg/LineDetection[] _lines
    (apply #'+ (send-all _lines :serialization-length)) 4
    ;; localization_pkg/ObstacleDetection[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; localization_pkg/ObjectDetection[] _objects
     (write-long (length _objects) s)
     (dolist (elem _objects)
       (send elem :serialize s)
       )
     ;; localization_pkg/LineDetection[] _lines
     (write-long (length _lines) s)
     (dolist (elem _lines)
       (send elem :serialize s)
       )
     ;; localization_pkg/ObstacleDetection[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; localization_pkg/ObjectDetection[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (let (r) (dotimes (i n) (push (instance localization_pkg::ObjectDetection :init) r)) r))
     (dolist (elem- _objects)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; localization_pkg/LineDetection[] _lines
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lines (let (r) (dotimes (i n) (push (instance localization_pkg::LineDetection :init) r)) r))
     (dolist (elem- _lines)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; localization_pkg/ObstacleDetection[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance localization_pkg::ObstacleDetection :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get localization_pkg::Detections :md5sum-) "f5a76a8205484ff68b3fae6a670e757f")
(setf (get localization_pkg::Detections :datatype-) "localization_pkg/Detections")
(setf (get localization_pkg::Detections :definition-)
      "Header header
ObjectDetection[] objects
LineDetection[] lines
ObstacleDetection[] obstacles

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
MSG: localization_pkg/ObjectDetection
geometry_msgs/Pose2D pose        # Pose
uint8 type                       # Type (see field_model::WorldObject::Type)
float32 confidence               # confidence 0..1

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

================================================================================
MSG: localization_pkg/LineDetection
float32 x1
float32 y1
float32 x2
float32 y2
================================================================================
MSG: localization_pkg/ObstacleDetection
geometry_msgs/Point left_lower_corner
geometry_msgs/Point right_lower_corner
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :localization_pkg/Detections "f5a76a8205484ff68b3fae6a670e757f")


