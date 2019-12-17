module Integral.Euler
  ( integrate
  , integrate'
  )
where

import           Types

eulerStep :: (Double -> Double -> Double) -> Double -> Point -> Point
eulerStep f step (Point x y) = Point xnew ynew
 where
  xnew = x + step
  ynew = y + step * f x y

eulerStep' :: (Double -> Double -> Double) -> Double -> Point -> Point
eulerStep' f step (Point x y) = Point xnew ynew
 where
  xnew = x + step
  ynew = y + step * f (x + 0.5 * step) (y + 0.5 * step * f x y)

-- | Integrates with specified step function
_integrate
  -- | Step function
  :: ((Double -> Double -> Double) -> Double -> Point -> Point)
  -- | Function
  -> (Double -> Double -> Double)
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
integrate
  :: (Double -> Double -> Double) -> Point -> Double -> Double -> [Point]
integrate = _integrate eulerStep

-- Integrates with modified Euler's method
integrate'
  :: (Double -> Double -> Double) -> Point -> Double -> Double -> [Point]
integrate' = _integrate eulerStep'
