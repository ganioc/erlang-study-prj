-module(drop_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    SupFlags = #{strategy => one_for_one, intensity => 1,
		 period => 5},
    Drop = #{id => dropserver,
	     start => {dropserver, start_link, []},
	     restart => permanent, shutdown => 5000, type => worker,
	     modules => [dropserver]},
    {ok, {SupFlags, [Drop]}}.
