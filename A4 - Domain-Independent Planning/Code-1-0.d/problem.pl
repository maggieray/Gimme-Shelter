%	$Id: problem.pl,v 1.1 2008/10/14 22:32:58 mbar098 Exp $	


problem(Init, Goal, problem(Init, Goal)).

goal(problem(_, Goal), Goal).

initState(problem(Init, _), Init).