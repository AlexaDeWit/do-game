module DoGame.Engine
  ( Sub(..)
  , InputState(..)
  , Scene(..)
  , Game(..)
  , GameLifecycle(..)
  , Engine(..)
  ) where

import           Linear.V2             (V2)
import           DoGame.Input.Keyboard (Key(..))
import qualified DoGame.Cmd as Cmd

class Engine e where
  -- | Renders the current scene to the window bound to this engine
  render      :: e -> Scene e a -> IO ()
  -- | Ticks the engine forward, managing events and render cycles
  tick        :: e -> IO (Maybe e)
  -- | Performs any necessary cleanup of resources the engine is holding
  cleanup     :: e -> IO ()
  -- | Returns the size of the window as a pair of x, y coordinates
  windowSize  :: e -> IO (V2 Int)
  -- | Gets the amount of time the engine has been live for, in seconds
  runningTime :: e -> IO Double
  -- TODO: Implement signal management here.

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

