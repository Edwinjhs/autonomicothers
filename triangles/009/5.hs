import Data.List.Split
import Data.List
import Control.Monad

main = do
  sizeInput <- getLine
  let intSizeInput = read sizeInput :: Int
  inputData <- replicateM intSizeInput getLine
  let intInputData = map convert inputData
  let solution = map solve intInputData
  putStrLn (unwords solution)

convert :: String -> [Int]
convert dat = result
  where
    aux = splitOn " " dat
    result = map read aux :: [Int]

solve :: [Int] -> String
solve dat = result
  where
    sortedDat = sort dat
    a = sortedDat !! 0
    b = sortedDat !! 1
    c = sortedDat !! 2
    result = if a + b > c
      then show 1
      else show 0
