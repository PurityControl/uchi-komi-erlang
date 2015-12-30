%% @author PurityControl
%% @copyright 2015 PurityControl
%% @doc Implementation of Sieve of Eratosthenes
-module(eratosthenes).

-export([primes_to/1]).

%% @doc Given a limit returns all prime numbers up to that limit
-spec(primes_to(integer()) -> list(integer())).
primes_to(2) ->
    [2];
primes_to(3) ->
    [2, 3];
primes_to(Limit) when Limit > 2 ->
    primes_to(Limit, [3, 2], sieve(Limit)).

primes_to(Limit, Primes, [Sh | Sieve])  ->
    Filtered_sieve = lists:filter(fun(X) -> (X rem Sh) /= 0 end, Sieve),
    case (math:sqrt(Limit) =< Sh) of
        true ->
            lists:append(lists:reverse(Primes), [Sh | Filtered_sieve]);
        false ->
            primes_to(Limit, [Sh | Primes], Filtered_sieve)
    end.

sieve(Limit) ->
    lists:reverse(sieve(Limit, 1, [])).

sieve(Limit, Kval, Acc) when Kval * 6 - 1 > Limit ->
    Acc;
sieve(Limit, Kval, Acc) when Kval * 6 + 1 > Limit ->
    [Kval * 6 -1 | Acc];
sieve(Limit, Kval, Acc) ->
    sieve(Limit, Kval + 1, [Kval * 6 + 1 , Kval * 6 - 1 | Acc]).


