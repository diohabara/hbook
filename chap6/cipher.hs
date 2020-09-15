import Data.Char

encode :: Int -> String -> String
encode ofset msg = map (\c => chr $ ord c + offset) msg

decod :: Int -> String -> String
decode shift msg = encode (negate shift) msg
