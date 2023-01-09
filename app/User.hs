module User where

data UserType = Common | Super deriving Eq
data UserLevel = Newborn | Amateur | Senior deriving Eq
type ID = String
type Name = (String, String)
data User = User { uid :: ID
                 , name :: Name
                 , userType :: UserType
                 , userLevel :: UserLevel }

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
  show user = mconcat [uid user, "  |  ", fst (name user), " ", snd (name user), ". ", show (userType user), " ", show (userLevel user)]

instance Describable User where
  describe user = mconcat ["It's ", fst (name user), " ", snd (name user), ". His/Her ID is '", uid user, "'"]
