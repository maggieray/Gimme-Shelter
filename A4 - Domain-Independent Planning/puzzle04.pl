:- multifile problem/2.
:- dynamic problem/2.


problem([width(5), height(5),
	hoodAt(carA, 17), trunkAt(carA, 22),
	hoodAt(carB, 08), trunkAt(carB, 07),
	hoodAt(carC, 12), trunkAt(carC, 11)],
		[trunkAt(carA, 07)]).


/*
Initial State:

00 01 02 03 04
05 06 BT BH 09
10 CT CH 13 14
15 16 AH 18 19
20 21 AT 23 24

Goal State:

00 01 AH 03 04
05 06 AT BT BH
CH CT 12 13 14
15 16 17 18 19
20 21 22 23 24
*/


/* Solution:
S = [[width(5), height(5), hoodAt(carA, 17), trunkAt(carA, 22), hoodAt(carB, 8), trunkAt(carB, 7), hoodAt(carC, 12), trunkAt(carC, 11)], [hoodAt(carA, 17), hoodAt(carB, 8), hoodAt(carC, 11), trunkAt(carA, 22), trunkAt(carB, 7), trunkAt(carC, 12)], [hoodAt(carA, 17), hoodAt(carB, 8), hoodAt(carC, 10), trunkAt(carA, 22), trunkAt(carB, 7), trunkAt(carC, 11)], [hoodAt(carA, 12), hoodAt(carB, 8), hoodAt(carC, 10), trunkAt(carA, 17), trunkAt(carB, 7), trunkAt(carC, 11)], [hoodAt(carA, 12), hoodAt(carB, 9), hoodAt(carC, 10), trunkAt(carA, 17), trunkAt(carB, 8), trunkAt(carC, 11)], [hoodAt(carA, 7), hoodAt(carB, 9), hoodAt(carC, 10), trunkAt(carA, 12), trunkAt(carB, 8), trunkAt(carC, 11)], [hoodAt(carA, 2), hoodAt(carB, 9), hoodAt(carC, 10), trunkAt(carA, 7), trunkAt(carB, 8), trunkAt(carC, 11)]]
*/