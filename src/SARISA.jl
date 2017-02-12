module SARISA

export sarisa

"""
`sarisa(pomdpx_file::String, timeout::Real=30, variant::String="MN"; filename="temp.policy")`

The `timeout` is expressed in seconds. There are three main `variant` strings:

* `MN`		Max-norm reward function.
* `GU`		Guess reward function.
* `TH_90`	Threshold reward function with cutoff at `||b||_inf = 0.9`.

There are two more allowed `variant` strings, but these use the unimproved lower bound. The only reason they are included is to show the value of using my improved lower bound.

* `MB`		Max-norm with bad (unimproved) lower bound.
* `TB_90`	Guess reward function with bad (unimproved) lower bound.

The resulting policy file is saved to `filename`.
"""
function sarisa(pomdpx_file::String, timeout::Real=30, variant::String="MN"; filename="temp.policy")

	exec_name = "pomdpsol_$(variant)"
	sarisa_path = Pkg.dir("SARISA", "deps", "appl-sarisa", "src", exec_name)

	run(`$sarisa_path $(pomdpx_file) --output $(filename) --timeout $timeout`)
end

end # module
