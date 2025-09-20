import Data.Bits (xor)

seedgen :: Integer -> Integer -> Integer -> Integer -> Integer
seedgen x y z s = (s `xor` (x*y*z)) `mod` (10^11)

main :: IO ()
main = do
  let
    x = 279
    y = 2937
    z = 290
    seed = 91271826627
    output = seedgen x y z seed

  print $ (seedgen x y z output) == seed
