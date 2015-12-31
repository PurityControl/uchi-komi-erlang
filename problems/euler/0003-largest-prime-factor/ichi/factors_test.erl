-module(factors_test).

-include_lib("eunit/include/eunit.hrl").

largest_prime_factor_13195_test() ->
    ?assertEqual(29, factors:lpf(13195)).

largest_prime_factor_euler_test() ->
    ?assertEqual(6857, factors:lpf(600851475143)).

