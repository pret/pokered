MACRO printargs
	PRINTLN "first = \<1>"
	FOR I, 2, _NARG
		PRINTLN "next = \<{d:I}>"
	ENDR
	PRINTLN "last = \<{d:_NARG}>"
ENDM

	printargs A, B, C, D

MACRO mac
	println \<2__> + \<1_2> + \<\1>
x = 2
	println \<{d:x}> + \<1_{d:x}> + \<\<\<13>>>
y equs "NARG"
	println \<x> + \<1_{d:x}_> + \<\<\<_{y}>>>
ENDM

	mac 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 1
