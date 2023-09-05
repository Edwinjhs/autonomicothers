import Data.List

--works in ghci, gives other numbers when compiled, very strange
main = do
    content <- getContents
    mapM_ putStr $ intersperse " " $ map show $ (map (fibDiv . read) $ concatMap (words) $ tail $ lines content :: [Int])

fibDiv :: Int -> Int
fibDiv n = [x | let z = zip [0..] fibs, (x,y) <- z, y `rem` n ==0] !! 1

fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
