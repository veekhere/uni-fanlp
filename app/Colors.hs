module Colors where

import Data.Semigroup

data Color = Red | Brown | Orange | Yellow | Green | Blue | Purple | Transparent
             deriving (Show, Eq)

instance Semigroup Color where
  (<>) Red Blue = Purple
  (<>) Blue Red = Purple
  (<>) Yellow Blue = Green
  (<>) Blue Yellow = Green
  (<>) Yellow Red = Orange
  (<>) Red Yellow = Orange
  (<>) Transparent a = a
  (<>) a Transparent = a
  (<>) a b
        | a == b = a
        | all (`elem` [Red, Blue, Purple]) [a, b] = Purple
        | all (`elem` [Blue, Yellow, Green]) [a, b] = Green
        | all (`elem` [Red, Yellow, Orange]) [a, b] = Orange
        | otherwise = Brown

instance Monoid Color where
  mempty = Transparent
  mappend = (<>)
