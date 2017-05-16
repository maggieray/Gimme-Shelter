%%%%%%%%%%%%%%%
%
%  This is the skeletal ontology file, you need to add
%  the declarations of your predicates to this file
%  
%%%%%%%%%%%%%%%


%% static predicates info
:- dynamic static/1.
%
%  declare static predicates here
%


%% fluent predicates info 
:- dynamic fluent/1.
% fluents are not statics
fluent(Pred/Arity) :- not(static(Pred/Arity)).

%% derived predicates info
:- dynamic derived/1.
%
%  declare your derived predicates here
%  



%% primitive predicates info
:- dynamic primitive/1.
% primitives are not derived
primitive(Pred/Arity) :- not(derived(Pred/Arity)).

%% metaLevel predicates info
:- dynamic metaLevel/1.
%
%  declare your metaLevel predicates here
%  



%% objectLevel predicates info
:- dynamic objectLevel/1.
% objectLevel is not metaLevel
objectLevel(Pred/Arity) :- not(metaLevel(Pred/Arity)).
