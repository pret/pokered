; PureRGBnote: ADDED: 
; A new "next page" function for text scripts that has more functionality
; inputs: (required)
;   wMenuWatchedKeys - which buttons will jump out of the text script. A_BUTTON is an invalid option, it always proceeds the text script.
;   wMenuCursorLocation - the tilemap coordinate where the down arrow cursor should flash at.

TextCommandPromptMultiButton::
	call LoadDownArrowCoord
	ld [hl], "▼"
	call Delay3
	call ManualTextScrollMultiButton
	call LoadDownArrowCoord
	ld [hl], " "
	ld a, d
	and a
	jr nz, .interrupted ; exit if they pressed one of the specified watched buttons
	; otherwise they pressed A, so clear the text box and continue the script
	push de
	hlcoord 1, 10
	lb bc, 6, 18
	call ClearScreenArea
	ld c, 20
	rst _DelayFrames
	pop de
	ret
.interrupted
	; if we're in a TEXT_CALL this will indicate higher up that the text printing was interrupted by a special button press
	SetFlag FLAG_INTERRUPTED_TEXT
	ret

; waits for A being pressed or specific watched buttons, if A was pressed plays a sound, otherwise just exits
ManualTextScrollMultiButton::
	call WaitForTextScrollSpecificButtonsPress
	ld a, d
	bit BIT_A_BUTTON, a
	jr nz, .continueText
	ld d, 1
	ret
.continueText
	ld a, SFX_PRESS_AB
	rst _PlaySound
	ld d, 0
	ret

; waits for any button at all to be pressed while blinking the text scroll cursor
WaitForTextScrollSpecificButtonsPress::
	ldh a, [hDownArrowBlinkCount1]
	push af
	ldh a, [hDownArrowBlinkCount2]
	push af
	xor a
	ldh [hDownArrowBlinkCount1], a
	ld a, $6
	ldh [hDownArrowBlinkCount2], a
.loop
	push hl
	ld a, [wTownMapSpriteBlinkingEnabled]
	and a
	jr z, .skipAnimation
	callfar TownMapSpriteBlinkingAnimation
.skipAnimation
	call LoadDownArrowCoord
	call HandleDownArrowBlinkTiming
	pop hl
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld d, a
	ld a, [wMenuWatchedKeys]
	or A_BUTTON
	and d 
	jr z, .loop
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a
	ret

; we can load it to different spots based on wMenuCursorLocation
LoadDownArrowCoord::
	hl_deref_reverse wMenuCursorLocation
	ret
