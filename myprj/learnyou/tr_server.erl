%%% tr_server

-module(tr_server).

-behaviour(gen_server).

%% API
-export([]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

