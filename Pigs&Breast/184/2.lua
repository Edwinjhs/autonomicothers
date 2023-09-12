local function matchesPicking(numM, numK, rule)
  local move = numM % (numK + 1)
  if rule ~= 'n' then
    if move ~= 0 then
      return move - 1
    else
      return numK
    end
  else
    return move
  end
end

local amount = tonumber(io.read())

local function main(_end)
  if _end == 0 then
    return
  else
    local data = io.read()
    local numM, numK, rule = data:match('(%d+) (%d+) (%a)')
    numM = tonumber(numM)
    numK = tonumber(numK)
    print(matchesPicking(numM, numK, rule))
    main(_end - 1)
  end
end

main(amount)
