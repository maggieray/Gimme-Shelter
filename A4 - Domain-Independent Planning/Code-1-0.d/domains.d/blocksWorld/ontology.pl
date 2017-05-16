%% static predicates info
:- dynamic static/1.
static(cube/1).

%% fluent predicates info
:- dynamic fluent/1.
fluent(Pred/Arity) :- not(static(Pred/Arity)).

%% derived predicates info
:- dynamic derived/1.
:- dynamic clear/1.
derived(clear/1).
%%%% the table is always clear
clear(table).
%%%% cubes are clear if nothing is on top of them
clear(Cube) :-
	cube(Cube), not(on(_, Cube)).

%% primitive predicates info
:- dynamic primitive/1.
primitive(Pred/Arity) :- not(derived(Pred/Arity)).

%% metaLevel predicates info
:- dynamic metaLevel/1.
:- dynamic neq/2.
metaLevel(neq/2).
%%%% A neq B only A and B cannot be unified
neq(A, B) :- A \== B.

%% objectLevel predicates info
:- dynamic objectLevel/1.
objectLevel(Pred/Arity) :- not(metaLevel(Pred/Arity)).
