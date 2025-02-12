_Start::
	cp CGB
	jr z, .gbc
	xor a
	jr .ok
.gbc
	ld a, 1 ; shinpokerednote: gbcnote: need to indicate we're on GBC
.ok
	ldh [hGBC], a
	jp Init
