module MyPrelude where

mHead :: [a] -> a
mHead [] = error "There is no head in empty list"
mHead (x:_) = x

mTail :: [a] -> [a]
mTail [] = error "There is no tail in empty list"
mTail (_:xs) = xs

mDrop :: Int -> [a] -> [a]
mDrop 0 list = list
mDrop n (_:xs) = mDrop (n - 1) xs

mTake :: Int -> [a] -> [a]
mTake 0 _ = []
mTake _ [] = []
mTake n (x:xs) = x : t
  where t = mTake (n - 1) xs

mLength :: [a] -> Int
mLength [] = 0
mLength (x:xs) = 1 + (mLength xs)

mCycle :: [a] -> [a]
mCycle (x:xs) = x : mCycle (xs ++ [x])

mReverse :: [a] -> [a]
mReverse [] = []
mReverse [x] = [x]
mReverse (x:xs) = (mReverse xs) ++ [x]

mMap :: (t -> a) -> [t] -> [a]
mMap _ [] = []
mMap func (x:xs) = (func x) : mMap func xs

mFilter :: (a -> Bool) -> [a] -> [a]
mFilter _ [] = []
mFilter condition (x:xs) = if condition x
                           then x : mFilter condition xs
                           else mFilter condition xs

mRevFilter :: (a -> Bool) -> [a] -> [a]
mRevFilter _ [] = []
mRevFilter condition (x:xs) = if condition x
                              then mRevFilter condition xs
                              else x : mRevFilter condition xs
