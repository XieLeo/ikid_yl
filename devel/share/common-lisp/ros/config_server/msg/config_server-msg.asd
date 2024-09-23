
(cl:in-package :asdf)

(defsystem "config_server-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ParameterDescription" :depends-on ("_package_ParameterDescription"))
    (:file "_package_ParameterDescription" :depends-on ("_package"))
    (:file "ParameterList" :depends-on ("_package_ParameterList"))
    (:file "_package_ParameterList" :depends-on ("_package"))
  ))