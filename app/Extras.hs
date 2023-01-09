module Extras where

data Dice = S1 | S2 | S3 | S4 | S5 | S6 deriving (Eq, Ord, Enum)
type Radius = Double
type Side = Double
data Shape = Circle Radius | Square Side | Rectangle Side Side

instance Show Dice where
  show S1 = "I"
  show S2 = "II"
  show S3 = "III"
  show S4 = "IV"
  show S5 = "V"
  show S6 = "VI"




perimeter :: Shape -> Double
perimeter (Circle radius) = 2 * pi * radius
perimeter (Square side) = 4 * side
perimeter (Rectangle side1 side2) = 2 * (side1 + side2)

sq :: Shape -> Double
sq (Circle radius) = pi * (radius ^ 2)
sq (Square side) = side ^ 2
sq (Rectangle side1 side2) = side1 * side2
