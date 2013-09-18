# Some toy `MVar`, `IVar`, and `LVar` programs

  * `data-race-example.hs`: An example of what we _don't_ want.  Two
    threads race to write different values to an `MVar`, resulting in
    a program that might print either evalue.
	
  * `ivar-example.hs`: An example of what we _do_ want.  Two threads
    race to write different values to an `IVar`, raising a `multiple
    put` error.
	
  * `ivar-multiple-write.hs`: An example of the limitations of
    `IVar`s.  Two threads race to write the same value to an `IVar`,
    raising a `multiple put` error.
	
  * `lvar-multiple-write.hs`: Two threads race to write the same value
     to an `LVar`, resulting in a program that deterministically
     prints that one value.
