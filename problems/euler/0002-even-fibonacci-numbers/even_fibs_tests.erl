-module(even_fibs_tests).

-include_lib("eunit/include/eunit.hrl").
-import(even_fibs, [sum_to/1]).

sum_even_fibs_to_100_test() ->
    ?assertEqual(44, sum_to(100)).

sum_even_fibs_euler_test() ->
    ?assertEqual(4613732, sum_to(4000000)).
