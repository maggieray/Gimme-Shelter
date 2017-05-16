:- multifile problem/2.
:- dynamic problem/2.

problem([cube(a), cube(b2), cube(c), on(c, table), on(a,b2), on(b2, table)],
	[on(b2,table)]).