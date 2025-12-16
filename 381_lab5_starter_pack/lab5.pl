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
/*test:  mother(X, 'Queen Elizabeth II'). */
mother(M,C):- parent(M,C), female(M).

% father
father(F,C):- parent(F,C), male(F).


/**** immediate family ****/
% spouse
/* parent a is a spouse of parent b if parent a is married to parrent b*/
spouse(Pa,Pb):- married(Pa, Pb).

% child
/* C is a child of P if P is a parent of C*/
child(C,P):- parent(P,C).

% son
/*% s is a son of a parent if s is a child of parent and s is male*/
son(S,P):- child(S,P), male(S).

% daughter
/*% d is a daughter of a parent if d is a child of parent and d is female*/
daughter(D,P):- child(D,P), female(D).

% sibling
/* sibling 'a' is a sibling of sibling 'b'
 if there is a parent
  who is a parent of 'a' 
  and is a parent of 'b'
  and 'a' is not equal to 'b' */
sibling(Sa,Sb):- parent(P,Sa), parent(P,Sb), 
  Sa \= Sb.

% brother
/*B is a brother of P if B is a sibling of P and B is male.*/
brother(B,P):- sibling(B,P), male(B).

% sister
/* S is a sister of P if S is a sibling of P and S is female. */
sister(S,P):- sibling(S,P), female(S).

/**** extended family ****/
/* 
       gf  gm   gf  gm
 u a-    m        d    -u a
         grandchild
*/ 

% uncle
/* u is an uncle of n if u is a brother of p and p is a parent of n */
uncle(U,N):- brother(U,P), parent(P,N).

% aunt
/* A is an aunt of N if A is a sister of P and P is a parent of N*/
aunt(A,N):- sister(A,P), parent(P,N).

% grandparent
/* G is a grandparent of GC if GP is a parent of P and P is a parent of GC */
grandparent(G,GC):- parent(G,P), parent(P,GC).

% grandfather
/* gf is a grandfather of GC if GF is a grandparent of GC 
and GF is male */
grandfather(GF,GC):- grandparent(GF,GC), male(GF).

% grandmother
/* gm is a grandmother of GC if GM is a grandparent of GC 
and GM is female */
grandmother(GM,GC):- grandparent(GM,GC), female(GM).
