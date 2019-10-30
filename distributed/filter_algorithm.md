# Filter algorithm for n threads
There are *n-1* "waiting rooms" called "levels".

At each level
* At least one thread enters the level
* At least one blocked at that level if many try to enter
Only one thread makes it through and a thread at level *j* is also at level *j-1, ..., 0*.

Programmed with one array for the levels and one for the victims. See [wikipedia for algorithm](https://en.wikipedia.org/wiki/Peterson%27s_algorithm#Filter_algorithm:_Peterson's_algorithm_for_more_than_two_processes)

## Bounded waiting
`lock()` is divided into the "doorway interval" and "waiting interval".

* Doorway interval: finishes in known number of steps.
* Waiting interval: finishes in unknown number of steps.
