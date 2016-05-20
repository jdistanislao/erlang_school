-module(tail_recursion).
-export([tfac/1, tfac/2, tlen/1, tlen/2]).

%% Fattoriale con tail recursion

tfac(N) -> tfac(N, 1).
tfac(0, Acc) -> Acc;
tfac(N, Acc) when N > 0 -> tfac(N-1, N*Acc).

%% Funghezza array tail recursive

tlen(L) -> tlen(L, 0).
tlen([], Acc) -> Acc;
tlen([_|T], Acc) -> tlen(T, 1 + Acc).
