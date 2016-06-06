-module(afile_server).

%% API
-export([start/1, loop/1]).

start(Dir) -> spawn(afile_server, loop, [Dir]).

loop(Dir) ->
  receive
    {Client, list_dir} ->
      Client ! {self(), file:list_dir(Dir)};
    {Client, {get_file, File}} ->
      FullPath = filename:join(Dir, File),
      Client ! {self(), file:read_file(FullPath)};
    {Client, {put_file, FileName, Content}} ->
      FullPath = filename:join(Dir, FileName),
      case file:write_file(FullPath, Content) of
        ok -> Client ! {self(), "ok"};
        {error, Reason} -> Client ! {self(), Reason}
      end
  end,
  loop(Dir).