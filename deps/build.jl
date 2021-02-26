######################################################################
# downloads and makes SARSOP
######################################################################
if ispath("appl-sarisa")
	rm("appl-sarisa", recursive=true) 
end
if ispath("appl-sarisa.tar.gz")
	rm("appl-sarisa.tar.gz", recursive=true) 
end
if ispath("appl-sarisa.tar")
	rm("appl-sarisa.tar", recursive=true) 
end

# download and decompress
download("https://web.stanford.edu/group/sisl/resources/appl-sarisa.tar.gz", "appl-sarisa.tar.gz")
run(`gunzip appl-sarisa.tar.gz`)
run(`tar -xvf appl-sarisa.tar`)

# actually build all the variants
cd("appl-sarisa/src")
run(`bash makeall.sh`)
