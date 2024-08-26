MACRO print_all
	REPT _NARG
		PRINTLN "{d:_NARG}: \"\1\""
		SHIFT
	ENDR
ENDM

	print_all a, \
	          b \
	        , c

DEF EMPTY equs ""
	print_all a, \
	  {EMPTY} b \
	 {EMPTY}, c

	print_all a, \
	  /* . */ b \
	 /* . */, c
