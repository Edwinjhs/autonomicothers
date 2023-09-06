
let input = """
13
314 854
260 456
48 268
2052 5716
288 1036
984 2120
12 32
1916 4526
462 1662
26 62
76 246
62 326
228 400
"""

let lines = input.split(separator: "\n")

let pigLegs = 4
let humanLegs = 2
let humanBreasts = 2

var answer = ""
for line in lines[1...] {
    let ints = line.split(separator: " ").map({ Int($0)! })
    let (legs, breasts) = (ints[0], ints[1])
    
    var solutions = 0
    
    let divides4 = legs % 4 == 0
    for girls in stride(from: divides4 ? 2 : 1, through: legs / 2, by: 2) {
        let pigLegs = legs - 2 * girls
        if pigLegs == 0 {
            continue
        } else if pigLegs % 4 == 0 {
            let pigs = pigLegs / 4
            let pigBreasts = breasts - 2 * girls
            if pigBreasts % pigs == 0 && ((pigBreasts / pigs) % 2 == 0) {
                solutions += 1
            }
        }
    }
    answer += "\(solutions) "
}
print(answer.trimmingCharacters(in: .whitespaces))
