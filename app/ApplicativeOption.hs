module ApplicativeOption
  ( multiString
  )
where

import           Options.Applicative.Simple

multiString :: Mod OptionFields [String] -> Parser [String]
multiString desc = concat <$> some single
  where single = option (words <$> str) desc
