% Computational Intelligence: a logical approach. 
% Prolog Code.
% Iterative deepening A* search, based on the generic search algorithm.
% Copyright (c) 1998, Poole, Mackworth, Goebel and Oxford University Press.

/* Need the following to be defined:
=====================================
Domain definitions:
---------------------
- neighbors(State, Neighbors)
- cost(State, Neighbor, ArcCost)

Problem definition:
--------------------
isGoal(State)

Search definition:
-------------------
h(State, Goal, HeuristicValue)


*/


initialNextFBound(10000).

% iterative deepening A* search: idaStarSearch(State,Path)
% ----------------------------------------------------------
% idaStarSearch(State,Path) is true if path Path is a path found from 
% state State using idaStarSearch [i.e., iterative deepening A* search ]
idaStarSearch(State,Path) :-
	problem(_, Goal),
	h(State, Goal, HeuristicValue),
	FBound = HeuristicValue,
	writeln(['Trying f-bound: ', FBound]),
	initialNextFBound(NextFBound),
	fbsearch([node(State,[ ],0)],FBound,[node(State,[ ],0)],NextFBound,Path).


% f-bounded (fb) search: fbsearch(Frontier,FBound,Q,How,Path)
% -----------------------------------------------------------
% fbsearch(Frontier,FBound,Q,How,Path) is true 
% if an f-bounded search from frontier Frontier
% can find a path Path of cost =< FBound,
% where Q is the initial frontier [grown from the root]
% to (re)start from,
% How specifies whether the previous bound failed naturally 
% or gives the minimum f-value for which the search failed.

% The frontier is a list of  node(State, Path, PathCost)
%   where State is a node, Path is the path found to State, 
%   PathCost is the cost of the path.

%fbsearch(Frontier,_,_,_,_) :-
%   writeln(['Frontier: ',Frontier]),
%   fail.
fbsearch([node(State,Path,FBound)|_],FBound,_,_,[State|Path]) :-
	% we found a solution
	isGoal(State).
fbsearch([node(State,Path,PathCost)|OldFrontier],FBound,Q,NextFBound,Solution) :-
	problem(_, Goal),
	h(State, Goal, HeuristicValue),
	FValue is HeuristicValue + PathCost,
	FBound >= FValue,
	% f-Bound >= fValue
	% we pop this node off of frontier
	% we expand this node and push its children onto frontier
	neighbors(State,Neighbors),
	%% filter out paths with loops
%%%	removeLoops(Neighbors, Path, NonLoopingNeighbors),
	add_paths_fb(Neighbors,State,[State|Path], PathCost,
		     OldFrontier,NewFrontier),
	fbsearch(NewFrontier,FBound,Q,NextFBound,Solution).
fbsearch([node(State,_,PathCost)|Frontier],FBound,Q,NextFBound,Solution) :-
	problem(_, Goal),
	h(State, Goal, HeuristicValue),
	FValue is HeuristicValue + PathCost,
	FValue > FBound,
	% fValue > f-Bound
	% we pop this node off of frontier
	% don't expand this node
	% see if its fValue will be the next f-Bound
	LeastUpperBound is min(FValue, NextFBound),
	fbsearch(Frontier,FBound,Q,LeastUpperBound,Solution).
fbsearch([ ],_,Q,NextFBound,Solution) :-
	% finished searching at this f-Bound
	% and we actually expanded some nodes
	% start searching at the next f-Bound
	initialNextFBound(InitialNextFBound),
	InitialNextFBound > NextFBound,
	writeln(['Trying Depth bound: ',NextFBound]),
	fbsearch(Q,NextFBound,Q, InitialNextFBound,Solution).

%   add_paths(Neighbors,State,Path,OldPathCost,OldFrontier,NewFrontier)
%   -------------------------------------------------------------------
/* Neighbors are the states neighboring State, we turn each*/
/*neighboring state into a node, and push them onto the frontier.*/
/*Nodes contain the state, the path from the root to that state, and*/
/*the cost of that path.*/
add_paths_fb([ ],_,_,_,Frontier,Frontier).
add_paths_fb([Neighbor|Rest],State,Path,OldPathCost,OldFrontier,
	     [node(Neighbor,Path,NewPathCost)|NewFrontier]) :-
	cost(State,Neighbor,ArcCost),
	NewPathCost is OldPathCost + ArcCost,
	add_paths_fb(Rest,State,Path,OldPathCost,OldFrontier,NewFrontier).

/*
%   removeLoops(+Neighbors, +Path, -NonLoopingNeighbors)
%   -------------------------------------------------
removeLoops(Neighbors, Path, NonLoopingNeighbors) :-

*/


% **************************************************
% writeln(L) is true if L is a list of items to
% be written on a line, followed by a newline.
writeln([]) :- nl.
writeln([H|T]) :- write(H), writeln(T).
