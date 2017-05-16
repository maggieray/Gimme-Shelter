solveRiddle1(A, B) :- parentOf(B, C), parentOf(A, D), parentOf(C, D), male(A), male(B), male(C), male(D).
