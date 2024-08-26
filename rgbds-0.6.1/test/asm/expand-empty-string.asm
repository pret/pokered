MACRO test
v equs "X"
X equs "" ; should not be expanded
\1
ENDM
	test v 0
