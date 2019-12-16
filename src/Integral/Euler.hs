module Integral.Euler
  ( integrate
  )
where

data Point = Point Double Double

instance Show Point where
  show (Point x y) = "(x: " ++ show x ++ ", y: " ++ show y ++ ")"

eulerStep :: (Point -> Double) -> Double -> Point -> Point
eulerStep f step point@(Point x y) = Point xnew ynew
 where
  xnew = x + step
  ynew = y + step * f point

integrate :: (Point -> Double) -> Point -> Double -> Double -> [Point]
integrate f point xf step = takeWhile (\(Point x _) -> x <= xf)
  $ iterator point
  where iterator = iterate $ eulerStep f step
