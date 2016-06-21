
(cl:in-package :asdf)

(defsystem "camera-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Target" :depends-on ("_package_Target"))
    (:file "_package_Target" :depends-on ("_package"))
    (:file "BoundBox" :depends-on ("_package_BoundBox"))
    (:file "_package_BoundBox" :depends-on ("_package"))
  ))