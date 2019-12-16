{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell   #-}
module Main
  ( main
  )
where

import           ApplicativeOption (multiString)
import           Import
import           Options.Applicative.Simple
import qualified Paths_lab5
import           RIO.Process
import           Run

main :: IO ()
main = do
  (options, ()) <- simpleOptions
    $(simpleVersion Paths_lab5.version)
    "Calculation of integral or differential"
    "If option 'integrate' is not specified, the utilite calculates defferential. Otherwise integral"
    (Options
      <$> switch
        ( long "verbose"
       <> short 'v'
       <> help "Verbose output?" )
      <*> multiString
        ( long "points"
       <> short 'p'
       <> metavar "x,y..."
       <> help "List of the points" )
      <*> switch
        ( long "integrate"
       <> short 'i'
       <> help "Calculate integral" )
      )
    empty
  lo <- logOptionsHandle stderr (optionsVerbose options)
  pc <- mkDefaultProcessContext
  withLogFunc lo $ \lf ->
    let app = App { appLogFunc        = lf
                  , appProcessContext = pc
                  , appOptions        = options
                  }
    in  runRIO app run
