ReadJoypad::
; Poll joypad input.
; Unlike the hardware register, button
; presses are indicated by a set bit.

	ld a, JOYP_GET_CTRL_PAD
	ld c, 0

	ldh [rJOYP], a
REPT 6
	ldh a, [rJOYP]
ENDR
	cpl
	and JOYP_INPUTS
	swap a
	ld b, a

	ld a, JOYP_GET_BUTTONS
	ldh [rJOYP], a
REPT 10
	ldh a, [rJOYP]
ENDR
	cpl
	and JOYP_INPUTS
	or b

	ldh [hJoyInput], a

	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	ret

Joypad::
; Update the joypad state variables:
; [hJoyReleased]  keys released since last time
; [hJoyPressed]   keys pressed since last time
; [hJoyHeld] currently pressed keys
	homecall _Joypad
	ret
