BEGIN {
FS = "\""

char["@"] = "$50"
char[" "] = "$7F"
char["A"] = "$80"
char["B"] = "$81"
char["C"] = "$82"
char["D"] = "$83"
char["E"] = "$84"
char["F"] = "$85"
char["G"] = "$86"
char["H"] = "$87"
char["I"] = "$88"
char["J"] = "$89"
char["K"] = "$8A"
char["L"] = "$8B"
char["M"] = "$8C"
char["N"] = "$8D"
char["O"] = "$8E"
char["P"] = "$8F"
char["Q"] = "$90"
char["R"] = "$91"
char["S"] = "$92"
char["T"] = "$93"
char["U"] = "$94"
char["V"] = "$95"
char["W"] = "$96"
char["X"] = "$97"
char["Y"] = "$98"
char["Z"] = "$99"
char["("] = "$9A"
char[")"] = "$9B"
char[":"] = "$9C"
char[";"] = "$9D"
char["["] = "$9E"
char["]"] = "$9F"
char["a"] = "$A0"
char["b"] = "$A1"
char["c"] = "$A2"
char["d"] = "$A3"
char["e"] = "$A4"
char["f"] = "$A5"
char["g"] = "$A6"
char["h"] = "$A7"
char["i"] = "$A8"
char["j"] = "$A9"
char["k"] = "$AA"
char["l"] = "$AB"
char["m"] = "$AC"
char["n"] = "$AD"
char["o"] = "$AE"
char["p"] = "$AF"
char["q"] = "$B0"
char["r"] = "$B1"
char["s"] = "$B2"
char["t"] = "$B3"
char["u"] = "$B4"
char["v"] = "$B5"
char["w"] = "$B6"
char["x"] = "$B7"
char["y"] = "$B8"
char["z"] = "$B9"
char["'"] = "$E0"
char["-"] = "$E3"
char["?"] = "$E6"
char["!"] = "$E7"
char["."] = "$E8"
char["/"] = "$F3"
char[","] = "$F4"
char["0"] = "$F6"
char["1"] = "$F7"
char["2"] = "$F8"
char["3"] = "$F9"
char["4"] = "$FA"
char["5"] = "$FB"
char["6"] = "$FC"
char["7"] = "$FD"
char["8"] = "$FE"
char["9"] = "$FF"
}

# skip lines that actually do use ASCII in quotes
tolower($1) ~ /section/ ||
tolower($1) ~ /include/ || 
tolower($1) ~ /incbin/

!(tolower($1) ~ /section/ || tolower($1) ~ /include/ || tolower($1) ~ /incbin/) {
i = 1
ORS = ""

while (i <= NF) {
if (i % 2 == 1)
	print $(i)
else {
	f = $(i)
	while (f != "") {
		c = substr(f,1,1)
		f = substr(f,2,length(f) - 1)
		print char[c]
		if (length(f))
			print ","
	}
}

i = i + 1
}
print "\n"
ORS = "\n"
}
