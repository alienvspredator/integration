module Integral.Euler
  ( integrate
  , integrate'
  )
where

import           Import

eulerStep :: (Point -> Double) -> Double -> Point -> Point
eulerStep f step point@(Point x y) = Point xnew ynew
 where
  xnew = x + step
  ynew = y + step * f point

eulerStep' :: (Point -> Double) -> Double -> Point -> Point
eulerStep' f step point@(Point x y) = Point xnew ynew
 where
  xnew = x + step
  ynew = y + step * (f point + f (Point xnew y)) / 2

-- | Integrates with specified step function
_integrate
  -- | Step function
  :: ((Point -> Double) -> Double -> Point -> Point)
  -- | Function
  -> (Point -> Double)
  -- | Start point
  -> Point
  -- | x interval
  -> Double
  -- | Step
  -> Double
  -- | Points by step
  -> [Point]
_integrate stepFn f point xf step = takeWhile (\(Point x _) -> x <= xf)
  $ iterator point
  where iterator = iterate $ stepFn f step

-- | Integrates with Euler's method
integrate :: (Point -> Double) -> Point -> Double -> Double -> [Point]
integrate = _integrate eulerStep

-- Integrates with modified Euler's method
integrate' :: (Point -> Double) -> Point -> Double -> Double -> [Point]
integrate' = _integrate eulerStep'
