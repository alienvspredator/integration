{-# LANGUAGE NoImplicitPrelude #-}
module Types where

import           RIO
import           RIO.Process

-- | Command line arguments
data Options = Options
  { optionsVerbose  :: !Bool
  , pointsString    :: ![String]
  , integrateOption :: !Bool
  }

data App = App
  { appLogFunc        :: !LogFunc
  , appProcessContext :: !ProcessContext
  , appOptions        :: !Options
  -- Add other app-specific configuration information here
  }

instance HasLogFunc App where
  logFuncL = lens appLogFunc (\x y -> x { appLogFunc = y })
instance HasProcessContext App where
  processContextL =
    lens appProcessContext (\x y -> x { appProcessContext = y })

data Point = Point Double Double

instance Show Point where
  show (Point x y) = "(x: " ++ show x ++ ", y: " ++ show y ++ ")"
