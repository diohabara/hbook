import Data.List
import Control.Monad (liftM, foldM)

solveRPN :: String -> Maybe Double
solveRPN st = do
    [result] <- foldM foldingFunction [] (words st)
    return result

foldingFunction :: [Double] -> String -> Maybe [Double]
foldingFunction (x:y:ys) "*" = return ((y * x ):ys)
foldingFunction (x:y:ys) "+" = return ((y + x ):ys)
foldingFunction (x:y:ys) "-" = return ((y - x ):ys)
foldingFunction (x:y:ys) "/" = return ((y / x):ys)
foldingFunction (x:y:ys) "**" =return ( (y ** x):ys)
foldingFunction (x:xs) "ln" = return (log x:xs)
foldingFunction xs "sum" = return ([sum xs])
foldingFunction xs numberString = liftM (:xs) (readMaybe numberString)

readMaybe :: (Read a) => String -> Maybe a
readMaybe st = case reads st of [(x, "")] -> Just x
                                _ -> Nothing
