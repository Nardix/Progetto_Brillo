; Auto-generated. Do not edit!


(cl:in-package order_planning_node-msg)


;//! \htmlinclude InteractingUser.msg.html

(cl:defclass <InteractingUser> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass InteractingUser (<InteractingUser>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InteractingUser>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InteractingUser)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name order_planning_node-msg:<InteractingUser> is deprecated: use order_planning_node-msg:InteractingUser instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <InteractingUser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader order_planning_node-msg:name-val is deprecated.  Use order_planning_node-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <InteractingUser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader order_planning_node-msg:id-val is deprecated.  Use order_planning_node-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <InteractingUser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader order_planning_node-msg:position-val is deprecated.  Use order_planning_node-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <InteractingUser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader order_planning_node-msg:status-val is deprecated.  Use order_planning_node-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InteractingUser>) ostream)
  "Serializes a message object of type '<InteractingUser>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InteractingUser>) istream)
  "Deserializes a message object of type '<InteractingUser>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InteractingUser>)))
  "Returns string type for a message object of type '<InteractingUser>"
  "order_planning_node/InteractingUser")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InteractingUser)))
  "Returns string type for a message object of type 'InteractingUser"
  "order_planning_node/InteractingUser")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InteractingUser>)))
  "Returns md5sum for a message object of type '<InteractingUser>"
  "f48b5125444b92e93e9d05eedd634066")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InteractingUser)))
  "Returns md5sum for a message object of type 'InteractingUser"
  "f48b5125444b92e93e9d05eedd634066")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InteractingUser>)))
  "Returns full string definition for message of type '<InteractingUser>"
  (cl:format cl:nil "string name~%string id~%geometry_msgs/Point position~%string status~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InteractingUser)))
  "Returns full string definition for message of type 'InteractingUser"
  (cl:format cl:nil "string name~%string id~%geometry_msgs/Point position~%string status~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InteractingUser>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InteractingUser>))
  "Converts a ROS message object to a list"
  (cl:list 'InteractingUser
    (cl:cons ':name (name msg))
    (cl:cons ':id (id msg))
    (cl:cons ':position (position msg))
    (cl:cons ':status (status msg))
))
