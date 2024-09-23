
(cl:in-package :asdf)

(defsystem "localization_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CompassHeading" :depends-on ("_package_CompassHeading"))
    (:file "_package_CompassHeading" :depends-on ("_package"))
    (:file "Detections" :depends-on ("_package_Detections"))
    (:file "_package_Detections" :depends-on ("_package"))
    (:file "LineDetection" :depends-on ("_package_LineDetection"))
    (:file "_package_LineDetection" :depends-on ("_package"))
    (:file "ObjectDetection" :depends-on ("_package_ObjectDetection"))
    (:file "_package_ObjectDetection" :depends-on ("_package"))
    (:file "ObstacleDetection" :depends-on ("_package_ObstacleDetection"))
    (:file "_package_ObstacleDetection" :depends-on ("_package"))
    (:file "Particle" :depends-on ("_package_Particle"))
    (:file "_package_Particle" :depends-on ("_package"))
    (:file "ParticleSet" :depends-on ("_package_ParticleSet"))
    (:file "_package_ParticleSet" :depends-on ("_package"))
  ))