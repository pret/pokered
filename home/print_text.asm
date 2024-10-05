; This function is used to wait a short period after printing a letter to the
; screen unless the player presses the A/B button or the delay is turned off
; through the [wStatusFlags5] or [wLetterPrintingDelayFlags] flags.
PrintLetterDelay::
	ld a, [wStatusFlags5]
	bit BIT_NO_TEXT_DELAY, a
	ret nz
	ld a, [wLetterPrintingDelayFlags]
	bit BIT_TEXT_DELAY, a
	ret z
	push hl
	push de
	push bc
	ld a, [wLetterPrintingDelayFlags]
	bit BIT_FAST_TEXT_DELAY, a
	jr z, .waitOneFrame
	ld a, [wOptions]
	and TEXT_DELAY_BITS
	ldh [hFrameCounter], a
	jr .checkButtons
.waitOneFrame
	ld a, 1
	ldh [hFrameCounter], a
.checkButtons
	call Joypad
	ldh a, [hJoyHeld]
.checkAButton
	bit BIT_A_BUTTON, a
	jr nz, .endWait
.checkBButton
	bit BIT_B_BUTTON, a
	jr z, .buttonsNotPressed
.endWait
	rst _DelayFrame
	jr .done
.buttonsNotPressed ; if neither A nor B is pressed
	ldh a, [hFrameCounter]
	and a
	jr nz, .checkButtons
.done
	pop bc
	pop de
	pop hl
	ret
