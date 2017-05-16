%	$Id: operator.pl,v 1.1 2008/10/14 22:32:35 mbar098 Exp $	

/* operator data structures
   ============================

  main op data structure
  ----------------------
   op(Name, Bindings, Preconditions, Effects)

*/

operator(op(Name, Bindings, Preconditions, Effects), Name, Bindings, Preconditions, Effects).

opPreconditions(Name, Bindings, Preconditions) :-
	op(Name, Bindings, Preconditions, _).

opEffects(Name, Bindings, Effects) :-
	op(Name, Bindings, _, Effects).


opDeletes(Name, Bindings, DeleteList) :-
	opEffects(Name, Bindings, Effects),
	bagof(Condition, member(not(Condition), Effects), DeleteList).

opAdds(Name, Bindings, Adds) :-
	opEffects(Name, Bindings, Effects),
	bagof(Condition, (member(Condition, Effects), not(Condition = not(_))), Adds).
