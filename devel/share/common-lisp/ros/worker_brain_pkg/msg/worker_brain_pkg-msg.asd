
(cl:in-package :asdf)

(defsystem "worker_brain_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "calculate_position_result" :depends-on ("_package_calculate_position_result"))
    (:file "_package_calculate_position_result" :depends-on ("_package"))
    (:file "cmd_walk" :depends-on ("_package_cmd_walk"))
    (:file "_package_cmd_walk" :depends-on ("_package"))
    (:file "head_contol_by_brain" :depends-on ("_package_head_contol_by_brain"))
    (:file "_package_head_contol_by_brain" :depends-on ("_package"))
    (:file "image_points" :depends-on ("_package_image_points"))
    (:file "_package_image_points" :depends-on ("_package"))
    (:file "robot_head_pos" :depends-on ("_package_robot_head_pos"))
    (:file "_package_robot_head_pos" :depends-on ("_package"))
  ))