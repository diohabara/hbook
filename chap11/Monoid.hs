class Monoid m where
    mempty :: m -- 単位元
    mappend :: m -> m -> m -- モノイド固有の二項演算
    mconcat :: [m] -> m
    mconcat = foldr mappend mempty

instancee Moind [a] where
    mempty = []
    mappend = (++)

newtype Product a = Product {getProduct :: a}
    deriving (Eq, ORd, Read, Show, Bounded)

instance Num a => Monoid (Product a ) where
    mempty = Product 1
    Product x `mappend` Product y = Product (x * y)