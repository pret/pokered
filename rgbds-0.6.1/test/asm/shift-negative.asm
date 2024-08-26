MACRO reverse
	for i, _NARG
i = _NARG - i - 1
		shift i
		println \1
		shift -i
	endr
ENDM

	reverse $1, $2, $3

MACRO m
	shift 2
	shift -3
	shift 1
	shift 1
	shift -1
	shift -1
ENDM
	m one
