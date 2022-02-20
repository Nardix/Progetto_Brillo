#!/usr/bin/env python
import rospy
import socket
import re
from py2neo import Graph
from py2neo import cypher
from order_planning_node.msg import InteractingUser
from std_srvs.srv import Empty
from std_msgs.msg import String

def getDrinkNumber(drinkNumber):
    numberLiterals = {
        1 : "uno",
        2 : "due",
        3 : "tre",
        4 : "quattro",
        5 : "cinque",
        6 : "sei",
        7 : "sette",
        8 : "otto",
        9 : "nove",
        10 : "dieci"
    }
    return numberLiterals[drinkNumber]

def getDrinkAlias(drink):
    drinkAliases1 =	{
        "Jamm Ja Playa" : "jammja",
        "Coco Fruit" : "coco",
        "Red Passion" : "redpassion",
        "Blueberry Plus" : "blueberry",
        "Cherry Split" : "cherry",
        "Gimme Five" : "gimmefive",
        "Pomegrane" : "pomegrane",
        "Sun Ice" : "sunice"
    }

    drinkAliases2 = {  
        "Kiwi Cooler" : "kiwicool",
        "Green Power" : "green",
        "Strawberry Romance" : "strawromance",
        "Strawberry Sensation" : "strawsens",
        "Berry Fusion" : "berryfus",
        "Berry Breeze" : "berrybr",
        "Kiwi Kick" : "kiwikick",
        "Kiwi Peach" : "kiwipeach"
    }
        
    drinkAliases3 = {
        "Papaya Pleasure" : "papleasure",
        "Papaya Playa" : "paplaya",
        "Mango Chango" : "mangoch",
        "Mango Magic" : "mangomag", 
        "Pina Colada Passion" : "pinapassion", 
        "Pina Colada Paradise" : "pinaparadise",
        "Caribbean Kiss" : "carkiss",
        "Caribbean Sunset": "carsunset"
    }
    try:
        return drinkAliases1[drink]
    except:
        try:
            return drinkAliases2[drink]
        except:
            return drinkAliases3[drink]

def getDrinkType(drinkAlias):
    drinkType = {
        "jammja" : "-one",
        "coco" : "-one",
        "redpassion" : "-one",
        "blueberry" : "-one",
        "cherry" : "-one",
        "gimmefive" : "-one",
        "pomegrane" : "-one",
        "sunice" : "-one",
        "kiwicool" : "-two",
        "green" : "-two",
        "strawromance" : "-two",
        "strawsens" : "-two",
        "berryfus" : "-two",
        "berrybr" : "-two",
        "kiwikick" : "-two",
        "kiwipeach" : "-two",
        "papleasure" : "-three",
        "paplaya" : "-three",
        "mangoch" : "-three",
        "mangomag" : "-three", 
        "pinapassion" : "-three", 
        "pinaparadise" : "-three",
        "carkiss" : "-three",
        "carsunset" : "-three"
    }
    return drinkType[drinkAlias]


def createProblem(drinks, position):
    firsthalf = """
    (define (problem task)
    (:domain brilloprova)
    (:objects
    left right - position
    """ 
    
    objects = """ - flavor
    """

    numbers = """ - numero
    )
    (:init
    """
    
    predicates = """
    (customer-position """ + position + """)
    )
    (:goal (and
        (order-end)
    ))
    )
    """

    drinkCounter = 1
    for drink in drinks:
        drinkAlias = getDrinkAlias(drink)
        predicates = "    (order-contains" + getDrinkType(drinkAlias) + " " + drinkAlias + " " + getDrinkNumber(drinkCounter) + ")\n" + predicates
        objects = drinkAlias + " " + objects
        numbers = getDrinkNumber(drinkCounter) + " " + numbers
        drinkCounter = drinkCounter + 1
    return firsthalf + objects + numbers + predicates

def getOrderOfUser(userid):
    graph = Graph("bolt://143.225.85.134", password="BRILLO2020")
    query = """
    MATCH (us: USER)-[:PURCHASED]->(od:ORDER)-[:ORDERS]->(dr:DRINK)
    WHERE (od.paid = TRUE AND od.served = false AND us.userID = """ + userid + """) RETURN collect(dr.aliases), od.orderID
    """
    result = graph.run(query).data()
    if result:
    	order = result[0]
        idOrdine = order["od.orderID"]
        update = """MATCH (od:ORDER {orderID: """+ str(idOrdine) + """})
    	SET od.served = true
    	"""
        graph.run(update)
        return order["collect(dr.aliases)"]
    else:
        return None

def interactingUserCallback(data):
    global problemPublisher, plannerInterfaceService
    order = getOrderOfUser(data.id)
    if data.status == "serving" and order is not None:
        if data.position.x > 0: 
            pos = "right"
        else:
            pos = "left"
        problem = createProblem(order, pos)
        rospy.loginfo(problem)
        problemPublisher.publish(problem)
        plannerResponse = plannerInterfaceService()
    else:
        print("There are no orders for user " + data.name)
    	
    
def listener():
    global problemPublisher, plannerInterfaceService
    rospy.init_node('order_planner', anonymous=False)
    rospy.wait_for_service('/order_planner_interface/planning_server')
    plannerInterfaceService = rospy.ServiceProxy('/order_planner_interface/planning_server', Empty)
    problemPublisher = rospy.Publisher('/order_problem_interface/order_problem_instance', String, queue_size=20)
    rospy.Subscriber("interacting_user", InteractingUser, interactingUserCallback)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    problemPublisher = 0
    listener()
