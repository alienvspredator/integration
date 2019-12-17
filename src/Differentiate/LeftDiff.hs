module Differentiate.LeftDiff
  ( differentiate
  )
where

import           Types

derive :: (Double -> Double) -> Double -> Double -> Point
derive f step x = Point xnew ynew
  where
    xnew = x + step
    ynew = (f xnew - f x) / step

differentiate :: (Double -> Double) -> Point -> Double -> Double -> [Point]
differentiate f point xf step = takeWhile (\(Point x _) -> x <= xf)
  $ iterator point
  where iterator = iterate $ \(Point x _) -> derive f step x
