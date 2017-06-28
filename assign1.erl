-module(assign1).
-export([perimeter/1, area/1, side3/2]).
-import(math, [pow/2, sqrt/1]).

side3(A,B) ->
    sqrt(pow(A,2) + pow(B,2)).


perimeter({rectangle, L, W}) ->
    2*L + 2*W;
perimeter({square, S}) ->
    4*S;
perimeter({triangle, A, B}) ->
    A + B + side3(A,B).


area({rectangle, L, W}) ->
    L * W;
area({square, S}) ->
    pow(S,2);
area({triangle, A, B}) ->
    perimeter({triangle, A, B})/2.
