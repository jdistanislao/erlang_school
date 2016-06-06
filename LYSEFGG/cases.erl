-module(cases).
-author("distanislaoj").

%% API
-export([is_hot/1, is_hot_2/1]).

is_hot(Temp) ->
  case Temp of
    {celsius, N} when N < 18 -> 'cold';
    {celsius, N} when N > 30 -> 'hot';
    {celsius, _} when true   -> 'ok';
    _ -> 'bo!'
  end.


is_hot_2({celsius, N}) when N < 18 -> 'cold';
is_hot_2({celsius, N}) when N > 30 -> 'hot';
is_hot_2({celsius, _}) when true -> 'ok';
is_hot_2({_, _}) -> 'bo!'.