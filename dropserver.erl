-module(dropserver).

-behaviour(gen_server).

-export([start_link/0]).

-export([code_change/3, handle_call/3, handle_cast/2,
	 handle_info/2, init/1, terminate/2]).

-define(SERVER, ?MODULE).

-record(state, {count}).

% startup, arguments, options)
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [],
			  []).

% gen_server callbacks
init([]) -> {ok, #state{count = 0}}.

handle_call(_Request, _From, State) ->
    Distance = _Request,
    Reply = {ok, fall_velocity(Distance)},
    NewState = #state{count = State#state.count + 1},
    {reply, Reply, NewState}.

handle_cast(_Msg, State) ->
    io:format("So far, calculated ~w velocities.~n",
	      [State#state.count]),
    {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

% internal functions
fall_velocity(Distance) ->
    math:sqrt(2 * 9.8 * Distance).
