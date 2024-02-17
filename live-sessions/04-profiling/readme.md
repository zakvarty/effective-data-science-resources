# Week 4 Live Session - Code Profiling 

## Session Outline 

### Review of topics

- __Reproducibility__
	- Reproduction vs replication
	- Issues caused by stochastic methods (RNG, Monte Carlo methods)

- __Explainability__ 
	- Local vs Global, Conditional vs Marginal
	- Simple models catch people out (linear and logistic regression)
	- For black box models we can provide explainability with meta-models (LIME and friends)

- __Scalability__
	- Putting code into production often increases frequency of use or size of data
	- Covered basic of profiling with `{tictoc}` and `{profvis}`, see more examples in this session.
	- Link between profiling and debugging: print statements and more interactive tools. 


### Discussion of activities 

- Read LIME paper
- Understanding LIME tutorial
- Profile rolling_mean() and rolling_sd() to identify efficiencies that can be made.
- Bonus: Poisson Process simulation. Explore in detail during this session.

### Code Profiling Exercises 

- Example: reinventing `rowSums()`

1. Check documentation for `system.time()`
2. Compare `+` and `sum()`
3. Comaparing methods for Gaussian random variate generations
4. Comparing methods for simulated a marked Poisson Process.


## Old session - LIME Reading Group 

Previously this session was less interactive in terms of code profiling and half of the session was spent as a reading group fouced on the explainability methods, in particular LIME. 

While this has been removed from the session plan, I have left these materials in the subdirectory `reading-group-LIME/`. 