
(cl:in-package :asdf)

(defsystem "order_planning_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "InteractingUser" :depends-on ("_package_InteractingUser"))
    (:file "_package_InteractingUser" :depends-on ("_package"))
  ))