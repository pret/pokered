_Start::
	cp GBC
	jr z, .gbc
	xor a
	jr .ok
.gbc
	ld a, FALSE
.ok
	ld [wGBC], a
	jp Init
