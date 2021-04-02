:-op(1000, xfy, ==>).

% LEXICON
n ==> [humans].
n==>[tree].
v ==> [eat].
n ==> [fruit].
d ==>[some].
d ==>[the].
p==>[of].



% PHRASE STRUCTURE RULES
s==>dp,vp.
vp==>v,dp.
vp==>vp,pp.
pp==>p,dp.
dp==>d,np.
dp==>np.
np==>n.



% SHIFT-REDUCE PARSER
% Base
sr_parse1([s], []).

% Shift
sr_parse1(Stack, [Word|Words]):-
   (Cat ==> [Word]),
   sr_parse1([Cat|Stack], Words).

% Reduce
sr_parse1([Y,X|Rest], String):-
   (Z ==> X, Y),
   sr_parse1([Z|Rest], String).

sr_parse1([X|Rest], String):-
   (Y ==> X),
   sr_parse1([Y|Rest], String).
