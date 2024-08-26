IF !DEF(SECOND)
OFS = 42
ELSE
OFS = 69
ENDC

BASE = $C0DE

SECTION UNION "assertions in unions", WRAM0
IF DEF(SECOND)
	assert @ != BASE, "Force failing the build" ; Force failure in RGBLINK, though
ENDC
	ds OFS
	assert @ == BASE + OFS, "This assertion should not trigger"

; Only make RGBASM aware of the section's location *after* it sees the assertion
; This forces it to pass it to RGBLINK
SECTION UNION "assertions in unions", WRAM0[BASE]
