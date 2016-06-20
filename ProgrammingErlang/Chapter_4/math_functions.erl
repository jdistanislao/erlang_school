-module(math_functions).

%% API
-export([even/1, odd/1, filter/2, split/1, test_even_odd/0, test_filter/0, test_split/0]).

test_even_odd() ->
  true = even(2),
  true = even(10),
  false = even(11),
  false = odd(2),
  false = odd(10),
  true = odd(11),
  true = odd(21),
  ok.

test_filter() ->
  [2,4,6] = filter(fun even/1, [1,2,3,4,5,6]),
  ok.

test_split() ->
  {[2,4,6],[1,3,5]} = split([1,2,3,4,5,6]),
  {[2,4,6],[1,3,5]} = split_acc([1,2,3,4,5,6], {[], []}),
  ok.

even(X) when is_integer(X) ->
  case X rem 2 of
    0 -> true;
    _ -> false
  end.
odd(X) when is_integer(X) ->
  case X rem 2 of
    0 -> false;
    _ -> true
  end.

filter(F, L) when is_function(F) andalso is_list(L) ->
  lists:filter(F, L).

split(L) when is_list(L) ->
  Odds = filter(fun odd/1, L),
  Evens = filter(fun even/1, L),
  {Evens, Odds}.

split_acc([], {Even, Odd}) -> {lists:reverse(Even), lists:reverse(Odd)};
split_acc([H|T], {Even, Odd}) ->
  case even(H) of
    true -> split_acc(T, {[H | Even], Odd});
       _ -> split_acc(T, {Even, [H | Odd]})
  end.
