_Start::
	cp BOOTUP_A_CGB
	jr z, .cgb
	xor a
	jr .ok
.cgb
	ld a, FALSE
.ok
	ld [wOnCGB], a
	jp Init
