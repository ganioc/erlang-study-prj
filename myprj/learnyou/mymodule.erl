%% Simple Erlang module

-module(mymodule).

-export([pie/0, sum/1]).

pie() -> 3.14.

sum(0)->0;
sum(N)-> sum(N-1) + N.
