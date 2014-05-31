_Joypad::
	ld a, [hJoyInput]
	cp A_BUTTON + B_BUTTON + SELECT + START ; soft reset
	jp z, TrySoftReset
	ld b, a
	ld a, [hJoyHeldLast]
	ld e, a
	xor b
	ld d, a
	and e
	ld [hJoyReleased], a
	ld a, d
	and b
	ld [hJoyPressed], a
	ld a, b
	ld [hJoyHeldLast], a
	ld a, [wd730]
	bit 5, a
	jr nz, DiscardButtonPresses
	ld a, [hJoyHeldLast]
	ld [hJoyHeld], a
	ld a, [wJoyIgnore]
	and a
	ret z
	cpl
	ld b, a
	ld a, [hJoyHeld]
	and b
	ld [hJoyHeld], a
	ld a, [hJoyPressed]
	and b
	ld [hJoyPressed], a
	ret

DiscardButtonPresses:
	xor a
	ld [hJoyHeld], a
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ret

TrySoftReset:
	call DelayFrame
	; reset joypad (to make sure the
	; player is really trying to reset)
	ld a, $30
	ld [rJOYP], a
	ld hl, hSoftReset
	dec [hl]
	jp z, SoftReset
	jp Joypad
