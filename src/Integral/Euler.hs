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
