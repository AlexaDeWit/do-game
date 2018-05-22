module DoGame
  ( Game(..)
  , Sub (..)
  ) where

import           FRP.Elerea.Simple
import           Control.Monad     (forever, void)
import qualified DoGame.Cmd as Cmd

-- Event subscriptions for the DoGame runtime to listen to.
-- The DoGame runtime will also subscribe to events generated from its own internal Cmd system.
-- One need not set up runtime subs, as Cmds which set up eventing loops will set up their own subs
data Sub a
  = Sub a

data Scene e a = Scene

-- The configuration for a game, namely the functions needed to power the runtime for your game
data GameLifecycle e m a
  = GameLifecycle
    { initConst     :: (m, Cmd.Cmd m a)
    , updateFn      :: a -> m -> (m, Cmd.Cmd m a)
    , viewFn        :: m -> Scene e a
    , subscriptions :: Sub a
    }

data Game e m a
  = Game
    { model        :: m
    , lifeCycle    :: GameLifecycle e m a
    , isDirtyModel :: Bool
    }

runGame :: GameLifecycle e m a -> IO ()
runGame lifeCycle@GameLifecycle{ initConst } = forever $ void $ pure 5 where
  game = Game (fst initConst) lifeCycle True
