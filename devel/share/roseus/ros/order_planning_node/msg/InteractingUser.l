;; Auto-generated. Do not edit!


(when (boundp 'order_planning_node::InteractingUser)
  (if (not (find-package "ORDER_PLANNING_NODE"))
    (make-package "ORDER_PLANNING_NODE"))
  (shadow 'InteractingUser (find-package "ORDER_PLANNING_NODE")))
(unless (find-package "ORDER_PLANNING_NODE::INTERACTINGUSER")
  (make-package "ORDER_PLANNING_NODE::INTERACTINGUSER"))

(in-package "ROS")
;;//! \htmlinclude InteractingUser.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass order_planning_node::InteractingUser
  :super ros::object
  :slots (_name _id _position _status ))

(defmethod order_planning_node::InteractingUser
  (:init
   (&key
    ((:name __name) "")
    ((:id __id) "")
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:status __status) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _id (string __id))
   (setq _position __position)
   (setq _status (string __status))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _id
    4 (length _id)
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get order_planning_node::InteractingUser :md5sum-) "f48b5125444b92e93e9d05eedd634066")
(setf (get order_planning_node::InteractingUser :datatype-) "order_planning_node/InteractingUser")
(setf (get order_planning_node::InteractingUser :definition-)
      "string name
string id
geometry_msgs/Point position
string status

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :order_planning_node/InteractingUser "f48b5125444b92e93e9d05eedd634066")


