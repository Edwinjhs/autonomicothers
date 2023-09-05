let input = """
21
3975 3226 6378 4352 4500 5254 7278 8703 7953 9675 2327 4429 7652 7502 4728 4275 9300 8179 6000 5778 2625
"""

struct BigInt : CustomDebugStringConvertible {
    private let values: [UInt8]
    
    init(value: Int) {
        var values = [UInt8]()
        var val = value
        repeat {
            let digit = UInt8(val % 10)
            values.append((digit & 0x0F) >> 0)
            values.append((digit & 0xF0) >> 4)
            val /= 10
        } while val > 0
        self.values = values
    }
    
    private init(values: [UInt8]) {
        self.values = values
    }
    
    var digitCount: Int { get { return values.count / 2 } }
    
    var debugDescription: String {
        var str = ""
        for i in stride(from: digitCount - 1, through: 0, by: -1) {
            str += "\(digit(at: i))"
        }
        return str
    }
    
    func digit(at i: Int) -> UInt8 {
        return digit(at: i, in: values)
    }
    
    func digit(at i: Int, in values: [UInt8]) -> UInt8 {
        return (values[2 * i + 0] << 0) | (values[2 * i + 1] << 4)
    }
    
    func divides(_ x: Int) -> Bool {
        assert(x > 0)
        if x == 1 {
            return true
        }
        var digits = 0
        var digitCount = 0
        var i = self.digitCount - 1
        while true {
            while digits < x && i >= 0 {
                digits = (digits * 10) + Int(digit(at: i))
                digitCount += 1
                i -= 1
            }
            digits %= x
            if i < 0 {
                return digits == 0
            }
            if digits == 0 {
                digitCount = 0
            } else {
                digitCount = Int(ceil(log10(Double(digits)))) + ((digits % 10) == 0 ? 1 : 0)
            }
        }
    }
    
    static func +(a: BigInt, b: BigInt) -> BigInt {
        if a.digitCount < b.digitCount {
            return b + a
        }
        
        var values = [UInt8](repeatElement(0, count: a.values.count))
        var carry: UInt8 = 0
        for i in 0..<b.digitCount {
            var digit = carry + a.digit(at: i) + b.digit(at: i)
            if digit > 9 {
                (digit, carry) = (digit - 10, 1)
            } else {
                carry = 0
            }
            values[2 * i + 0] = (digit & 0x0F) << 0
            values[2 * i + 1] = (digit & 0xF0) << 1
        }
        if carry == 0 {
            let range = (2 * b.digitCount)...
            values.replaceSubrange(range, with: a.values[range])
            return BigInt(values: values)
        }
        for i in b.digitCount..<a.digitCount {
            var digit = carry + a.digit(at: i)
            if digit > 9 {
                (digit, carry) = (digit - 10, 1)
            } else {
                carry = 0
            }
            values[2 * i + 0] = (digit & 0x0F) << 0
            values[2 * i + 1] = (digit & 0xF0) << 1
            if carry == 0 {
                let range = (2 * i + 2)...
                values.replaceSubrange(range, with: a.values[range])
                return BigInt(values: values)
            }
        }
        values.append(1)
        values.append(0)
        return BigInt(values: values)
    }
}

var prev = BigInt(value: 0)
var next = BigInt(value: 1)
var fibs = [prev, next]
func nextFib(n: Int) -> BigInt {
    if n >= fibs.count {
        for _ in fibs.count...n {
            (prev, next) = (next, prev + next)
            fibs.append(next)
        }
    }
    return fibs[n]
}

var answer = ""
let lines = input.split(separator: "\n")
let ints = lines[1].split(separator: " ").map({ Int($0)! })
outer:
for m in ints {
    var n = 1
    while true {
        let f = nextFib(n: n)
        if f.divides(m) {
            answer += "\(n) "
            continue outer
        }
        n += 1
    }
    fatalError("\(m)")
}
print(answer.trimmingCharacters(in: .whitespaces))
