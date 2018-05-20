module Cmd
  ( Cmd(..)
  ) where

-- Commands that can be sent to the underlying DoGame runtime
data Cmd m a
  = ArbitraryIO (m -> IO a)
  | EnableTextEntry (String -> a)

