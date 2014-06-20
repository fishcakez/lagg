-module(lagg_app).

-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_StartType, _StartArgs) ->
    dbg:start(),
    dbg:tracer(),
    dbg:p(self(), all),
    io:put_chars(<<"THIS TOOK LONGER THAN YOU EXPECTED\n">>),
    dbg:p(self(), clear),
    dbg:stop(),
    lagg_sup:start_link().

stop(_State) ->
    ok.
