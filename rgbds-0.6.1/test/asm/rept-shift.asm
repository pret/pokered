macro m
	PRINT "\1 "
	REPT 4
		SHIFT
	ENDR
	PRINTLN "\1s!"

	; Shifting a little more to check that over-shifting doesn't crash
	SHIFT
	SHIFT
	SHIFT 256
	PRINTLN "\1?"
endm

 m This, used, not, to, work
