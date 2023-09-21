% erlc -W john2104.erl
% erl -compile john2104.erl
% erlint:lint("john2104.erl").
% {ok,[]}

-module(john2104).
-export([start/0]).
-export([readfile/1]).
-export([domath/3]).
-export([sendmath/2]).
-export([loop/1]).
-export([digest/1]).
-import(lists,[nth/2]).
-export([returnnumbers/1]).


loop(A) ->
  lists:foreach(fun(X) -> digest(X) end, A).


digest(A) ->
  Z = returnnumbers(A),
  L = length(Z),
  sendmath(Z, L).


sendmath(_, L) when L == 1 ->
  ok;


sendmath(A, L) when L > 1 ->
  K = nth(1, A),
  B = nth(2, A),
  O = nth(3, A),
  domath(K, B, O).


domath(A, B, C) ->
  Sum = (A + B + C)/2,
  Sqrt = Sum * (Sum - A) * (Sum - B) * (Sum - C),
  if Sqrt > 0 ->
    io:fwrite("1 ");
  true ->
    io:fwrite("0 ")
  end.


returnnumbers(T) ->
  [ element(1, string:to_integer(Substr)) ||
  Substr <- string:tokens(T, " ")].


readfile(FileName) ->
  {ok, Binary} = file:read_file(FileName),
  string:tokens(erlang:binary_to_list(Binary), "\r\n").


start() ->
  Arr = readfile("DATA.lst"),
  loop(Arr),
  io:fwrite("~n").


% erl -noshell -s john2104 start -s init stop
% 1 0
