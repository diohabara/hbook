import qualified Data.Map as Map

phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith (++)  map (\ (k, v) -> (k, [v])) xs
