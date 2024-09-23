
(cl:in-package :asdf)

(defsystem "calculate_position_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "calculate_position_result" :depends-on ("_package_calculate_position_result"))
    (:file "_package_calculate_position_result" :depends-on ("_package"))
    (:file "image_points" :depends-on ("_package_image_points"))
    (:file "_package_image_points" :depends-on ("_package"))
  ))