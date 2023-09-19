function main()
  local n = io.read("n*")

  if math.type(n) ~= "integer" or n < 1 then
    return
  end

  local answers = {}
  for i = 1, n do
    local a, b, c = io.read("n*", "n*", "n*")
    table.insert(answers, smallest(a, b, c))
  end

  print(table.concat(answers, ' '))
end

function smallest(...)
  local numbers = {...}
  local smallest = math.huge

  for _, number in ipairs(numbers) do
    if number < smallest then
      smallest = number
    end
  end
  
  return smallest
end

main()
