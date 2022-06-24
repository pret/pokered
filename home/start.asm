_Start::
	cp GBC
	jr z, .gbc
	xor a
	jr .ok
.gbc
	ld a, 1
.ok
	ldh [hGBC], a
	jp Init
