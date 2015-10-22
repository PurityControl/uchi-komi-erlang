-module(multiples).
-export([multiples_to/2]).
-import(lists, [sum/1, filter/2, seq/2, any/2]).

divisible_by(Multiples) ->
    fun(Number) -> 
           any(fun(Divisor) -> Number rem Divisor =:= 0 end, Multiples) end.

multiples_to(Limit, Multiples) ->
    sum(filter(divisible_by(Multiples), seq(1, Limit))).

