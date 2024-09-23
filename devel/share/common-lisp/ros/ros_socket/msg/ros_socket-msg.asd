
(cl:in-package :asdf)

(defsystem "ros_socket-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cmd_walk" :depends-on ("_package_cmd_walk"))
    (:file "_package_cmd_walk" :depends-on ("_package"))
    (:file "robot_head_pos" :depends-on ("_package_robot_head_pos"))
    (:file "_package_robot_head_pos" :depends-on ("_package"))
    (:file "robot_joint" :depends-on ("_package_robot_joint"))
    (:file "_package_robot_joint" :depends-on ("_package"))
  ))