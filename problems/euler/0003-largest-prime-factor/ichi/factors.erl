-module(factors).

-export([lpf/1]).

lpf(Product) ->
    factorise(Product, [], sqrt_primes(Product)).

factorise(1, [HF | _Factors], _Primes) ->
    HF;
factorise(Product, _Factors, []) ->
    Product;
factorise(Product, Factors, [HP | Primes]) when (Product rem HP) =:= 0 ->
    %io:puts("%s %s %s %s", Product, Factors, HP, Primes),
    factorise(Product div HP, [HP | Factors], [HP | Primes]);
factorise(Product, Factors, [_HP | Primes]) ->
    factorise(Product, Factors, Primes).

sqrt_primes(Product) ->
    eratosthenes:primes_to(trunc(math:sqrt(Product))).
