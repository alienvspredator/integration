{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

module Run
  ( run
  )
where

import           Import
import           Graphics.Gnuplot.Simple
import           System.Directory

run :: RIO App ()
run = do
  options <- appOptions <$> ask

  let point = Point (xOption options) (yOption options)
  let xf    = xfOption options
  let step  = stepOption options

  result <- if integrateOption options
    then return $ integrate' f point xf step
    else return $ differentiate (** 2) point xf step
  logInfo $ fromString $ show result

  when (graphicOutputOption options) $ do
    path <- liftIO $ getCurrentDirectory >>= \x -> return $ x ++ "/plot.eps"
    liftIO
      $ plotDots
          [ EPS path
          , Grid $ Just ["ytics", "mytics"]
          , Grid $ Just ["xtics", "mytics"]
          ]
      $ map (\(Point x y) -> (x, y)) result
    logInfo $ fromString $ "Plot saved to '" ++ path ++ "'"
  where f (Point x y) = 6 * x ** 2 + 5 * x * y
