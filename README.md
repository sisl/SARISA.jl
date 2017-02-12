# SARISA

This Julia package is a wrapper for my modified APPL code that solves rho-POMDPs.

## Installation
---------------
```
Pkg.clone("https://github.com/dressel/SARISA.jl")
Pkg.build("SARISA")
```

## Running the Code
-------------------
The code can be called as follows:
```
sarisa(pomdpx_file::String, timeout::Real=30, variant::String="MN"; filename="temp.policy")`
```

The `timeout` is expressed in seconds. There are three main `variant` strings:

* `MN`		Max-norm reward function.
* `GU`		Guess reward function.
* `TH_90`	Threshold reward function with cutoff at `||b||_inf = 0.9`.

There are two more allowed `variant` strings, but these use the unimproved lower bound. The only reason they are included is to show the value of using my improved lower bound.

* `MB`		Max-norm with bad (unimproved) lower bound.
* `TB_90`	Guess reward function with bad (unimproved) lower bound.

The resulting policy file is saved to `filename`.

## Build and Coverage Status
----------------------------

[![Build Status](https://travis-ci.org/dressel/SARISA.jl.svg?branch=master)](https://travis-ci.org/dressel/SARISA.jl)

[![Coverage Status](https://coveralls.io/repos/dressel/SARISA.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/dressel/SARISA.jl?branch=master)

[![codecov.io](http://codecov.io/github/dressel/SARISA.jl/coverage.svg?branch=master)](http://codecov.io/github/dressel/SARISA.jl?branch=master)
