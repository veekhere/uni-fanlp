module Extras where

data UserType = Common | Super deriving Eq
data UserLevel = Newborn | Amateur | Senior deriving Eq
type ID = String
type Name = (String, String)
data User = User { uid :: ID
                 , name :: Name
                 , userType :: UserType
                 , userLevel :: UserLevel }
data Dice = S1 | S2 | S3 | S4 | S5 | S6 deriving (Eq, Ord, Enum)

class Describable a where
  describe :: a -> String


instance Show UserType where
  show Common = "Common User"
  show Super = "Super User"

instance Show UserLevel where
  show Newborn = "Class Newborn"
  show Amateur = "Class Amateur"
  show Senior = "Class Senior"

instance Show User where
  show user = (uid user) ++ "  |  " ++ (fst (name user)) ++ " " ++ (snd (name user)) ++ ". "
                      ++ (show (userType user)) ++ " " ++ (show (userLevel user))

instance Describable User where
  describe user = "It's " ++ (fst (name user)) ++ " " ++ (snd (name user)) ++ ". His/Her ID is '" ++ (uid user) ++ "'"

instance Show Dice where
  show S1 = "I"
  show S2 = "II"
  show S3 = "III"
  show S4 = "IV"
  show S5 = "V"
  show S6 = "VI"


gcdMap :: Integral a => [a] -> a
gcdMap [] = error "Empty list"
gcdMap [a] = a
gcdMap (x:xs) = gcd x rest
                where rest = gcdMap xs
