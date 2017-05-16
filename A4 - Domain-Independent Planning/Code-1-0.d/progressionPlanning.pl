%	$Id: progressionPlanning.pl,v 1.4 2008/10/16 19:33:11 mbar098 Exp $	
:- use_module(library(ordsets)).
/*

neighbors(State, Neighbors) and isGoal(State) are defined here.
=================================================================


*/
%%  neighbors(State, Neighbors)
%%  ---------------------------
neighbors(State, Neighbors) :-
	setof(Neighbor, Neighbor ^ isNeighbor(State, Neighbor), Neighbors).

isNeighbor(State, Neighbor) :-
	applicable(OpName, Bindings, State),
	apply(OpName, Bindings, State, Neighbor).

applicable(OpName, Bindings, State) :-
	problem(I, _),
	op(OpName, Bindings, Preconds, _),
	satisfiedBy(Preconds, State, I).

apply(OpName, Bindings, State, Neighbor) :-
	stateFluents(State, StateFluents),
	list_to_ord_set(StateFluents, StateOrdSet),
	opDeletes(OpName, Bindings, DeleteList),
	list_to_ord_set(DeleteList, DeleteListOrdSet),
	ord_subtract(StateOrdSet, DeleteListOrdSet, DifferenceOrdSet),
	opAdds(OpName, Bindings, AddList),
	list_to_ord_set(AddList, AddListOrdSet),
	ord_union(AddListOrdSet, DifferenceOrdSet, Neighbor).

stateFluents([ ], [ ]).
stateFluents([X | Rest], [X | Statics]) :-
	functor(X, Pred, Arity),
	fluent(Pred/Arity),
	stateFluents(Rest, Statics).
stateFluents([X | Rest], Statics) :-
	functor(X, Pred, Arity),
	static(Pred/Arity),
	stateFluents(Rest, Statics).


%% isGoal(?State)
%% ------------
isGoal(State) :-
	problem(I, G),
	satisfiedBy(G, State, I).

%% satisfiedBy(Goals, State, InitialState)
%%-------------------------------------------
satisfiedBy([ ], _, _).  % all states satisfy the empty goal

/*
goals can be:
- negative     *          *          *    (take "not" off & check positive)
- positive     *      meta-level     *    (execute its code)
- positive primitive object-level fluents (look in State for presence) 
- positive primitive object-level statics (look in InitialState for presence)
- positive  derived  object-level    *    (take body of defn and see
                                           if it is satisfiedBy State
                                           and/or InitialState)
*/
satisfiedBy([not(G) | Rest], State, StaticValues) :-
	once((not(satisfiedBy([G], State, StaticValues)),
	     satisfiedBy(Rest, State, StaticValues))).

satisfiedBy([G | Rest], State, StaticValues) :-
	functor(G, Pred, Arity),
	metaLevel(Pred/Arity),
	G,
	satisfiedBy(Rest, State, StaticValues).

satisfiedBy([G | Rest], State, StaticValues) :-
	functor(G, Pred, Arity),
	objectLevel(Pred/Arity),
	fluent(Pred/Arity),
	primitive(Pred/Arity),
	member(G, State),
	satisfiedBy(Rest, State, StaticValues).

satisfiedBy([G | Rest], State, StaticValues) :-
	functor(G, Pred, Arity),
	objectLevel(Pred/Arity),
	static(Pred/Arity),
	primitive(Pred/Arity),
	member(G, StaticValues),
	satisfiedBy(Rest, State, StaticValues).

satisfiedBy([G | Rest], State, StaticValues) :-
	functor(G, Pred, Arity),
	objectLevel(Pred/Arity),
	derived(Pred/Arity),
	clause(G, Body),
	bodyToList(Body, List),
	satisfiedBy(List, State, StaticValues),
	satisfiedBy(Rest, State, StaticValues).

/*
bodyToList(+Body, -List) === turn Body into List
    Body is a sequence of terms, e.g., (a, b, c(x,y) )
    List is a list of terms, e.g., [a, b, c(x, y) ]
    this predicate is true iff the sequence of terms is exactly the
    same as the list of terms
*/

bodyToList(true, [ ]).
bodyToList(','(E, Rest), [E | RestList]) :- bodyToList(Rest, RestList).
bodyToList((E) , List) :-
	not(E = ','(_,_)),
	List = [E].



