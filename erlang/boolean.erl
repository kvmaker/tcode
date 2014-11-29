-module(boolean).
-export([b_not/1]).
-export([b_and/2]).
-export([b_or/2]).
-export([b_nand/2]).

b_not(true) ->
	false;
b_not(false) ->
	true.

b_and(true, true) ->
	true;
b_and(true, false) ->
	false;
b_and(false, true) ->
	false;
b_and(false, false) ->
	false.

b_or(true, true) ->
	true;
b_or(true, false) ->
	true;
b_or(false, true) ->
	true;
b_or(false, false) ->
	false.

b_nand(true, true) ->
	false;
b_nand(true, false) ->
	true;
b_nand(false, true) ->
	true;
b_nand(false, false) ->
	false.