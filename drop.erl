%% @author Simon Yang
%% @doc Function calculation of velocities hello
%% dropped in a vacuum.
%% @copyright 2017 by Simon Laurent
%% @version 0.1

-module(drop).

-export([fall_velocity/1]).

fall_velocity(Distance) ->
    math:sqrt(2 * 9.8 * Distance).
