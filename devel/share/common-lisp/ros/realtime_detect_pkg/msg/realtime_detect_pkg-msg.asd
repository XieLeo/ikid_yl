
(cl:in-package :asdf)

(defsystem "realtime_detect_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Detections" :depends-on ("_package_Detections"))
    (:file "_package_Detections" :depends-on ("_package"))
    (:file "ObjectDetection" :depends-on ("_package_ObjectDetection"))
    (:file "_package_ObjectDetection" :depends-on ("_package"))
    (:file "all_image_points" :depends-on ("_package_all_image_points"))
    (:file "_package_all_image_points" :depends-on ("_package"))
    (:file "image_points" :depends-on ("_package_image_points"))
    (:file "_package_image_points" :depends-on ("_package"))
  ))