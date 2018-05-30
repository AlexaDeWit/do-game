module DoGame.Input.Mouse
  ( MouseButton(..)
  ) where

data MouseButton
  = LeftButton
  | MiddleButton
  | RightButton
  | X1Button
  | X2Button
  | UnknownButton
  | WheelUp
  | WheelDown
  deriving (Eq, Ord, Read, Show)
