
SECTION "floating purging", ROM0

Floating:
	db Floating
	PURGE Floating ; This used to cause a use-after-free
	; To increase the chances of the data being re-allocated, it's not last

SECTION "fixed purging", ROM0[0]

Fixed:
	db Fixed
	PURGE Fixed ; Can work, it's a constant
