-- $ curry-verify zettaploom.curry
-- -----------------------------------------------------------------------
-- curry-verify: Curry programs -> Verifiers (Version 2.0.0 of 02/01/2019)
-- -----------------------------------------------------------------------
-- No properties found in module `zettaploom'!

import Read (readInt)
import IO (getContents)
import List (split, init)
import Integer (factorial)

getLines :: IO String
getLines = do
  lines <- getContents
  return lines

toInt :: [String] -> Int -> [[Int]] -> [[Int]]
toInt list index result
  =
  if index >= length list
    then result
    else
      let
        line = split (==' ') (list !! index)
        const_n = readInt (line !! 0)
        const_k = readInt (line !! 1)
        result_aux = result ++ [[const_n, const_k]]
        index_aux = index + 1
      in toInt list index_aux result_aux

resolve :: [[Int]] -> Int -> [String] -> [String]
resolve lines index result
  =
  if index >= length lines
    then result
    else
      let
        line = lines !! index
        const_n = head line
        const_k = line !! 1
        division = calcFact const_n const_k
        result_aux = result ++ division
        index_aux = index + 1
      in resolve lines index_aux result_aux

calcFact :: Int -> Int -> [String]
calcFact const_n const_k = do
  let
    numerator = factorial const_n
    denominator = (factorial const_k) * (factorial (const_n - const_k))
    result = show (div numerator denominator)
  return result

main :: IO ()
main = do
  input <- getLines
  let
    lines = split (=='\n') input
    numbers = toInt (tail (init lines)) 0 []
    result = resolve numbers 0 []
  putStrLn (unwords result)

-- $ cat DATA.lst | pakcs :load zettaploom.curry :eval main :quit
-- 3295144749 49594720968 23446881315 5743572120 77515521435 53060358690
-- 26075972546
