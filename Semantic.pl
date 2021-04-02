:-op(1000, xfy, ==>).

%LEXICON
n(h) ==> [humans].
n(f) ==> [fruit].
n(t) ==> [tree].
v(Y^X^K^eat(K,Y)) ==> [eat].
d(Q^the(Q))==>[the].
p(R^Z^of(Z,R))==>[of].

%PHRASE STRUCTURE RULES

s(Sem) ==> dp(Subj), vp(Subj^Sem).
vp(Sem) ==> v(Deter^Sem),dp(Deter).
vp(Sem) ==> vp(Pre^Sem),pp(Pre).
pp(Sem) ==>p(Pro^Sem),dp(Pro).
dp(Sem)==>d(Deter^Sem),np(Deter).
dp(Sem) ==> np(Sem).
np(Sem) ==> n(Sem).

%SHIFT-REDUCE PARSER
%Base
sr_parse3([s(Sem)], []):- writeln(Sem).

% Shift
sr_parse3(Stack, [Word|Words]):-
   (Cat ==> [Word]),
   sr_parse3([Cat|Stack], Words).

% Reduce
sr_parse3([Y,X|Rest], String):-
   (Z ==> X, Y),
   sr_parse3([Z|Rest], String).

sr_parse3([X|Rest], String):-
   (Y ==> X),
   sr_parse3([Y|Rest], String).
