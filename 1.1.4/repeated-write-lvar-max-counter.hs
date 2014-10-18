-- This program does two writes to an LVar that are resolved with
-- `max`.  Although `waitThresh` only returns the unit value `()`, the
-- fact that it returns at all means that the LVar has reached 4.

{-# LANGUAGE DataKinds #-}

-- We have to hide `put` here because Control.Lvish re-exports the
-- usual IVar operations, including `put`, and that also happens to be
-- the name of the write operation for MaxCounter.
import Control.LVish hiding (put) -- Generic scheduler; works with any lattice.
import Data.LVar.MaxCounter -- The particular lattice in question.

p :: Par Det s ()
p = do
  num <- newMaxCounter 0
  fork (put num 3)
  fork (put num 4)
  waitThresh num 4

main = print $ runPar p
