_Start::
	cp GBC
	jr z, .gbc
	xor a
	jr .ok
.gbc
	ld a, 1 ; shinpokerednote: gbcnote: need to indicate we're on GBC
.ok
	ldh [hGBC], a
	jp Init
