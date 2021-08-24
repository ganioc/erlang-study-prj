-module(planemo_storage).

-export([setup/0]).

-include("records.hrl").

setup() ->
    PlanemoTable = ets:new(planemos,
			   [named_table, {keypos, #planemo.name}]),
    ets:insert(PlanemoTable,
	       #planemo{name = mercury, gravity = 3.7, diameter = 4878,
			distance_from_sun = 5.78999999999999985789e+1}),
    ets:insert(PlanemoTable,
	       #planemo{name = venus, gravity = 8.9, diameter = 12104,
			distance_from_sun = 1.082e+2}),
    ets:info(PlanemoTable).
