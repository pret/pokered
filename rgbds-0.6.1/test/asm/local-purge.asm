; At some point, the name of the local label was passed *unexpanded* to the
; function doing the removal. Ensure that this is fixed.

SECTION "Test", ROM0[0]
Glob:
.loc
	PURGE .loc
	PRINTLN "{.loc}" ; This should fail because the label doesn't exist anymore
