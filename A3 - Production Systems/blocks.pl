
% Four operators for the blocks domain

:- add_rule(
pick_up
  if task(pick_up(X)) and
     block(X) and table(Y) and on(X, Y) and
     hand(Z) and not(holding(Z, _))
  then remove(task(pick_up(X))) and
       remove(on(X, Y)) and add(holding(Z, X))).

:- add_rule(
unstack
  if task(unstack(X, Y)) and
     block(X) and block(Y) and hand(Z) and
     on(X, Y) and not(on(_, X)) and not(holding(Z, _))
  then remove(task(unstack(X, Y))) and
       remove(on(X, Y)) and add(holding(Z, X))).

:- add_rule(
put_down
  if task(put_down(X)) and
     block(X) and table(Y) and hand(Z) and
     holding(Z, X)
  then remove(task(put_down(X))) and
       remove(holding(Z, X)) and add(on(X, Y))).

:- add_rule(
stack
  if task(stack(X, Y)) and
     block(X) and block(Y) and hand(Z) and
     holding(Z, X) and not(on(_, Y))
  then remove(task(stack(X, Y))) and
       remove(holding(Z, X)) and add(on(X, Y))).
