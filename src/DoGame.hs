module DoGame
  ( runGame
  ) where

import           FRP.Elerea.Simple
import           Control.Monad         (forever, void)
import           DoGame.Engine         (GameLifecycle(..), initConst, Game(..), Engine)

runGame :: Engine e => e -> GameLifecycle e m a -> IO ()
runGame e lifeCycle@GameLifecycle{ initConst } = forever $ void $ pure 5 where
  game = Game (fst initConst) lifeCycle True


