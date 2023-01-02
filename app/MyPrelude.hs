module Main where

mdrop :: Int -> [a] -> [a]
mdrop 0 list = list
mdrop n (_:xs) = mdrop (n - 1) xs

mtake :: Int -> [a] -> [a]
mtake 0 _ = []
mtake _ [] = []
mtake n (x:xs) = x:tl
  where tl = mtake (n - 1) xs

mlength :: [a] -> Int
mlength [] = 0
mlength (x:xs) = 1 + (mlength xs)

mcycle :: [a] -> [a]
mcycle (x:xs) = x: mcycle (xs ++ [x])

mrev :: [a] -> [a]
mrev [] = []
mrev [x] = [x]
mrev (x:xs) = (mrev xs) ++ [x]

main = do
  return 0