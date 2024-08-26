SECTION "fixed", ROM0[420]
	PRINTLN "{@}"
	ds 69
	PRINTLN "{@}"

; FIXME: expected to land at $0000
SECTION "floating", ROM0
	db @
	ds 42
	db @
