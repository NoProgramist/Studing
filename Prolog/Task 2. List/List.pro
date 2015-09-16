writeList([]).
writeList([X|L]):-write(X), write(" "), writeList(L).

belongs(X, [X|_]).
belongs(X, [_|L]):-belongs(X, L).

push(X, L, [X|L]).

%reverse
reverse(L, RevL) :- reverse(L, [], RevL).
reverse([], RevPrefix, RevPrefix).
reverse([X|L], RevPrefix, RevL) :- 
reverse(L, [X|RevPrefix], RevL).

%merge lists A and B, A will be in reverse order.
mergeLists([], B, B).
mergeLists([X|A], B, AB) :-mergeLists(A, [X|B], AB).
concat(A, B, AB):-reverse(A, RevA), mergeLists(RevA, B, AB).

nthElem(X, L, N):- nthElem(X, L, 1, N).
nthElem(X, [X|_], N, N).
nthElem(X, [_|L], Pos, N):-NextPos is Pos + 1, nthElem(X, L, NextPos, N).

not(X) :- X, !, fail.
not(X) :- true.

unique([], U).
unique([X|L], U):-(belongs(X, U)),!, unique(L, U).
unique([X|L], U):-unique(L, [X|U]).

union(A, B, AB):-concat(A, B, ABCon), unique(ABCon, AB).

cross(A, B, Res):-cross(A, B, [], Res).
cross([], _, RevAns, Ans):-reverse(RevAns, Ans). 
cross([X|A], B, RevAns, Ans):-(belongs(X, B)), !, cross(A, B, [X|RevAns], Ans).
cross([_|A], B, RevAns, Ans):-cross(A, B, RevAns, Ans).

diff(A, B, Res):-diff(A, B, [], Res).
diff([], _, RevAns, Ans):-reverse(RevAns, Ans). 
diff([X|A], B, RevAns, Ans):-not(belongs(X, B)), !, diff(A, B, [X|RevAns], Ans).
diff([_|A], B, RevAns, Ans):-diff(A, B, RevAns, Ans).

flatten(A, Res):-flatten(A, [], Res).
flatten([], Temp, Res):-reverse(Temp, Res).

flatten([X|A], Temp, Res):-!,
flatten(X, TempA), flatten(A, TempB), 
concat(TempA, TempB, Res).
flatten(X, [X]).

%?-writeList([1, 2, 3, 4, 5]).
%?-reverse([1, 2, 3, 4, 5], RevL), writeList(RevL).
%?-mergeLists([1, 2, 1, 4], [3, 4, 5], A), writeList(A).
%?-nthElem(X, [1, 2, 3, 4, 5, 6], 4), write(X).
%?-unique([1, 2, 1, 2, 3, 3, 1, 5, 4, 6], U), writeList(U).
%?-union([1, 2, 3, 4, 5], [1, 3, 5, 7, 8], A), writeList(A).
%?-cross([1, 2, 3, 4, 5], [1, 3, 5, 7, 8], C), writeList(C).

%?-diff([1, 2, 3, 4, 5, 10], [1, 3, 5, 7, 8], C), writeList(C).
?-flatten([[1, 2, 0, 7, [a, b]], [3, 4]], L), writeList(L).
