%% -*-prolog-*-
/*
%% cast of characters

a
b
c
d
e
f
g
h
i
j
k
l
m
n
*/
olderThan(X,Y) :- parentOf(X,Y).
olderThan(X,Y) :- parentOf(X,Z), olderThan(Z,Y).

female(e).
female(g).
female(c).
female(k).
female(m).

male(h).
male(d).
male(a).
male(f).
male(b).
male(j).
male(n).

parentOf(d, h).
parentOf(e, d).
parentOf(a, d).
parentOf(g, e).
parentOf(f, e).
parentOf(c, a).
parentOf(b, a).
parentOf(k, i).
parentOf(j, i).
parentOf(j, l).
parentOf(l, m).
parentOf(l, n).

spouseOf(i, d).
