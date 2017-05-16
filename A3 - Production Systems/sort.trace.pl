bash-3.2$ swipl
Welcome to SWI-Prolog (Multi-threaded, 64 bits, Version 6.6.6)
Copyright (c) 1990-2013 University of Amsterdam, VU Amsterdam
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software,
and you are welcome to redistribute it under certain conditions.
Please visit http://www.swi-prolog.org for details.

For help, use ?- help(Topic). or ?- apropos(Word).

?- [props].
% props compiled 0.00 sec, 86 clauses
true.

?- [seriate].
% seriate compiled 0.00 sec, 15 clauses
true.

?- [sort2].
% sort2 compiled 0.00 sec, 20 clauses
true.

?- run_trace(brief). 
true.

?- wm_trace.
true.

?- show_wm.
--------
Working Memory:
[time 18]	* criterion(width)
[time 17]	* less_than(3,4)
[time 16]	* less_than(2,4)
[time 15]	* less_than(2,3)
[time 14]	* less_than(1,4)
[time 13]	* less_than(1,3)
[time 12]	* less_than(1,2)
[time 11]	* value(b,width,2)
[time 10]	* value(b,height,3)
[time 9]	* value(d,width,4)
[time 8]	* value(d,height,1)
[time 7]	* value(a,width,1)
[time 6]	* value(a,height,4)
[time 5]	* value(c,width,3)
[time 4]	* value(c,height,2)
[time 3]	* object(c)
[time 2]	* object(b)
[time 1]	* object(d)
[time 0]	* object(a)
true.

?- run.
========
Cycle 1 / initiate_smaller
========
Cycle 2 / update_smaller
========
Cycle 3 / update_smaller
========
Cycle 4 / end_smaller
========
Cycle 5 / initiate_sort
========
Cycle 6 / initiate_smaller
========
Cycle 7 / update_smaller
========
Cycle 8 / end_smaller
========
Cycle 9 / extend_sort
========
Cycle 10 / initiate_smaller
========
Cycle 11 / end_smaller
========
Cycle 12 / extend_sort
========
Cycle 13 / initiate_smaller
========
Cycle 14 / end_smaller
========
Cycle 15 / extend_sort
========
Cycle 16 / end_sort
Finished sorting on width.
========
true.

?- show_wm.
--------
Working Memory:
[time 48]	* sorted(d)
[time 47]	* latest(d)
[time 46]	* left_of(d,c)
[time 45]	* criterion(width)
[time 41]	* sorted(c)
[time 39]	* left_of(c,b)
[time 34]	* sorted(b)
[time 32]	* left_of(b,a)
[time 26]	* sorted(a)
[time 17]	* less_than(3,4)
[time 16]	* less_than(2,4)
[time 15]	* less_than(2,3)
[time 14]	* less_than(1,4)
[time 13]	* less_than(1,3)
[time 12]	* less_than(1,2)
[time 11]	* value(b,width,2)
[time 10]	* value(b,height,3)
[time 9]	* value(d,width,4)
[time 8]	* value(d,height,1)
[time 7]	* value(a,width,1)
[time 6]	* value(a,height,4)
[time 5]	* value(c,width,3)
[time 4]	* value(c,height,2)
[time 3]	* object(c)
[time 2]	* object(b)
[time 1]	* object(d)
[time 0]	* object(a)
true. 
