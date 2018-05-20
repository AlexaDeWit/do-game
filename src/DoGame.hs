module DoGame
  (
  ) where

data Cmd a
  = Cmd

data Sub a
  = Sub

data Game m a
  = Game
    { initConst     :: (m, Cmd a)
    , updateFn      :: a -> m -> (m, Cmd a)
    , viewFn        :: m -> Collage a
    , subscriptions :: Sub a
    }
