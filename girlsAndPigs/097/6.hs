import Control.Monad


main :: IO ()
main = do
  l0 <- getLine
  ls <- replicateM (read l0) getLine
  putStrLn $ unwords $ gpS <$> ls


gpS :: String -> String
gpS s = case read <$> words s of
  [a, b] -> show $ gp a b
  _ -> "gpS: Parse Error."


--gp :: Int -> Int -> (Int, [(Int, Int)])
gp a b = length $ do
  p <- [1 .. (a - 2) `quot` 4]
  let
    (q, r) = (b - a) `quotRem` p
    x = q + 4
    in guard $ r == 0 && x `rem` 2 == 0 
