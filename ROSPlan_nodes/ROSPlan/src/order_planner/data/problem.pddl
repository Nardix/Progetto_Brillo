(define (problem task)
(:domain brilloprova)
(:objects
    left right center - position
    papaya berry kiwi - flavor
    h - hand
    uno due tre quattro cinque - numero
    vaschetta - cup
)
(:init
    (order-contains kiwi uno)
    (order-contains berry due)
    (order-contains papaya tre)
    (order-contains papaya quattro)
    (order-contains berry cinque)










    (customer-position right)



)
(:goal (and
    (order-end)
))
)
