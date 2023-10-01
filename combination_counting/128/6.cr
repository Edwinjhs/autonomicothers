#! /usr/bin/crystal

# $ ameba richardalmanza.cr #Linting
# Inspecting 1 file.
# .
# Finished in 2.24 milliseconds
# 1 inspected, 0 failures.
# $ crystal build richardalmanza.cr --release

require "big"

def fac(n)
  f = 1.to_big_i

  (2..n).each do |x|
    f *= x
  end

  f
end

def c(n, k)
  fac(n) / (fac(k) * fac(n-k))
end

args = ARGV
fluid = args == [] of String

args = File.read("DATA.lst").split if fluid
args = args[0].split if !fluid

args = args[1..].map {|x| x.to_i}

(0...args.size).step(2).each do |x|
  oput = "#{c(args[x], args[x + 1])}"
  print "#{oput[...-2]} "
end

puts

# $ ./richardalmanza.cr
# 53060358690 11050084695 106391256409 289875371509 10235867928 35607051480
# 22760723700 65033528560
