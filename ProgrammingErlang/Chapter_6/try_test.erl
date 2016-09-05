-module(try_test).

%% API
-export([
  demo1/0,
  demo2/0,
  demo3/0
]).

demo1() ->
  [catcher(I) || I <- [1,2,3,4,5]].

demo2() ->
  [{I, (catch generate_exception(I))} || I <- [1,2,3,4,5]].

demo3() ->
  catcher(5).

catcher(N) ->
    try generate_exception(N) of
      Val -> {N, normal, Val}
    catch
      throw:X -> {N, caught, thrown, X};
      exit:X  -> {N, caught, exited, X};
      error:X ->
        erlang:display(erlang:get_stacktrace()),
        {N, caught, error, X}
    end.

generate_exception(1) -> a;
generate_exception(2) -> throw(a2);
generate_exception(3) -> exit(a3);
generate_exception(4) -> {'EXIT', a4};
generate_exception(5) -> error(a5).