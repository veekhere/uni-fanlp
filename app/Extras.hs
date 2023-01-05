module Extras where

gcdMap :: [Int] -> Int
gcdMap [] = error "Empty list"
gcdMap [a] = a
gcdMap (x:xs) = gcd x rest
                where rest = gcdMap xs
