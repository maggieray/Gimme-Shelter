:- multifile op/4.
:- dynamic op/4.
:- multifile cost/3.
:- dynamic cost/3.


cost(_, _, 1).

op(move,
   %% move B1 off of B2 and onto B3
   [B1, B2, B3],
   [cube(B1),
    cube(B2),
    cube(B3),
    neq(B1, B2), neq(B1, B3),
    neq(B2, B3), clear(B1), clear(B3),
    on(B1,B2)],
   [on(B1, B3), 
    not(on(B1,B2))]).


op(newStack,
   %% move B1 off of B2 and onto the table
   [B1, B2],
   [cube(B1), cube(B2),
    neq(B1, B2),
    clear(B1), 
    on(B1,B2)],
   [on(B1, table),  
    not(on(B1,B2))]).


op(destroyStack,
   %% move B1 off of the table and onto B3
   [B1, B3],
   [cube(B1), cube(B3),
    neq(B1, B3),
    clear(B1), clear(B3),
    on(B1,table)],
   [not(on(B1, table)), 
    on(B1,B3)]).
