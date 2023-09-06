input = <<~IN
6 10
26 136
106 336
200 500
IN

def iterate_possible_pairs(number)
    (number**0.5).to_i.times do |i|
        a = i + 1
        yield a, number / a if number % a == 0
    end
end

def is_answer(total_legs, pigs, breasts)
    return false if breasts.odd?
    total_legs - 4 * pigs > 0
end

answer = []
input.split("\n").map { |line| line.split.map(&:to_i) } .each do |legs, breasts|
    answers_count = 0
    iterate_possible_pairs(breasts - legs) do |a, b|
        answers_count += 1 if is_answer(legs, a, b+4)
        answers_count += 1 if a != b && is_answer(legs, b, a+4)
    end
    
    answer << answers_count
end

puts answer.join(" ")
