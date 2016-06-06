-module(tail_recursion).
-export([tfac/1, tfac/2, tlen/1, tlen/2, tsublist/2, tzip/2]).

%% Fattoriale 

tfac(N) -> tfac(N, 1).
tfac(0, Acc) -> Acc;
tfac(N, Acc) when N > 0 -> tfac(N-1, N*Acc).

%% Lunghezza array

tlen(L) -> tlen(L, 0).
tlen([], Acc) -> Acc;
tlen([_|T], Acc) -> tlen(T, 1 + Acc).

%% Sublist

tsublist(L, N) -> lists:reverse(tsublist(L, N, [])).
tsublist(_, 0, Sublist) -> Sublist;
tsublist([], _, Sublist) -> Sublist;
tsublist([H|T], N, Sublist) when N > 0 -> tsublist(T, N-1, [H|Sublist]).

%% Zip

tzip(K,V) -> lists:reverse(tzip(K,V,[])).
tzip([], _, Zip) -> Zip;
tzip(_, [], Zip) -> Zip;
tzip([X|Y], [Xv|Yv], Zip) -> tzip(Y, Yv, [{X,Xv}|Zip]).
