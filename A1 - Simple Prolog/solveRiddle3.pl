solveRiddle3(A, B) :- parentOf(C, A), not(olderThan(B, C)), male(C), male(B).
