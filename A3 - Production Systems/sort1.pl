
% Objects and their associated heigths and widths

:- add(object(d)). 
:- add(object(c)). 
:- add(object(b)). 
:- add(object(a)). 
:- add(value(c, height, 2)). 
:- add(value(c, width, 3)). 
:- add(value(a, height, 4)). 
:- add(value(a, width, 1)). 
:- add(value(d, height, 1)). 
:- add(value(d, width, 4)). 
:- add(value(b, height, 3)). 
:- add(value(b, width, 2)). 

% Ordering relations between integers

:- add(less_than(1, 2)). 
:- add(less_than(1, 3)). 
:- add(less_than(1, 4)). 
:- add(less_than(2, 3)). 
:- add(less_than(2, 4)). 
:- add(less_than(3, 4)). 

% Criterion dimension for seriation

:- add(criterion(height)). 
