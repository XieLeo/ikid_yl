
(cl:in-package :asdf)

(defsystem "ikid_key_ctrl-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cmd_walk" :depends-on ("_package_cmd_walk"))
    (:file "_package_cmd_walk" :depends-on ("_package"))
  ))