--[[
language: lua
Path: andresfes12.lua
--]]

local function isTriangle(a, b, c)
  if a + b > c and b + c > a and c + a > b then
    return 1
  else
    return 0
  end
end

local function readTriplets(triplets, index, numTriplets)
  if index > numTriplets then
    return triplets
  end

  local triplet = io.read()
  table.insert(triplets, triplet)

  return readTriplets(triplets, index + 1, numTriplets)
end

local numTriplets = tonumber(io.read())
local triplets = readTriplets({}, 1, numTriplets)

local function isTrianglePossible(triplets, index)
  if index > #triplets then
    return
  end

  local triplet = triplets[index]
  local a, b, c = triplet:match("(%S+)%s+(%S+)%s+(%S+)")
  local result = isTriangle(tonumber(a), tonumber(b), tonumber(c))
  io.write(result, " ")

  isTrianglePossible(triplets, index + 1)
end

isTrianglePossible(triplets, 1)

--[[cat DATA.lst | lua andresfes12.lua
1 0 1 0 0 0 0 1 0 1 1 1 1 0 0 1 1 1 0 1 0
--]]
