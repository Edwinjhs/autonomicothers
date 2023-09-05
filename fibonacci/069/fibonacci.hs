function fibonacci(n)
    
    m = BigInt[1 1; 1 0]
    m = m^n
    value = m[2,1]
    
end


fib_serie(n) = (fibonacci(x) for x in 0:n)


function Fibonacci_div(number)
    
    value, state = iterate(fib_serie(number),0)
    
    while !(value % number == 0)
        
        value, state = iterate(fib_serie(number), state)
        
    end
    
    return state
    
end


input = """21
5926 4875 5551 9004 9300 6378 5627 7652 8703 3975 8926 4803 9376 9452 8401 6450 3226 5328 6302 3377 8327"""

input = split(input, "\n")
N = parse(Int, input[1])

values = map(x->parse(Int,x),split(input[2]))

for value in values
    println(Fibonacci_div(value))
end
