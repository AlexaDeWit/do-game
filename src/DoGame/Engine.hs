module DoGame.Engine
  ( Sub(..)
  , InputState(..)
  , Scene(..)
  , Game(..)
  , GameLifecycle(..)
  ) where

import           Linear.V2             (V2)
import           DoGame.Input.Keyboard (Key(..))
import qualified DoGame.Cmd as Cmd

data Sub a
  = Sub a

data InputState
  = InputState
    { keysDown      :: [Key]
    , mousePosition :: V2 Int
    }

data Game e m a
  = Game
    { model        :: m
    , lifeCycle    :: GameLifecycle e m a
    , isDirtyModel :: Bool
    , inputState   :: InputState
    }

data Scene e a = Scene

-- | The configuration for a game, namely the functions needed to power the runtime for your game
data GameLifecycle e m a
  = GameLifecycle
    { initConst     :: (m, Cmd.Cmd m a)
    , updateFn      :: a -> m -> (m, Cmd.Cmd m a)
    , viewFn        :: m -> Scene e a
    , subscriptions :: Sub a
    }
