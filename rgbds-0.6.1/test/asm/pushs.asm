SECTION "This is invalid", ROM0
	ds 10, 42
	PUSHS
	; We should be outside of section scope now
	db 69
