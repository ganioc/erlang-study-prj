-module(ask).

-export([term/0]).

term() ->
    Input = io:read("What {planemo, distance} ? >>"),
    process_term(Input).

process_term({ok, Term}) when is_tuple(Term) ->
    First = element(1, Term),
    Second = element(2, Term),
    io:format("X:~w, Y:~w~n", [First, Second]),
    Velocity = drop3:fall_velocity(First, Second),
    io:format("Yields ~w. ~n", [Velocity]),
    term();
process_term({ok, quit}) -> io:format("Goodbye.~n");
% does not call term again
process_term({ok, _}) ->
    io:format("You must enter a tuple.~n"), term();
process_term({error, _}) ->
    io:format("You must enter a tuple with correct "
	      "syntax.~n"),
    term().
