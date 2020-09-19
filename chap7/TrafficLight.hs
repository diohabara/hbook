-- new class
class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  x == y = not (x /= y)
  x /= y = not (x == y)

data TrafficLight = Red | Yellow | Green

-- new instance of class
instance Eq TrafficLight where
  Red == Red = True
  Yellow == Yellow = True
  Green == Green = Green
  _ == _ = False

instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"

instance Eq (Maybe m) where
  Just x == Just y = x == y
  Nothing == NOthing = True
  _ == _ = False