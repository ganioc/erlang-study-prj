-module(droprocess).

-export([drop/0]).

drop() ->
    receive
      {From, Planemo, Distance} ->
	  From ! {Planemo, Distance, calc(Planemo, Distance)},
	  drop()
    end.

calc(_, Distance) -> math:sqrt(2 * Distance).
