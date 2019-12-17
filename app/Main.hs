{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell   #-}
module Main
  ( main
  )
where

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
      <*> switch
        ( long "integrate"
       <> short 'i'
       <> help "Calculate integral" )
      <*> optional ( strOption
                    ( long "graphic"
                   <> short 'g'
                   <> help "Output graphic path"
                   <> metavar "FILEPATH.eps" ))
      <*> option auto
        ( short 'x'
       <> help "x initial value"
       <> metavar "NUMBER" )
      <*> option auto
        ( short 'y'
       <> help "y initial value"
       <> metavar "NUMBER" )
      <*> option auto
        ( long "step"
       <> short 's'
       <> help "Step value"
       <> metavar "NUMBER" )
      <*> option auto
        ( long "xf"
      <> help "xf value"
      <> metavar "NUMBER" )
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
