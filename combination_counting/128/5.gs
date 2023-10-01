/*
valac --pkg glib-2.0 -X -lm usersantiago.gs
*/

[indent = 2]

def loop(cases:int, count:int)
  if count <= cases
    var input = stdin.read_line();
    number:array of string = input.split(" ")
    number_n: int = int.parse(number[0])
    number_k: int = int.parse(number[1])
    combi:double = combinations(number_k, number_n)
    print "%.0lf ", Math.round(combi)
    loop(cases, count + 1)

def combinations(elem_num:int, set_num:int):double
  fact_n:double = factorial(set_num)
  fact_k:double = factorial(elem_num)
  fact_nk:double = factorial(set_num - elem_num)
  combination: double = fact_n / (fact_k * fact_nk)
  return combination

def factorial(number: int): double
  if number < 0
    return 0.0
  else if number > 1
    return number * factorial(number - 1)
  else
  return 1.0

init
  var input = stdin.read_line()
  amount_cases:int = int.parse(input)
  loop(amount_cases, 1)
