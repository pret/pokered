DisableLCD::
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	ld b, a
	res 0, a
	ldh [rIE], a

.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr nz, .wait

	ldh a, [rLCDC]
	and ~rLCDC_ENABLE_MASK
	ldh [rLCDC], a
	ld a, b
	ldh [rIE], a
	ret

EnableLCD::
	ldh a, [rLCDC]
	set rLCDC_ENABLE, a
	ldh [rLCDC], a
	ret
