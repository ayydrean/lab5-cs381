/***************************************/
%     CS 381 - Programming Lab 5        %
%                                       %
%  Adrian Toscano                       %
%  toscanoa@oregonstate.edu             %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).

/**** parents ****/
% mother
% mother(X, 'Queen Elizabeth II').
mother(M,C):- parent(M,C), female(M).

% father
father(F,C):- parent(F,C), male(F).
