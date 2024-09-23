
(cl:in-package :asdf)

(defsystem "config_server-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :config_server-msg
)
  :components ((:file "_package")
    (:file "GetParameter" :depends-on ("_package_GetParameter"))
    (:file "_package_GetParameter" :depends-on ("_package"))
    (:file "Load" :depends-on ("_package_Load"))
    (:file "_package_Load" :depends-on ("_package"))
    (:file "Save" :depends-on ("_package_Save"))
    (:file "_package_Save" :depends-on ("_package"))
    (:file "SetParameter" :depends-on ("_package_SetParameter"))
    (:file "_package_SetParameter" :depends-on ("_package"))
    (:file "Subscribe" :depends-on ("_package_Subscribe"))
    (:file "_package_Subscribe" :depends-on ("_package"))
    (:file "SubscribeList" :depends-on ("_package_SubscribeList"))
    (:file "_package_SubscribeList" :depends-on ("_package"))
  ))