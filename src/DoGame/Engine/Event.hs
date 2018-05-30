module DoGame.Engine.Event
  ( Event(..)
  ) where

import           Linear.V2             (V2)
import           DoGame.Input.Keyboard (Key(..))

data Event
  = MouseMove (V2 Int)
  | KeyDown Key
  | KeyUp Key
  | KeyPressed Key
  | WindowResize (V2 Int)
  deriving (Eq, Ord, Show)
