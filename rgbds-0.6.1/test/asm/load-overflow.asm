SECTION "Overflow", ROM0
	ds $6000
LOAD "oops",WRAM0
	; We might get an error for "oops", but it can also make sense to no-op the directive
	ds $2001
	; We shouldn't get any more errors for "Overflow" nor "oops"
	db
ENDL

SECTION "Moar overflow", ROM0
	ds $6001
LOAD "hmm", WRAM0
	ds $2000
	; Since the `ds` overflows "Moar overflow", it could be no-op'd, making this `db` not error
	db
ENDL

SECTION "Not overflowing", ROM0
	ds $5FFF
LOAD "lol", WRAM0
	ds $2000
	db
	; Since the LOAD block is overflowed, this may be no-op'd, not affecting the "parent"
ENDL
	dw ; This, however...
