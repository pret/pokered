MACRO compare
	print "\3: "
	if _NARG == 4
		def v1 = \3(\4q\1, \1)
		def v2 = \3(\4q\2, \2)
	elif _NARG == 5
		def v1 = \3(\4q\1, \5q\1, \1)
		def v2 = \3(\4q\2, \5q\2, \2)
	endc
	opt Q\1
	print "{.4f:v1} == "
	opt Q\2
	println "{.4f:v2}"
ENDM

	compare  8, 16, mul, 6.0, 7.0
	compare 12, 24, div, 115.625, 9.25
	compare  7, 14, pow, 3.5, 5.5

	compare  4,  8, sin, 0.25
	compare  5,  9, cos, 0.75
	compare  6, 10, asin, 1.0
	compare  7, 11, acos, 0.0

	compare  3,  6, round, 1.75
	compare 10, 20, ceil, 123.4
	compare 13, 17, floor, 567.8
