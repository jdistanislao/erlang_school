-module(bifs).

%% API
-export([my_tuple_to_list/1, my_time_func/1, my_date_string/0]).


my_tuple_to_list(T) when is_tuple(T) ->
  [element(N, T) || N <- lists:seq(1, tuple_size(T))].

my_time_func(F) ->
  Start = erlang:system_time(milli_seconds),
  F(),
  erlang:system_time(milli_seconds) - Start.

my_date_string() ->
  {Hour, Minute, Second} = time(),
  {Year, Month, Day} = date(),
  io:fwrite(standard_io, "Year: ~w, Month: ~w, Day: ~w at ~w:~w:~w",[Year, Month, Day, Hour, Minute, Second]).

