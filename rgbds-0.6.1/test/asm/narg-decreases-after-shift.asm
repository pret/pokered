MACRO testing
	db _NARG
	shift
	db _NARG
	shift
	db _NARG
	shift
	db _NARG
	shift
	db _NARG
ENDM

SECTION "Test output", ROM0[0]
	testing 1, 2, 3
