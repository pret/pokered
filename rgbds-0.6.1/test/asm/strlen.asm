SECTION "sec", ROM0

MACRO xstrlen
	PRINTLN STRLEN(\1)
ENDM

	xstrlen "ABC"
	xstrlen "カタカナ"
