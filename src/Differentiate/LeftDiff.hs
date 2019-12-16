module Differentiate.LeftDiff
  ( differentiate
  )
where

import           Import

leftStep :: (Point -> Double) -> Double -> Point -> Point
leftStep f step point@(Point x y) = Point xnew ynew
 where
  xnew = x + step
  ynew = (f point - y) / step

differentiate :: (Point -> Double) -> Point -> Double -> Double -> [Point]
differentiate f point xf step = takeWhile (\(Point x _) -> x <= xf)
  $ iterator point
  where iterator = iterate $ leftStep f step
