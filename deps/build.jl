######################################################################
# downloads and makes SARSOP
######################################################################
if ispath("appl-sarisa")
	rm("appl-sarisa", recursive=true) 
end

# download and decompress
download("http://stanford.edu/~dressel/appl-sarisa.tar.gz", "appl-sarisa.tar.gz")
run(`gunzip appl-sarisa.tar.gz`)
run(`tar -xvf appl-sarisa.tar`)

# actually build all the variants
cd("appl-sarisa/src")
run(`bash makeall.sh`)
