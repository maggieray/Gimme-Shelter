%	$Id: solve.pl,v 1.4 2008/10/17 09:07:03 mbar098 Exp $	

/*
solve(Domain, Heuristic, Problem, Path)
*/

:- multifile derived/1.
:- dynamic derived/1.
:- multifile metaLevel/1.
:- dynamic metaLevel/1.

solve(Domain, Problem, Path) :-
	compile([idaStar, aux1, operator, problem, progressionPlanning, step]),
	loadDomain(Domain, DomainPath),
	loadHeuristic(DomainPath, zero),
	loadProblem(DomainPath, Problem),
	problem(InitialState, _),
	idaStarSearch(InitialState, ReversePath),
	reverse(ReversePath, Path).


%%  loadHeuristic(+DomainPath, +Heuristic)
loadHeuristic(DomainPath, Heuristic) :-
	retractall(h(_,_,_)),
	atom_concat(DomainPath, '/heuristics.d/', HeuristicsPath),
	atom_concat(HeuristicsPath, Heuristic, Temp),
	atom_concat(Temp, '.pl', HPath),
	compile(HPath).

loadProblem(DomainPath, Problem) :-
	retractall(problem(_, _)),
	atom_concat(DomainPath, '/problems.d/', ProblemPath),
	atom_concat(ProblemPath, Problem, Temp),
	atom_concat(Temp, '.pl', PPath),
	compile(PPath).


%%  loadDomain(+Domain, -DomPath)
loadDomain(Domain, DomPath) :-
	retractall(op(_,_,_,_)),
	retractall(cost(_, _, _)),
	atom_concat('domains.d/', Domain, DomPath),
	atom_concat(DomPath, '/ops.pl', OpsPath),
	compile(OpsPath),
	removeOntology,
	atom_concat(DomPath, '/ontology.pl', OntologyPath),
	compile(OntologyPath),
	atom_concat(DomPath, '/showRelations.pl', PortrayPath),
	compile(PortrayPath).

removeOntology :-
	retractall(static/1),
	retractall(fluent/1),
	findall(Pred/Arity, derived(Pred/Arity), DerivedPreds),
	removePreds(DerivedPreds),
	retractall(derived/1),
	retractall(primitive/1),
	findall(Pred/Arity, metaLevel(Pred/Arity), MetaLevelPreds),
	removePreds(MetaLevelPreds),
	retractall(metaLevel/1),
	retractall(objectLevel/1).

removePreds([]).
removePreds([Pred/Arity | Rest]) :-
	functor(Functor, Pred, Arity),
	retractall(Functor),
	removePreds(Rest).

