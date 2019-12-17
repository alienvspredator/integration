module Differentiate.LeftDiff
  ( differentiate
  )
where

import           Types

leftStep :: (Point -> Double) -> Double -> Point -> Point
leftStep f step point@(Point x y) = Point xnew ynew
 where
  xnew = x + step
  ynew = (f point - y) / step

differentiate :: (Double -> Double) -> Point -> Double -> Double -> [Point]
differentiate f point xf step = takeWhile (\(Point x _) -> x <= xf)
  $ iterator point
  where iterator = iterate $ \(Point x _) -> derive f step x

-- differentiate :: (Point -> Double) -> Point -> Double -> Double -> [Point]
-- differentiate f point@(Point x y) xf step = Point (x + step) (derive step f y)

-- derive :: (Fractional a) => a -> (a -> a) -> (a -> a)
derive :: (Double -> Double) -> Double -> Double -> Point
derive f step x = Point xnew ynew
  where
    xnew = x + step
    ynew = (f xnew - f x) / step
