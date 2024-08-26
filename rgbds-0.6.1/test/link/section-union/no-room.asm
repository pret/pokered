; NB: the error is that there is no room to place the unionized section in,
;     so RGBASM can't possibly error out.
IF !DEF(SECOND)
	SECTION "bloat", WRAMX[$d000], BANK[2]
		ds $fe0

	SECTION UNION "test", WRAMX, BANK[2]
		db
ELSE
	SECTION UNION "test", WRAMX, ALIGN[6]
		db
ENDC
