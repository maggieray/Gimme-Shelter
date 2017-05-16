%	$Id: aux1.pl,v 1.1 2008/10/14 22:32:15 mbar098 Exp $	

% -*-Prolog-*-  
:- use_module(library(lists)).

not(P) :- \+ P.

strictMember(X, [Y | _]) :-
	X == Y,
	!.
strictMember(X, [_ | Ys]) :-
	strictMember(X, Ys).

subsetOf([], _).
subsetOf([X | Rest], Ys) :-
	member(X, Ys),
	subsetOf(Rest, Ys).

strictSubsetOf([ ], _).
strictSubsetOf([X | Rest], Ys) :-
	strictMember(X, Ys),
	strictSubsetOf(Rest, Ys),
	!.