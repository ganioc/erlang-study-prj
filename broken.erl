-module(broken).

-export([bad_if/1]).

bad_if(Test_val) ->
    if Test_val < 0 -> X = 1, Y = 0;
       Test_val >= 0 -> X = 0, Y = 2
    end,
    X + Y.
