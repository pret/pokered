SECTION UNION "test", WRAM0
Base:
	ds $1000

SECTION UNION "test", WRAM0,ALIGN[8]
	ds 42
Plus42:

SECTION UNION "test", WRAM0,ALIGN[4]

SECTION UNION "test", WRAM0[$C000]
; Since the section's base address is known, the labels are constant now
	ds $1000 ; This shouldn't overflow
End:

SECTION UNION "test", WRAM0,ALIGN[9]


MACRO check_label
EXPECTED equ \2
	IF \1 == EXPECTED
RESULT equs "OK!"
	ELSE
RESULT equs "expected {EXPECTED}"
	ENDC
	PURGE EXPECTED

	PRINTLN "\1 is at {\1} ({RESULT})"
	PURGE RESULT
ENDM

	check_label Base, $C000
	check_label Plus42, $C000 + 42
	check_label End, $D000


SECTION "test", WRAM0 ; Don't allow creating a section that's not a union!
