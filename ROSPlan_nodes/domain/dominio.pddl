(define (domain brilloprova)

(:requirements :strips :typing :durative-actions :fluents)

(:types 
    position
    juice flavor - ingredient
    robot blender hand freezer counter drink customer numero - object
    cup glass - container
)

(:predicates
    (order-contains-one ?fl - flavor ?n - numero)
    (order-contains-two ?fl - flavor ?n - numero)
    (added-juice-one ?fl - flavor ?n - numero)
    (added-juice-two ?fl - flavor ?n - numero)
    (trashed-cup ?fl - flavor ?n - numero)
    (blended ?fl - flavor ?n - numero)
    (picked-glass ?fl - flavor ?n - numero)
    (filled-glass ?fl - flavor ?n - numero)
    (washed-blender ?fl - flavor ?n - numero)
    (customer-position ?p - position)
    (served ?n - numero)
    (picking ?fl - flavor ?n - numero)
    (picked-shaker ?fl - flavor ?n - numero)
    (added-liquore ?fl - flavor ?n - numero)
    (filled-vaschetta ?fl - flavor ?n - numero)
    (putted-in-position-cup ?fl - flavor ?n - numero)
    (returned-shaker ?fl - flavor ?n - numero)
    (filled-blend-one ?fl - flavor ?n - numero)
    (filled-blend-two ?fl - flavor ?n - numero)
    (picked-flavor-one ?fl - flavor ?n - numero)
    (picked-flavor-two ?fl - flavor ?n - numero)
    (order-contains-three ?fl - flavor ?n - numero)
    (picked-shaker-two ?fl - flavor ?n - numero)
    (picking-two ?fl - flavor ?n - numero)
    (picked-glass-two ?fl - flavor ?n - numero)
    (putted-under-ice-machine ?fl - flavor ?n - numero)
    (filled-with-ice ?fl - flavor ?n - numero)
    (added-liquore-two ?fl - flavor ?n - numero)
    (mixed ?fl - flavor ?n - numero)
    (filled-glass-two ?fl - flavor ?n - numero)
    (retrieved-shaker ?fl - flavor ?n - numero)
    (picked-up-decoration ?fl - flavor ?n - numero)
    (bringed-shaker ?fl - flavor ?n - numero)
    (washed ?fl - flavor ?n - numero)
    (order-end)
)


(:functions ;todo: define numeric functions here
    (pending)
)

(:durative-action pick-flavor-analcolic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (order-contains-one ?fl ?n))
        (at start (= (pending) 0))
        (at end (= (pending) 1))
    )
    :effect (and 
        (at start (increase (pending) 1))
        (at end (picked-flavor-one ?fl ?n))
    )
)

(:durative-action pick-flavor-alcolic-fresko
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (order-contains-two ?fl ?n))
        (at start (= (pending) 0))
        (at end (= (pending) 1))
    )
    :effect (and 
        (at start (increase (pending) 1))
        (at end (picked-flavor-two ?fl ?n))
        (at start (picking ?fl ?n))
    )
)

(:durative-action pick-up-shaker-alcolic-fresko
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picking ?fl ?n))
    )
    :effect (and 
        (at end (picked-shaker ?fl ?n))
    )
)

(:durative-action add-liquore
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picked-shaker ?fl ?n))
    )
    :effect (and 
        (at end (added-liquore ?fl ?n))
    )
)

(:durative-action add-juice-analcolic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picked-flavor-one ?fl ?n))
    )
    :effect (and 
        (at end (added-juice-one ?fl ?n))
    )
)

(:durative-action add-juice-alcolic-fresko
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picked-flavor-two ?fl ?n))
    )
    :effect (and 
        (at end (added-juice-two ?fl ?n))
    )
)

(:durative-action put-cup-in-position
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (added-juice-two ?fl ?n))
    )
    :effect (and 
        (at end (putted-in-position-cup ?fl ?n))
    )
)

(:durative-action fill-vaschetta
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (putted-in-position-cup ?fl ?n))
        (at start (added-liquore ?fl ?n))
    )
    :effect (and 
        (at end (filled-vaschetta ?fl ?n))
    )
)

(:durative-action fill-blend-analcolic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (added-juice-one ?fl ?n))
    )
    :effect (and 
        (at end (filled-blend-one ?fl ?n))
    )
)

(:durative-action fill-blend-alcolic-fresko
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-vaschetta ?fl ?n))
    )
    :effect (and 
        (at end (filled-blend-two ?fl ?n))
    )
)

