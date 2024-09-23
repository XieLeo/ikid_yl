;; Auto-generated. Do not edit!


(when (boundp 'worker_brain_pkg::calculate_position_result)
  (if (not (find-package "WORKER_BRAIN_PKG"))
    (make-package "WORKER_BRAIN_PKG"))
  (shadow 'calculate_position_result (find-package "WORKER_BRAIN_PKG")))
(unless (find-package "WORKER_BRAIN_PKG::CALCULATE_POSITION_RESULT")
  (make-package "WORKER_BRAIN_PKG::CALCULATE_POSITION_RESULT"))

(in-package "ROS")
;;//! \htmlinclude calculate_position_result.msg.html


(defclass worker_brain_pkg::calculate_position_result
  :super ros::object
  :slots (_football_xyxy _goal_xyxy _net_xyxy _robot_xyxy _penalty_mark_xyxy _center_circle_xyxy _distance _kf_distance ))

(defmethod worker_brain_pkg::calculate_position_result
  (:init
   (&key
    ((:football_xyxy __football_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:goal_xyxy __goal_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:net_xyxy __net_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:robot_xyxy __robot_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:penalty_mark_xyxy __penalty_mark_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:center_circle_xyxy __center_circle_xyxy) (make-array 0 :initial-element 0 :element-type :integer))
    ((:distance __distance) 0.0)
    ((:kf_distance __kf_distance) 0.0)
    )
   (send-super :init)
   (setq _football_xyxy __football_xyxy)
   (setq _goal_xyxy __goal_xyxy)
   (setq _net_xyxy __net_xyxy)
   (setq _robot_xyxy __robot_xyxy)
   (setq _penalty_mark_xyxy __penalty_mark_xyxy)
   (setq _center_circle_xyxy __center_circle_xyxy)
   (setq _distance (float __distance))
   (setq _kf_distance (float __kf_distance))
   self)
  (:football_xyxy
   (&optional __football_xyxy)
   (if __football_xyxy (setq _football_xyxy __football_xyxy)) _football_xyxy)
  (:goal_xyxy
   (&optional __goal_xyxy)
   (if __goal_xyxy (setq _goal_xyxy __goal_xyxy)) _goal_xyxy)
  (:net_xyxy
   (&optional __net_xyxy)
   (if __net_xyxy (setq _net_xyxy __net_xyxy)) _net_xyxy)
  (:robot_xyxy
   (&optional __robot_xyxy)
   (if __robot_xyxy (setq _robot_xyxy __robot_xyxy)) _robot_xyxy)
  (:penalty_mark_xyxy
   (&optional __penalty_mark_xyxy)
   (if __penalty_mark_xyxy (setq _penalty_mark_xyxy __penalty_mark_xyxy)) _penalty_mark_xyxy)
  (:center_circle_xyxy
   (&optional __center_circle_xyxy)
   (if __center_circle_xyxy (setq _center_circle_xyxy __center_circle_xyxy)) _center_circle_xyxy)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:kf_distance
   (&optional __kf_distance)
   (if __kf_distance (setq _kf_distance __kf_distance)) _kf_distance)
  (:serialization-length
   ()
   (+
    ;; int32[] _football_xyxy
    (* 4    (length _football_xyxy)) 4
    ;; int32[] _goal_xyxy
    (* 4    (length _goal_xyxy)) 4
    ;; int32[] _net_xyxy
    (* 4    (length _net_xyxy)) 4
    ;; int32[] _robot_xyxy
    (* 4    (length _robot_xyxy)) 4
    ;; int32[] _penalty_mark_xyxy
    (* 4    (length _penalty_mark_xyxy)) 4
    ;; int32[] _center_circle_xyxy
    (* 4    (length _center_circle_xyxy)) 4
    ;; float64 _distance
    8
    ;; float64 _kf_distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _football_xyxy
     (write-long (length _football_xyxy) s)
     (dotimes (i (length _football_xyxy))
       (write-long (elt _football_xyxy i) s)
       )
     ;; int32[] _goal_xyxy
     (write-long (length _goal_xyxy) s)
     (dotimes (i (length _goal_xyxy))
       (write-long (elt _goal_xyxy i) s)
       )
     ;; int32[] _net_xyxy
     (write-long (length _net_xyxy) s)
     (dotimes (i (length _net_xyxy))
       (write-long (elt _net_xyxy i) s)
       )
     ;; int32[] _robot_xyxy
     (write-long (length _robot_xyxy) s)
     (dotimes (i (length _robot_xyxy))
       (write-long (elt _robot_xyxy i) s)
       )
     ;; int32[] _penalty_mark_xyxy
     (write-long (length _penalty_mark_xyxy) s)
     (dotimes (i (length _penalty_mark_xyxy))
       (write-long (elt _penalty_mark_xyxy i) s)
       )
     ;; int32[] _center_circle_xyxy
     (write-long (length _center_circle_xyxy) s)
     (dotimes (i (length _center_circle_xyxy))
       (write-long (elt _center_circle_xyxy i) s)
       )
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _kf_distance
       (sys::poke _kf_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _football_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _football_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _football_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _goal_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _goal_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _net_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _net_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _net_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _robot_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _robot_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _penalty_mark_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _penalty_mark_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _penalty_mark_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _center_circle_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _center_circle_xyxy (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _center_circle_xyxy i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _kf_distance
     (setq _kf_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get worker_brain_pkg::calculate_position_result :md5sum-) "e9ec4e75c98d04e4a675f9b544fcf13d")
(setf (get worker_brain_pkg::calculate_position_result :datatype-) "worker_brain_pkg/calculate_position_result")
(setf (get worker_brain_pkg::calculate_position_result :definition-)
      "# 目标检测像素坐标点
int32[] football_xyxy
int32[] goal_xyxy
int32[] net_xyxy
int32[] robot_xyxy
int32[] penalty_mark_xyxy
int32[] center_circle_xyxy
# PNP计算距离
float64 distance # 原始PNP计算距离
float64 kf_distance # 卡尔曼滤波后的计算距离
")



(provide :worker_brain_pkg/calculate_position_result "e9ec4e75c98d04e4a675f9b544fcf13d")


