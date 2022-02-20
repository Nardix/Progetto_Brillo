(define (domain brilloprova)

(:requirements :strips :typing :durative-actions :fluents)
(:types 
    position
    juice flavor - ingredient
    robot blender hand freezer counter drink customer numero - object
    cup glass - container
)

(:predicates
    (order-contains ?fl - flavor ?n - numero)
    (picked-glass ?fl - flavor ?n - numero)
    (picked-flavor ?fl - flavor ?n - numero)
    (added-juice ?fl - flavor ?n - numero)
    (trashed-cup ?fl - flavor ?n - numero)
    (blended ?fl - flavor ?n - numero)
    (filled-glass ?fl - flavor ?n - numero)
    (washed-blender ?fl - flavor ?n - numero)
    (served ?n - numero)
    (order-end)
    (customer-position ?p - position)
)

(:functions
    (pending)
    (number-of-orders)
)

(:durative-action pick-up-glass
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (order-contains ?fl ?n))
        (at start (= (pending) 0))
    )
    :effect (and 
        (at start (increase (pending) 1))
        (at end (picked-glass ?fl ?n))
    )
)

(:durative-action pick-flavor
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picked-glass ?fl ?n))
    )
    :effect (and 
        (at end (picked-flavor ?fl ?n))
    )
)

(:durative-action add-juice
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (picked-flavor ?fl ?n))
    )
    :effect (and 
        (at end (added-juice ?fl ?n))
    )
)

(:durative-action trash-cup
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (added-juice ?fl ?n))
    )
    :effect (and 
        (at end (trashed-cup ?fl ?n))
    )
)

(:durative-action blend
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (added-juice ?fl ?n))
    )
    :effect (and 
        (at end (blended ?fl ?n))
    )
)

(:durative-action fill-glass
    :parameters (?fl - flavor ?n - numero)
    :duration (= ?duration 1)
    :condition (and 
        (at start (blended ?fl ?n))
        (at start (trashed-cup ?fl ?n))
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