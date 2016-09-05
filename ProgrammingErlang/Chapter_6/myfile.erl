-module(myfile).

%% API
-export([
  read/1
]).

read(File) ->
  case file:read_file(File) of
    {ok, Bin} -> Bin;
    {error, _} -> throw(io_lib:format("An error is occured while trying to read file :~w", [File]))
  end.