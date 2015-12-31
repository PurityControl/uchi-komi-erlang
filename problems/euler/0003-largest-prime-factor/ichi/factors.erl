%% @author PurityControl
%% @copyright 2015 PurityControl
%% @doc Library to find the largest prime factor of a number.
-module(factors).

-export([lpf/1]).

%% @doc Returns the largest prime factor of a number. If the number is
%% prime then it returns itself
-spec(lpf(integer()) -> integer()).
lpf(Product) ->
    factorise(Product, [], sqrt_primes(Product)).

%% @doc Will return the head of the list of factors if the number is a compound
%% number.
%%
%% Factors are pushed onto the list starting with the lowest. Therefore
%% the head of the list at the end of factorisation when the Product has been
%% reduced to 1 is the largest prime factor.
%%
%% Alternatively, if the list of
%% factors is exhausted (ie. the number is prime) then the Product itself is
%% returned.
-spec(factorise(integer(), list(integer()), list(integer())) -> integer()).
factorise(1, [HF | _Factors], _Primes) ->
    HF;
factorise(Product, _Factors, []) ->
    Product;
factorise(Product, Factors, [HP | Primes]) when (Product rem HP) =:= 0 ->
    %io:puts("%s %s %s %s", Product, Factors, HP, Primes),
    factorise(Product div HP, [HP | Factors], [HP | Primes]);
factorise(Product, Factors, [_HP | Primes]) ->
    factorise(Product, Factors, Primes).

%% @doc Return all the primes up to the sqaure root of the Product
-spec(sqrt_primes(integer()) -> list(integer())).
sqrt_primes(Product) ->
    eratosthenes:primes_to(trunc(math:sqrt(Product))).
