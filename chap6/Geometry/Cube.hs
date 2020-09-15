module Geometry.Cube
  ( volume
  , area
  ) where

volume :: Float -> Float
volume side = Cuboid.volume side side side

area :: Float -> Float
area side = Cuboid.area side side side
