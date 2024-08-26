MACRO printargs
	REPT _NARG
		PRINTLN \1
		SHIFT
	ENDR
ENDM

	printargs mul(3.0, 4.0)

MACRO printlit
	REPT _NARG
		PRINTLN "\1"
		SHIFT
	ENDR
ENDM

	printlit a(b,c\,d), ((e,f),g), ))h, i\,j,
	printlit \(k, l), (m:\)n,o(p)q), (r,s)t
	printlit "))u,v(", ("w,x","y,z"),
