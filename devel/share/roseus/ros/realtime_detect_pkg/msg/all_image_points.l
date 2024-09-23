;; Auto-generated. Do not edit!


(when (boundp 'realtime_detect_pkg::all_image_points)
  (if (not (find-package "REALTIME_DETECT_PKG"))
    (make-package "REALTIME_DETECT_PKG"))
  (shadow 'all_image_points (find-package "REALTIME_DETECT_PKG")))
(unless (find-package "REALTIME_DETECT_PKG::ALL_IMAGE_POINTS")
  (make-package "REALTIME_DETECT_PKG::ALL_IMAGE_POINTS"))

(in-package "ROS")
;;//! \htmlinclude all_image_points.msg.html


(defclass realtime_detect_pkg::all_image_points
  :super ros::object
  :slots (_ball_xyxy _goalpost_xyxy _robot_xyxy _L_mark_xyxy _T_mark_xyxy _X_mark_xyxy ))

(defmethod realtime_detect_pkg::all_image_points
  (:init
   (&key
    ((:ball_xyxy __ball_xyxy) (let (r) (dotimes (i 0) (push (instance realtime_detect_pkg::image_points :init) r)) r))
    ((:goalpost_xyxy __goalpost_xyxy) (let (r) (dotimes (i 0) (push (instance realtime_detect_pkg::image_points :init) r)) r))
    ((:robot_xyxy __robot_xyxy) (let (r) (dotimes (i 0) (push (instance realtime_detect_pkg::image_points :init) r)) r))
    ((:L_mark_xyxy __L_mark_xyxy) (let (r) (dotimes (i 0) (push (instance realtime_detect_pkg::image_points :init) r)) r))
    ((:T_mark_xyxy __T_mark_xyxy) (let (r) (dotimes (i 0) (push (instance realtime_detect_pkg::image_points :init) r)) r))
    ((:X_mark_xyxy __X_mark_xyxy) (let (r) (dotimes (i 0) (push (instance realtime_detect_pkg::image_points :init) r)) r))
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
   (&rest __ball_xyxy)
   (if (keywordp (car __ball_xyxy))
       (send* _ball_xyxy __ball_xyxy)
     (progn
       (if __ball_xyxy (setq _ball_xyxy (car __ball_xyxy)))
       _ball_xyxy)))
  (:goalpost_xyxy
   (&rest __goalpost_xyxy)
   (if (keywordp (car __goalpost_xyxy))
       (send* _goalpost_xyxy __goalpost_xyxy)
     (progn
       (if __goalpost_xyxy (setq _goalpost_xyxy (car __goalpost_xyxy)))
       _goalpost_xyxy)))
  (:robot_xyxy
   (&rest __robot_xyxy)
   (if (keywordp (car __robot_xyxy))
       (send* _robot_xyxy __robot_xyxy)
     (progn
       (if __robot_xyxy (setq _robot_xyxy (car __robot_xyxy)))
       _robot_xyxy)))
  (:L_mark_xyxy
   (&rest __L_mark_xyxy)
   (if (keywordp (car __L_mark_xyxy))
       (send* _L_mark_xyxy __L_mark_xyxy)
     (progn
       (if __L_mark_xyxy (setq _L_mark_xyxy (car __L_mark_xyxy)))
       _L_mark_xyxy)))
  (:T_mark_xyxy
   (&rest __T_mark_xyxy)
   (if (keywordp (car __T_mark_xyxy))
       (send* _T_mark_xyxy __T_mark_xyxy)
     (progn
       (if __T_mark_xyxy (setq _T_mark_xyxy (car __T_mark_xyxy)))
       _T_mark_xyxy)))
  (:X_mark_xyxy
   (&rest __X_mark_xyxy)
   (if (keywordp (car __X_mark_xyxy))
       (send* _X_mark_xyxy __X_mark_xyxy)
     (progn
       (if __X_mark_xyxy (setq _X_mark_xyxy (car __X_mark_xyxy)))
       _X_mark_xyxy)))
  (:serialization-length
   ()
   (+
    ;; realtime_detect_pkg/image_points[] _ball_xyxy
    (apply #'+ (send-all _ball_xyxy :serialization-length)) 4
    ;; realtime_detect_pkg/image_points[] _goalpost_xyxy
    (apply #'+ (send-all _goalpost_xyxy :serialization-length)) 4
    ;; realtime_detect_pkg/image_points[] _robot_xyxy
    (apply #'+ (send-all _robot_xyxy :serialization-length)) 4
    ;; realtime_detect_pkg/image_points[] _L_mark_xyxy
    (apply #'+ (send-all _L_mark_xyxy :serialization-length)) 4
    ;; realtime_detect_pkg/image_points[] _T_mark_xyxy
    (apply #'+ (send-all _T_mark_xyxy :serialization-length)) 4
    ;; realtime_detect_pkg/image_points[] _X_mark_xyxy
    (apply #'+ (send-all _X_mark_xyxy :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; realtime_detect_pkg/image_points[] _ball_xyxy
     (write-long (length _ball_xyxy) s)
     (dolist (elem _ball_xyxy)
       (send elem :serialize s)
       )
     ;; realtime_detect_pkg/image_points[] _goalpost_xyxy
     (write-long (length _goalpost_xyxy) s)
     (dolist (elem _goalpost_xyxy)
       (send elem :serialize s)
       )
     ;; realtime_detect_pkg/image_points[] _robot_xyxy
     (write-long (length _robot_xyxy) s)
     (dolist (elem _robot_xyxy)
       (send elem :serialize s)
       )
     ;; realtime_detect_pkg/image_points[] _L_mark_xyxy
     (write-long (length _L_mark_xyxy) s)
     (dolist (elem _L_mark_xyxy)
       (send elem :serialize s)
       )
     ;; realtime_detect_pkg/image_points[] _T_mark_xyxy
     (write-long (length _T_mark_xyxy) s)
     (dolist (elem _T_mark_xyxy)
       (send elem :serialize s)
       )
     ;; realtime_detect_pkg/image_points[] _X_mark_xyxy
     (write-long (length _X_mark_xyxy) s)
     (dolist (elem _X_mark_xyxy)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; realtime_detect_pkg/image_points[] _ball_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ball_xyxy (let (r) (dotimes (i n) (push (instance realtime_detect_pkg::image_points :init) r)) r))
     (dolist (elem- _ball_xyxy)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; realtime_detect_pkg/image_points[] _goalpost_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goalpost_xyxy (let (r) (dotimes (i n) (push (instance realtime_detect_pkg::image_points :init) r)) r))
     (dolist (elem- _goalpost_xyxy)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; realtime_detect_pkg/image_points[] _robot_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_xyxy (let (r) (dotimes (i n) (push (instance realtime_detect_pkg::image_points :init) r)) r))
     (dolist (elem- _robot_xyxy)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; realtime_detect_pkg/image_points[] _L_mark_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _L_mark_xyxy (let (r) (dotimes (i n) (push (instance realtime_detect_pkg::image_points :init) r)) r))
     (dolist (elem- _L_mark_xyxy)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; realtime_detect_pkg/image_points[] _T_mark_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _T_mark_xyxy (let (r) (dotimes (i n) (push (instance realtime_detect_pkg::image_points :init) r)) r))
     (dolist (elem- _T_mark_xyxy)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; realtime_detect_pkg/image_points[] _X_mark_xyxy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _X_mark_xyxy (let (r) (dotimes (i n) (push (instance realtime_detect_pkg::image_points :init) r)) r))
     (dolist (elem- _X_mark_xyxy)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get realtime_detect_pkg::all_image_points :md5sum-) "c8cd15673e10b541cdf32b31b8a02c11")
(setf (get realtime_detect_pkg::all_image_points :datatype-) "realtime_detect_pkg/all_image_points")
(setf (get realtime_detect_pkg::all_image_points :definition-)
      "image_points[] ball_xyxy
image_points[] goalpost_xyxy
image_points[] robot_xyxy
image_points[] L_mark_xyxy
image_points[] T_mark_xyxy
image_points[] X_mark_xyxy

================================================================================
MSG: realtime_detect_pkg/image_points
int32[4] coordinates  # 用于存储一个检测框的四个坐标 [x1, y1, x2, y2]
")



(provide :realtime_detect_pkg/all_image_points "c8cd15673e10b541cdf32b31b8a02c11")


