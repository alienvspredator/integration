module Integral.Euler
  ( integrate
  )
where

import Import

eulerStep :: (Point -> Double) -> Double -> Point -> Point
eulerStep f step point@(Point x y) = Point xnew ynew
 where
  xnew = x + step
  ynew = y + step * f point

integrate :: (Point -> Double) -> Point -> Double -> Double -> [Point]
integrate f point xf step = takeWhile (\(Point x _) -> x <= xf)
  $ iterator point
  where iterator = iterate $ eulerStep f step
