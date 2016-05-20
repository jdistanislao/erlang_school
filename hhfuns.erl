-module(hhfuns).
-export([map/2, incr/1, decr/1, fold/3]).

map(_,[]) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

%% L = [1,2,3,4].
%% hhfuns:map(fun hhfuns:incr/1, L).
%% hhfuns:map(fun(X) -> X * 2 end, L).

fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).

%% [H|T] = [1,2,3,4].
%% hhfuns:fold(fun(A,B) -> A + B end, 0, T).
%% hhfuns:fold(fun(A,B) -> A + B end, H, T).
