-- This program writes the same thing twice and deterministically
-- prints `4` instead of raising an error.

{-# LANGUAGE DataKinds #-}

import Control.LVish  -- Generic scheduler; works with any lattice.
import Data.LVar.IVar -- The particular lattice in question.

p :: Par Det s Int
p = do
  num <- new
  fork $ do put num 4
  fork $ do put num 4
  v <- get num
  return v

main = do
  putStr $ show $ runPar $ p