- higher-order function
 - currying
 - infix notation
  ```haskell
  divideByTen :: (Floating a) => a -> a
  divideByTen = (/10)
  divideByTen 200
  20.0
  ```