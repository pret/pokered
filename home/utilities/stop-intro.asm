; this is used to check if the player wants to interrupt the opening sequence at several points
; XXX is this used anywhere else?
; INPUT:
; c = number of frames to wait
; sets carry if Up+Select+B, Start, or A is pressed within c frames
; unsets carry otherwise
CheckForUserInterruption:: ; 12f8 (0:12f8)
	call DelayFrame
	push bc
	call JoypadLowSensitivity
	pop bc
	ld a,[hJoyHeld] ; currently pressed buttons
	cp a,%01000110 ; Up, Select button, B button
	jr z,.setCarry ; if all three keys are pressed
	ld a,[$ffb5] ; either newly pressed buttons or currently pressed buttons at low sampling rate
	and a,%00001001 ; Start button, A button
	jr nz,.setCarry ; if either key is pressed
	dec c
	jr nz,CheckForUserInterruption
.unsetCarry
	and a
	ret
.setCarry
	scf
	ret
    
