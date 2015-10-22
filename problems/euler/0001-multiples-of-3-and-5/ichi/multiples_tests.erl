% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(multiples, [verbose])" -s init stop

-module(multiples_tests).
-include_lib("eunit/include/eunit.hrl").
-import(multiples, [multiples_to/2]).

multiples_to_10_test() ->
    ?assertEqual(23, multiples_to(9, [3,5])).

multiples_to_1000_test() ->
    ?assertEqual(233168, multiples_to(999, [3,5])).
