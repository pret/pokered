MACRO print_all
	REPT _NARG
		PRINT " \1"
		SHIFT
	ENDR
	PRINTLN
ENDM

MACRO print_some
	PRINT "\1"
	SHIFT 5
	PRINT "\2\6\9"
	SHIFT 17
	SHIFT
	PRINT "\3\9"
ENDM

MACRO bad
	shift _NARG - 1
	PRINTLN \1
ENDM

MACRO bad_rept
	REPT _NARG - 2
		REPT 1
			shift
		ENDR
	ENDR
	PRINTLN \1
ENDM

	print_all This test, probably, passes\,, but who knows, ?

	print_some R,e,d,n,e,x,G,a,m,e,B,o,y,D,e,v,e,l,o,p,e,m,e,n,t,S,y,s,t,e,m,\n

	bad 1, 3, 5, 1, 2, 4, 5, 6, 3, 3, 3, 6, 2, 1, "H"
	bad "E"
	bad 0, 1, 2, 3, "L"
	bad 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "L"
	bad as, asd, asdf, asdfg, asdgh, "O"

	bad_rept "B", 0, " ", 11
	bad_rept "U", 1, "W", 10
	bad_rept "G", 2, "O", 9
	bad_rept "G", 3, "R", 8
	bad_rept "E", 4, "L", 7
	bad_rept "D", 5, "D", 6
