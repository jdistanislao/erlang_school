-module(hhfuns).
-export([map/2, incr/1, decr/1]).

map(_,[]) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

%% L = [1,2,3,4].
%% hhfuns:map(fun hhfuns:incr/1, L).
%% hhfuns:map(fun(X) -> X * 2 end, L).
