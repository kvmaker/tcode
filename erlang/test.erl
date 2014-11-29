-module(test).
-export([fac/1]).
-export([area/1]).
-export([listlen/1]).
-export([index/2]).
-import(math, [sqrt/1]).

fac(0) ->  1;
fac(N) -> N * fac(N-1).

area({square, Side}) ->
	Side * Side;
area({circle, Radius}) ->
	math:pi() * Radius * Radius;
area({triangle, A, B, C}) ->
	S = (A + B+ C)/2,
	sqrt(S*(S-A)*(S-B)*(S-C));
area(_Other) ->
	{error, invalid_object}.

listlen([]) ->
	0;
listlen([_|Xs]) ->
	1 + listlen(Xs).

index(0, [X|_]) -> X;
index(N, [_|Xs]) 
  when N > 0 -> index(N-1, Xs).
						 
	
