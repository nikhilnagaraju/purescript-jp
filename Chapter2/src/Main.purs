module Main where

import Control.Monad.Eff.Console (logShow)

--bower install math & Import Math pi
import Math (pi)
import Prelude

areaCircle :: Number -> Number
areaCircle r = pi * r * r
main = logShow  (areaCircle 4.0)
