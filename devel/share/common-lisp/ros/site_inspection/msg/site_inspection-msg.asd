
(cl:in-package :asdf)

(defsystem "site_inspection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cmd_walk" :depends-on ("_package_cmd_walk"))
    (:file "_package_cmd_walk" :depends-on ("_package"))
    (:file "image_points" :depends-on ("_package_image_points"))
    (:file "_package_image_points" :depends-on ("_package"))
    (:file "robot_head_pos" :depends-on ("_package_robot_head_pos"))
    (:file "_package_robot_head_pos" :depends-on ("_package"))
  ))