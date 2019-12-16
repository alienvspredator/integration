{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Run
  ( run
  )
where

import           Import

run :: RIO App ()
run = do
  options <- appOptions <$> ask
  logInfo "We're inside the application!"
  logInfo $ fromString $ show $ pointsString options
