m = $8000_0000
assert m == 1 << 31
assert m == -(1 << 31)
assert m == (-2)**31

	println "{m}"
	println "({12d:m})"
	println "({-12d:m})"
