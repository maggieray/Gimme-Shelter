%mray324 Compsci 367 A2

neigbors_index0([1,3]).
neigbors_index1([0,2,4]).
neigbors_index2([1,5]).
neigbors_index3([0,4,6]).
neigbors_index4([1,3,5,7]).
neigbors_index5([2,4,8]).
neigbors_index6([3,7]).
neigbors_index7([4,6,8]).
neigbors_index8([5,7]).

neighbors([a,b,c,d,e,f,g,h,i]) :-
	(nth0(0,[a,b,c,d,e,f,g,h,i],0) -> Neighbors is [[b,a,c,d,e,f,g,h,i],[d,b,c,a,e,f,g,h,i]] ;
	nth0(1,[a,b,c,d,e,f,g,h,i],0) -> Neighbors is [[b,a,c,d,e,f,g,h,i],[a,c,b,d,e,f,g,h,i],[a,e,c,d,b,f,g,h,i]] ;
	nth0(2,[a,b,c,d,e,f,g,h,i],0) -> Neighbors is [[a,c,b,d,e,f,g,h,i],[a,b,f,d,e,c,g,h,i]] ;
	nth0(3,[a,b,c,d,e,f,g,h,i],0) -> Neighbors is [[d,b,c,a,e,f,g,h,i],[a,b,c,e,d,f,g,h,i],[a,b,c,g,e,f,d,h,i]] ;
	nth0(4,[a,b,c,d,e,f,g,h,i],0) -> Neighbors is [[a,e,c,d,b,f,g,h,i],[a,b,c,e,d,f,g,h,i],[a,b,c,d,f,e,g,h,i],[a,b,c,d,h,f,g,e,i]] ;
	nth0(5,[a,b,c,d,e,f,g,h,i],0) -> Neighbors is [[a,b,f,d,e,c,g,h,i],[a,b,c,d,f,e,g,h,i],[a,b,c,d,e,i,g,h,f]] ;
	nth0(6,[a,b,c,d,e,f,g,h,i],0) -> Neighbors is [[a,b,c,g,e,f,d,h,i],[a,b,c,d,e,f,h,g,i]] ;
	nth0(7,[a,b,c,d,e,f,g,h,i],0) -> Neighbors is [[a,b,c,d,h,f,g,e,i],[a,b,c,d,e,f,h,g,i],[a,b,c,d,e,f,g,i,h]] ;
	Neighbors is [[a,b,c,d,i,f,g,h,e],[a,b,c,d,e,f,g,i,h]]).

h(+List, -HeuristicValue) :- (is_goal(List) -> HeuristicValue is HeuristicValue+0 ;
	listsplit(List, A, B), HeuristicValue is HeuristicValue+(calc(List, A, B))
	).

calc(+List, +Head, +Tail, -HeuristicValue) :-	(length(Tail, 1) -> HeuristicValue is HeuristicValue+(abs((nth1(IndexGoal, is_goal(State), Head)//3)-(nth1(IndexCurr, List, Head)//3))+abs((nth1(IndexGoal, is_goal(State), Head) mod 3)-(nth1(IndexCurr, List, Head) mod 3))) ;
	HeuristicValue is HeuristicValue+(abs((nth1(IndexGoal, is_goal(State), Head)//3)-(nth1(IndexCurr, List, Head)//3))+abs((nth1(IndexGoal, is_goal(State), Head) mod 3)-(nth1(IndexCurr, List, Head) mod 3)) : listsplit(Tail, A, B), calc(List, A, B))
	).
