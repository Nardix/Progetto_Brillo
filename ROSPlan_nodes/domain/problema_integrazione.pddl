(define (problem task)
(:domain brilloprova)
(:objects
    left right - position
    papaya berry kiwi - flavor
    uno due tre - numero
)
(:init
    (order-contains-one kiwi uno)
    (order-contains-two berry due)
    (order-contains-three papaya tre)
    ;(order-contains-one papaya quattro)
    ;(order-contains-two berry cinque)
    (customer-position right)
)
(:goal (and
    (order-end)
))
)
