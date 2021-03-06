%% @author PurityControl
%% @copyright PurityControl 2015
%% @doc euler problem to total up even fibonacci numbers up to a limit.

-module(even_fibs).

-export([sum_to/1]).

%% @doc sums even fibonacci numbers up to specified limit
-spec(sum_to(integer()) -> integer()).
sum_to(Limit) ->
    sum_to(Limit, [1, 1], 0).

sum_to(Limit, [Ult, Pen], Total) when Ult + Pen >= Limit ->
    Total;
sum_to(Limit, [Ult, Pen], Total) when (Ult + Pen) rem 2 =:= 1 ->
    sum_to(Limit, [Ult + Pen, Ult], Total);
sum_to(Limit, [Ult, Pen], Total) ->
    sum_to(Limit, [Ult + Pen, Ult], Total + Ult + Pen).

