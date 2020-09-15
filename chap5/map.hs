map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = fx : map f xs