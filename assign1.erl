-module(assign1).
-export([perimeter/1, area/1, side3/2, enclose/1, bits/1, bitsTR/1]).
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


enclose({square, S}) ->
    {rectangle, S, S};
% I'm assuming the triangle base is A.
enclose({triangle, A, B}) ->
    Triangle_area = area({triangle, A, B}),
    Triangle_height = Triangle_area/2,
    {rectangle, Triangle_height, ((Triangle_area * 2)/Triangle_height)};
enclose({rectangle, L,W}) ->
    {rectangle, L, W}.


% Direct recursion.
bits(0) ->
    0;
bits(N) ->
    (N rem 2) + bits(N div 2).


%w W/ tail recursion.
bitsTR(0, Sum) ->
    Sum;
bitsTR(N, Sum) ->
    bitsTR(N div 2, Sum + (N rem 2)).

bitsTR(N) ->
    bitsTR(N,0).



