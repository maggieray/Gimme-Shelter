:- multifile problem/2.
:- dynamic problem/2.


problem([width(4), height(4),
	hoodAt(carA, 13), trunkAt(carA, 09),
	hoodAt(carB, 04), trunkAt(carB, 05)],
		[hoodAt(carA, 01)]).


/*
Initial State:

00 01 02 03
BH BT 06 07
08 AT 10 11
12 AH 14 15

Goal State:

00 AH 02 03
04 AT BT BH
08 09 10 11
12 13 14 15
*/


/* Solution:
S = [[width(4), height(4), hoodAt(carA, 13), trunkAt(carA, 9), hoodAt(carB, 4), trunkAt(carB, 5)], [hoodAt(carA, 9), hoodAt(carB, 4), trunkAt(carA, 13), trunkAt(carB, 5)], [hoodAt(carA, 9), hoodAt(carB, 5), trunkAt(carA, 13), trunkAt(carB, 4)], [hoodAt(carA, 9), hoodAt(carB, 6), trunkAt(carA, 13), trunkAt(carB, 5)], [hoodAt(carA, 9), hoodAt(carB, 7), trunkAt(carA, 13), trunkAt(carB, 6)], [hoodAt(carA, 5), hoodAt(carB, 7), trunkAt(carA, 9), trunkAt(carB, 6)], [hoodAt(carA, 1), hoodAt(carB, 7), trunkAt(carA, 5), trunkAt(carB, 6)]]
*/