module SARISA

# package code goes here
export sarisa

# SARISA
"""
`sarisa(pomdpx_file, timeout, idx=0; filename="temp.policy")`

`idx` is the please variant index. If you leave it blank, rho-appl is used.
filename is the name of the saved policy file. The default is temp.policy.
"""
function sarisa(pomdpx_file, timeout, idx::Int; filename="temp.policy")
	if idx == 0
		sarisa_path = Pkg.dir("SARISA", "deps", "rho-appl", "src", "pomdpsol")
	else
		sarisa_path = Pkg.dir("SARISA", "deps", "rho-appl$(idx)", "src", "pomdpsol")
	end
	run(`$sarisa_path $(pomdpx_file) --output $(filename) --timeout $timeout`)
end
function sarisa(pomdpx_file, timeout, variant::String="MN"; filename="temp.policy")

	exec_name = "pomdpsol_$(variant)"
	sarisa_path = Pkg.dir("SARISA", "deps", "appl-sarisa", "src", exec_name)

	run(`$sarisa_path $(pomdpx_file) --output $(filename) --timeout $timeout`)
end

end # module
