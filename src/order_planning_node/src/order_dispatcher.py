#!/usr/bin/env python
import rospy
import socket
import re
from std_msgs.msg import String


def parseSteps(stepList):
    steps = re.sub("\d", "", stepList)
    steps = re.sub("\[\.\]", "", steps)
    steps = re.sub(": ", "", steps)
    steps = re.sub("\sh\s", " ", steps)
    steps = re.sub(" h\)", ")", steps)
    steps = re.sub(" vaschetta", "", steps)
    steps = re.sub("\(add-juice\s[a-z]+\)", "(add-juice)", steps)
    steps = re.sub("\(trash-cup\s[a-z]+\)", "(trash-cup)", steps)
    steps = re.sub("\(blend\s[a-z]+\)", "(blend)", steps)
    steps = re.sub("\(fill-glass\s[a-z]+\s[a-z]+\)", "(fill-glass)", steps)
    steps = re.sub(" uno| due| tre| quattro| cinque| sei| sette| otto| nove| dieci", "", steps)
    return steps

def plannerOutputCallback(data):
    global cameraPublisher
    steps = parseSteps(data.data)
    print( "sending steps to robot...\n" + steps)
    #sock = socket.socket()
    #sock.connect(('172.31.1.147', 30000))
    #rospy.loginfo("off")
    #cameraPublisher.publish("off")
    #sock.send(steps)
    #response = sock.recv(4096)
    #rospy.loginfo("on")
    #cameraPublisher.publish("on")
    #sock.close()

def listener():
    global cameraPublisher
    rospy.init_node('order_dispatcher', anonymous=False)
    rospy.wait_for_service('/order_planner_interface/planning_server')
    rospy.Subscriber("/order_planner_interface/planner_output", String, plannerOutputCallback)
    cameraPublisher = rospy.Publisher('/camera', String, queue_size=1)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    cameraPublisher = 0
    listener()
