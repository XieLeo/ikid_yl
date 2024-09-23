;; Auto-generated. Do not edit!


(when (boundp 'calculate_position_pkg::image_points)
  (if (not (find-package "CALCULATE_POSITION_PKG"))
    (make-package "CALCULATE_POSITION_PKG"))
  (shadow 'image_points (find-package "CALCULATE_POSITION_PKG")))
(unless (find-package "CALCULATE_POSITION_PKG::IMAGE_POINTS")
  (make-package "CALCULATE_POSITION_PKG::IMAGE_POINTS"))

(in-package "ROS")
;;//! \htmlinclude image_points.msg.html


(defclass calculate_position_pkg::image_points
  :super ros::object
  :slots (_ball_xyxy _goalpost_xyxy _robot_xyxy _L_mark_xyxy _T_mark_xyxy _X_mark_xyxy ))

(defmethod calculate_position_pkg::image_points
  (:init
   (&key
    ((:ball_xyxy __ball_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:goalpost_xyxy __goalpost_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:robot_xyxy __robot_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:L_mark_xyxy __L_mark_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:T_mark_xyxy __T_mark_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:X_mark_xyxy __X_mark_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _ball_xyxy __ball_xyxy)
   (setq _goalpost_xyxy __goalpost_xyxy)
   (setq _robot_xyxy __robot_xyxy)
   (setq _L_mark_xyxy __L_mark_xyxy)
   (setq _T_mark_xyxy __T_mark_xyxy)
   (setq _X_mark_xyxy __X_mark_xyxy)
   self)
  (:ball_xyxy
   (&optional __ball_xyxy)
   (if __ball_xyxy (setq _ball_xyxy __ball_xyxy)) _ball_xyxy)
  (:goalpost_xyxy
   (&optional __goalpost_xyxy)
   (if __goalpost_xyxy (setq _goalpost_xyxy __goalpost_xyxy)) _goalpost_xyxy)
  (:robot_xyxy
   (&optional __robot_xyxy)
   (if __robot_xyxy (setq _robot_xyxy __robot_xyxy)) _robot_xyxy)
  (:L_mark_xyxy
   (&optional __L_mark_xyxy)
   (if __L_mark_xyxy (setq _L_mark_xyxy __L_mark_xyxy)) _L_mark_xyxy)
  (:T_mark_xyxy
   (&optional __T_mark_xyxy)
   (if __T_mark_xyxy (setq _T_mark_xyxy __T_mark_xyxy)) _T_mark_xyxy)
  (:X_mark_xyxy
   (&optional __X_mark_xyxy)
   (if __X_mark_xyxy (setq _X_mark_xyxy __X_mark_xyxy)) _X_mark_xyxy)
  (:serialization-length
   ()
   (+
    ;; int32[] _ball_xyxy
    (* 4    (length _ball_xyxy)) 4
    ;; int32[] _goalpost_xyxy
    (* 4    (length _goalpost_xyxy)) 4
    ;; int32[] _robot_xyxy
    (* 4    (length _robot_xyxy)) 4
    ;; int32[] _L_mark_xyxy
    (* 4    (length _L_mark_xyxy)) 4
    ;; int32[] _T_mark_xyxy
    (* 4    (length _T_mark_xyxy)) 4
    ;; int32[] _X_mark_xyxy
    (* 4    (length _X_mark_xyxy)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _ball_xyxy
     (write-long (length _ball_xyxy) s)
     (dotimes (i (length _ball_xyxy))
       (write-long (elt _ball_xyxy i) s)
       )
     ;; int32[] _goalpost_xyxy
     (write-long (length _goalpost_xyxy) s)
     (dotimes (i (length _goalpost_xyxy))
       (write-long (elt _goalpost_xyxy i) s)
       )
     ;; int32[] _robot_xyxy
     (write-long (length _robot_xyxy) s)
     (dotimes (i (length _robot_xyxy))
       (write-long (elt _robot_xyxy i) s)
       )
     ;; int32[] _L_mark_xyxy
     (write-long (length _L_mark_xyxy) s)
     (dotimes (i (length _L_mark_xyxy))
       (write-long (elt _L_mark_xyxy i) s)
       )
     ;; int32[] _T_mark_xyxy
     (write-long (length _T_mark_xyxy) s)
     (dotimes (i (length _T_mark_xyxy))
       (write-long (elt _T_mark_xyxy i) s)
       )
     ;; int32[] _X_mark_xyxy
     (write-long (length _X_mark_xyxy) s)
     (dotimes (i (length _X_mark_xyxy))
       (write-long (elt _X_mark_xyxy i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _ball_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ball_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _ball_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _goalpost_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goalpost_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _goalpost_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _robot_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _robot_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _L_mark_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _L_mark_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _L_mark_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _T_mark_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _T_mark_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _T_mark_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _X_mark_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _X_mark_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _X_mark_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get calculate_position_pkg::image_points :md5sum-) "df6d256ca807079571778bb4a61cea15")
(setf (get calculate_position_pkg::image_points :datatype-) "calculate_position_pkg/image_points")
(setf (get calculate_position_pkg::image_points :definition-)
      "int32[] ball_xyxy
int32[] goalpost_xyxy
int32[] robot_xyxy
int32[] L_mark_xyxy
int32[] T_mark_xyxy
int32[] X_mark_xyxy
")



(provide :calculate_position_pkg/image_points "df6d256ca807079571778bb4a61cea15")


