per testare i file pddl:
bisogna far coincidere il numero di oggetti 'numero' con il numero degli order-contains

ES:

uno due tre quattro cinque - numero

    (order-contains-one kiwi uno)
    (order-contains-two berry due)
    (order-contains-three papaya tre)
    (order-contains-one papaya quattro)
    (order-contains-two berry cinque)
    (customer-position right)
    
    cinque oggetti numero per cinque ordini
