DisableLCD::
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	ld b, a
	res B_IE_VBLANK, a
	ldh [rIE], a

.wait
	ldh a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .wait

	ldh a, [rLCDC]
	and ~LCDC_ON
	ldh [rLCDC], a
	ld a, b
	ldh [rIE], a
	ret

EnableLCD::
	ldh a, [rLCDC]
	set B_LCDC_ENABLE, a
	ldh [rLCDC], a
	ret