(:durative-action return-shaker
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-vaschetta ?fl ?n))
    )
    :effect (and 
        (at start (returned-shaker ?fl ?n))
    )
)

(:durative-action trash-cup-analcolic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-blend-one ?fl ?n))
    )
    :effect (and 
        (at end (trashed-cup ?fl ?n))
    )
)

(:durative-action trash-cup-alcolic-fresko
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-blend-two ?fl ?n))
        (at start (returned-shaker ?fl ?n))
    )
    :effect (and 
        (at end (trashed-cup ?fl ?n))
    )
)

(:durative-action blend-analcolic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-blend-one ?fl ?n))
    )
    :effect (and 
        (at end (blended ?fl ?n))
    )
)

(:durative-action blend-alcolic-fresko
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-blend-two ?fl ?n))
    )
    :effect (and 
        (at end (blended ?fl ?n))
    )
)

(:durative-action pick-up-glass
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (blended ?fl ?n))
        (at start (trashed-cup ?fl ?n))
    )
    :effect (and 
        (at end (picked-glass ?fl ?n))
    )
)

(:durative-action fill-glass
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picked-glass ?fl ?n))
    )
    :effect (and 
        (at end (filled-glass ?fl ?n))
    )
)

(:durative-action wash-blender
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-glass ?fl ?n))
    )
    :effect (and 
        (at end (washed-blender ?fl ?n))
    )
)

(:durative-action serve
    :parameters (?p - position ?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (washed-blender ?fl ?n))
        (at start (customer-position ?p))
    )
    :effect (and 
        (at end (decrease (pending) 1))
        (at end (served ?n))
    )
)

;tipo 3

(:durative-action pick-up-shaker-alcolic-generic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (order-contains-three ?fl ?n))
        (at start (= (pending) 0))
        (at end (= (pending) 1))
    )
    :effect (and 
        (at start (increase (pending) 1))
        (at end (picked-shaker-two ?fl ?n))
        (at start (picking-two ?fl ?n))
    )
)

(:durative-action pick-up-glass-alcolic-generic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picking-two ?fl ?n))
    )
    :effect (and 
        (at end (picked-glass-two ?fl ?n))
    )
)

(:durative-action put-under-ice-machine
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picked-shaker-two ?fl ?n))
    )
    :effect (and 
        (at end (putted-under-ice-machine ?fl ?n))
    )
)

(:durative-action fill-with-ice
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (putted-under-ice-machine ?fl ?n))
    )
    :effect (and 
        (at end (filled-with-ice ?fl ?n))
    )
)

(:durative-action add-liquore-alcolic-generic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-with-ice ?fl ?n))
    )
    :effect (and 
        (at end (added-liquore-two ?fl ?n))
    )
)

(:durative-action mix-shaker
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (added-liquore-two ?fl ?n))
    )
    :effect (and 
        (at end (mixed ?fl ?n))
    )
)

(:durative-action fill-glass-alcolic-generic
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (mixed ?fl ?n))
        (at start (picked-glass-two ?fl ?n))
    )
    :effect (and 
        (at end (filled-glass-two ?fl ?n))
    )
)

(:durative-action retrieve-shaker
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (filled-glass-two ?fl ?n))
    )
    :effect (and 
        (at end (retrieved-shaker ?fl ?n))
    )
)

(:durative-action pick-up-decoration
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (retrieved-shaker ?fl ?n))
    )
    :effect (and 
        (at end (picked-up-decoration ?fl ?n))
    )
)

(:durative-action bring-shaker
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (retrieved-shaker ?fl ?n))
    )
    :effect (and 
        (at end (bringed-shaker ?fl ?n))
    )
)

(:durative-action wash
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (bringed-shaker ?fl ?n))
    )
    :effect (and 
        (at end (washed ?fl ?n))
    )
)

(:durative-action serve-alcolic-generic
    :parameters (?p - position ?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (washed ?fl ?n))
        (at start (picked-up-decoration ?fl ?n))
        (at start (customer-position ?p))
    )
    :effect (and 
        (at end (decrease (pending) 1))
        (at end (served ?n))
    )
)

(:durative-action finish
    :parameters ()
    :duration (= ?duration 1)
    :condition (and 
        (at start (forall (?n - numero) (served ?n)))
    )
    :effect (and 
        (at end (order-end))
    )
)

)