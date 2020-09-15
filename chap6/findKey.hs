findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey key xs = foldr
  (\ (k, v) acc -> if key == k then Just v else acc)
  Nothing xs
