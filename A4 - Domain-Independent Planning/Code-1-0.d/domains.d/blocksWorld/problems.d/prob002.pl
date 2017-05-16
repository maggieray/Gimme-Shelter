:- multifile problem/2.
:- dynamic problem/2.

problem([cube(b1), cube(b2), cube(c), on(c, table), on(b1,b2), on(b2, table)],
	[on(b2,b1)]).