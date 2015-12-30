-module(eratosthenes_tests).

-include_lib("eunit/include/eunit.hrl").
-import(eratosthenes, [primes_to/1]).

primes_to_20_test() ->
    ?assertEqual([2, 3, 5, 7, 11, 13, 17, 19], primes_to(20)).

primes_to_100_test() ->
    ?assertEqual([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97], primes_to(100)).

primes_length_to_1000_test() ->
    ?assertEqual(168, length(primes_to(1000))).

primes_length_to_7919_test() ->
    ?assertEqual(1000, length(primes_to(7919))).

primes_invalid_limit_test() ->
    ?assertException(error, function_clause, primes_to(1)).
