:- dynamic portray/1.

portray(on(A, B)) :-
	write(A), write(' on '), write(B).

portray(clear(A)) :-
	write('clear '), write(A).