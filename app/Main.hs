module Main where
import Data.List

-- main :: IO ()
-- main = do

sqrEq a b c = if d >= 0
              then (x1, x2)
              else (0, 0)

              where d = b^2 - 4 * a * c
                    x1 = (-b + (sqrt d)) / 2 * a
                    x2 = (-b - (sqrt d)) / 2 * a

listOfNames = [("Zike", "Mollan"), ("Xavier", "Mollan"), ("Robert", "Mollan")]

compareByName name1 name2 =
  if fName > sName
  then GT
  else
    if fName < sName
    then LT
    else EQ
  
  where fName = fst name1
        sName = fst name2

compareByLastName name1 name2 =
  if fName > sName
  then GT
  else
    if fName < sName
    then LT
    else EQ

  where fName = snd name1
        sName = snd name2

smartSortByLastName name1 name2 =
  if lName1 > lName2
  then GT
  else
    if lName1 < lName2
    then LT
    else
      if fName1 > fName2
      then GT
      else
        if fName1 < fName2
        then LT
        else EQ

  where fName1 = fst name1
        fName2 = fst name2
        lName1 = snd name1
        lName2 = snd name2

ifEven f x =
  if even x
  then f x
  else x

genIfEvenX x = flip ifEven x

hostRequestUrlBuilder host = (\apiKey resource id ->
  genRequestUrl host apiKey resource id)
  where genRequestUrl host apiKey resource id = "http://" ++ host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

main = do
  return 0
