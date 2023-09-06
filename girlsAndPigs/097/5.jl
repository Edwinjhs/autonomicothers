function check_combination(girls, legs, breasts)
    new_legs = legs - 2girls
    new_breasts=breasts-2girls
    pigs=new_legs/4

    if new_legs%4 != 0
        return(false)
    elseif (new_breasts/pigs)%2 != 0
        return(false)
    elseif new_breasts%pigs !=0
        return(false)
    else
        return(true)
    end
end


function ReadDataFile(fn::AbstractString)
    f = open(fn, "r")
    lines = readlines(f)
    close(f)
    return lines[2:end]
end

data = ReadDataFile("GirlsandPigs_data")

for legs_breasts in data
    legs,breasts = map(x->parse(Int64,x),split(legs_breasts))
    max = (legs-2)/2
    possible_combinations = 0

    if (legs-2)%4 == 0
        for g=1:2:max
            if check_combination(g,legs,breasts)
                possible_combinations += 1
            end
        end
    else
        for g=2:2:max
            if check_combination(g,legs,breasts)
                possible_combinations += 1
            end
        end
    end
    print(possible_combinations, " ")
end
