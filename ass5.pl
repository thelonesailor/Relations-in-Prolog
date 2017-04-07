male(king_shantanu).
male(vyas).
male(sage_parashar).
male(chitrangad).
male(vichitraveerya).
male(pandu).
male(yudhisthir).
male(bhim).
male(arjun).
male(vidur).
male(karn).
male(nakul).
male(sahdev).
male(dhrutarashtra).
male(dussan).
male(yuyutsu).
male(duryon).


female(ambalika).
female(kunti).
female(madri).
female(ganga).
female(satyavati).
female(ambika).
female(gandhari).
female(dushala).
female(third_maid).

%child(X,Y) X has child Y
child(sage_parashar,vyas).
child(satyavati,vyas).
child(satyavati,vichitraveerya).
child(satyavati,chitrangad).
child(ambalika,pandu).
child(vichitraveerya,pandu).
child(kunti,yudhisthir).
child(kunti,bhim).
child(kunti,arjun).
child(pandu,yudhisthir).
child(pandu,bhim).
child(pandu,arjun).
child(gandhari,duryon).
child(gandhari,dushala).
child(gandhari,dussan).
child(dhrutarashtra,duryon).
child(dhrutarashtra,dushala).
child(dhrutarashtra,dussan).
child(madri,nakul).
child(madri,sahdev).
child(pandu,nakul).
child(pandu,sahdev).
child(kunti,karn).
child(vyas,dhrutarashtra).
child(ambika,dhrutarashtra).
child(dhrutarashtra,yuyutsu).
child(vyas,vidur).
child(third_maid,vidur).


married(king_shantanu,ganga).
married(king_shantanu,satyavati).
married(ambika,vichitraveerya).
married(ambalika,vichitraveerya).
married(third_maid,vichitraveerya).
married(pandu,kunti).
married(pandu,madri).
married(gandhari,dhrutarashtra).



married(X,Y):- married(Y,X),!.


%X is father of Y
father(X,Y) :- male(X),child(X,Y).
%X is mother of Y
mother(X,Y) :- female(X),child(X,Y).

%X is son of Y
son(X,Y) :- male(X),child(Y,X).
%X is daughter of Y
daughter(X,Y) :- female(X),child(Y,X).

grandfather(X,Y) :- male(X),child(X,Somebody),child(Somebody,Y).
grandmother(X,Y) :- female(X),child(X,Somebody),child(Somebody,Y).

aunt(X,Y) :- female(X),sister(X,Mom),mother(Mom,Y).
aunt(X,Y) :- female(X),sister(X,Dad),father(Dad,Y).
uncle(X,Y) :- male(X),brother(X,Par),child(Par,Y).
cousin(X,Y) :- uncle(Unc , X),father(Unc,Y).

%X is ancestor of Y
ancestor(X,Y) :- child(X,Y).
ancestor(X,Y) :- child(X,Somebody),ancestor(Somebody,Y).

%X is wife of Y
wife(X,Y) :- married(X,Y),male(Y),female(X).

%X is sister of Y
sister(X,Y) :- female(X),child(Somebody,X),child(Somebody,Y), X \= Y.
%X is brother of Y
brother(X,Y) :- male(X),child(Somebody,X),child(Somebody,Y), X \= Y.

sibling(X,Y) :- child(Somebody,X),child(Somebody,Y), X \= Y.

%some relation if common ancestor
%relation(X,X) :- false.
relation(X,Y) :- ancestor(Somebody,X),ancestor(Somebody,Y), X \= Y.

%X is nephew of Y
nephew(X,Y) :- sibling(Y,B),child(B,X),male(X).

%X is neice of Y
neice(X,Y) :- sibling(Y,B),child(B,X),female(X).

