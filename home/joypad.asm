ReadJoypad::
; Poll joypad input.
; Unlike the hardware register, button
; presses are indicated by a set bit.

	ld a, 1 << 5 ; select direction keys
	ld c, 0

	ld [rJOYP], a
	REPT 6
	ld a, [rJOYP]
	ENDR
	cpl
	and %1111
	swap a
	ld b, a

	ld a, 1 << 4 ; select button keys
	ld [rJOYP], a
	REPT 10
	ld a, [rJOYP]
	ENDR
	cpl
	and %1111
	or b

	ld [hJoyInput], a

	ld a, 1 << 4 + 1 << 5 ; deselect keys
	ld [rJOYP], a
	ret

Joypad::
; Update the joypad state variables:
; [hJoyReleased]  keys released since last time
; [hJoyPressed]   keys pressed since last time
; [hJoyHeld] currently pressed keys
	homecall _Joypad
	ret
