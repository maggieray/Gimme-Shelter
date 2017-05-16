/*  h(State, Goal, HValue)
    ================
    HValue is the estimated distance from State to the nearest
    Goal state

    this always returns an estimate of 0
*/
:- multifile h/3.
:- dynamic h/3.
:- retractall(h(_, _, _)).

h(_, _, 0).