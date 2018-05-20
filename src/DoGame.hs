module DoGame
  ( Game(..)
  , Sub (..)
  ) where

-- Event subscriptions for the DoGame runtime to listen to.
-- The DoGame runtime will also subscribe to events generated from its own internal Cmd system.
-- One need not set up runtime subs, as Cmds which set up eventing loops will set up their own subs
data Sub a
  = Sub

-- The configuration for a game, namely the functions needed to power the runtime for your game
data Game m a
  = Game
    { initConst     :: (m, Cmd a)
    , updateFn      :: a -> m -> (m, Cmd a)
    , viewFn        :: m -> Collage a
    , subscriptions :: Sub a
    }
