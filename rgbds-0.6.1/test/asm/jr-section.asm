SECTION "Test", ROM0

Label:
	jr Label
DIFF equ Label - @
	PRINTLN "{DIFF}"
