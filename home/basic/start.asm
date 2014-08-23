Start::
	cp GBC
	jr z, .gbc
	xor a
	jr .ok
.gbc
	ld a, 0
.ok
	ld [wGBC], a
	jp Init