DisableLCD::
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	ld b, a
	res rIE_VBLANK, a
	ldh [rIE], a

.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr nz, .wait

	ldh a, [rLCDC]
	and ~(1 << rLCDC_ENABLE)
	ldh [rLCDC], a
	ld a, b
	ldh [rIE], a
	ret

EnableLCD::
	ldh a, [rLCDC]
	set rLCDC_ENABLE, a
	ldh [rLCDC], a
	ret
