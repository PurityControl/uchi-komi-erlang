-module(multiples).
-export([multiples_to/2]).

multiples_to(Limit, Dividends) ->
  lists:sum([X || X <- lists:seq(1, Limit),
                  lists:any(fun(Y) -> X rem Y =:= 0 end, Dividends)]).

