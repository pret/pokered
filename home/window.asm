HandleMenuInput::
	xor a
	ld [wPartyMenuAnimMonEnabled], a

HandleMenuInput_::
	ldh a, [hDownArrowBlinkCount1]
	push af
	ldh a, [hDownArrowBlinkCount2]
	push af ; save existing values on stack
	xor a
	ldh [hDownArrowBlinkCount1], a ; blinking down arrow timing value 1
	ld a, 6
	ldh [hDownArrowBlinkCount2], a ; blinking down arrow timing value 2
.loop1
	xor a
	ld [wAnimCounter], a ; counter for pokemon shaking animation
	call PlaceMenuCursor
	call Delay3
.loop2
	push hl
	ld a, [wPartyMenuAnimMonEnabled]
	and a ; is it a pokemon selection menu?
	jr z, .getJoypadState
	farcall AnimatePartyMon ; shake mini sprite of selected pokemon
.getJoypadState
	pop hl
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and a ; was a key pressed?
	jr nz, .keyPressed
	push hl
	hlcoord 18, 11 ; coordinates of blinking down arrow in some menus
	call HandleDownArrowBlinkTiming ; blink down arrow (if any)
	pop hl
	ld a, [wMenuJoypadPollCount]
	dec a
	jr z, .giveUpWaiting
	jr .loop2
.giveUpWaiting
; if a key wasn't pressed within the specified number of checks
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ret
.keyPressed
	xor a
	ld [wCheckFor180DegreeTurn], a
	ldh a, [hJoy5]
	ld b, a
	bit B_PAD_UP, a
	jr z, .checkIfDownPressed
.upPressed
	ld a, [wCurrentMenuItem] ; selected menu item
	and a ; already at the top of the menu?
	jr z, .alreadyAtTop
.notAtTop
	dec a
	ld [wCurrentMenuItem], a ; move selected menu item up one space
	jr .checkOtherKeys
.alreadyAtTop
	ld a, [wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z, .noWrappingAround
	ld a, [wMaxMenuItem]
	ld [wCurrentMenuItem], a ; wrap to the bottom of the menu
	jr .checkOtherKeys
.checkIfDownPressed
	bit B_PAD_DOWN, a
	jr z, .checkOtherKeys
.downPressed
	ld a, [wCurrentMenuItem]
	inc a
	ld c, a
	ld a, [wMaxMenuItem]
	cp c
	jr nc, .notAtBottom
.alreadyAtBottom
	ld a, [wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z, .noWrappingAround
	ld c, $00 ; wrap from bottom to top
.notAtBottom
	ld a, c
	ld [wCurrentMenuItem], a
.checkOtherKeys
	ld a, [wMenuWatchedKeys]
	and b ; does the menu care about any of the pressed keys?
	jp z, .loop1
.checkIfAButtonOrBButtonPressed
	ldh a, [hJoy5]
	and PAD_A | PAD_B
	jr z, .skipPlayingSound
.AButtonOrBButtonPressed
	push hl
	ld hl, wMiscFlags
	bit BIT_NO_MENU_BUTTON_SOUND, [hl]
	pop hl
	jr nz, .skipPlayingSound
	ld a, SFX_PRESS_AB
	call PlaySound
.skipPlayingSound
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ldh a, [hJoy5]
	ret
.noWrappingAround
	ld a, [wMenuWatchMovingOutOfBounds]
	and a ; should we return if the user tried to go past the top or bottom?
	jr z, .checkOtherKeys
	jr .checkIfAButtonOrBButtonPressed

PlaceMenuCursor::
	ld a, [wTopMenuItemY]
	and a ; is the y coordinate 0?
	jr z, .adjustForXCoord
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
.topMenuItemLoop
	add hl, bc
	dec a
	jr nz, .topMenuItemLoop
.adjustForXCoord
	ld a, [wTopMenuItemX]
	ld b, 0
	ld c, a
	add hl, bc
	push hl
	ld a, [wLastMenuItem]
	and a ; was the previous menu id 0?
	jr z, .checkForArrow1
	push af
	ldh a, [hUILayoutFlags]
	bit BIT_DOUBLE_SPACED_MENU, a
	jr z, .doubleSpaced1
	ld bc, SCREEN_WIDTH
	jr .getOldMenuItemScreenPosition
.doubleSpaced1
	ld bc, SCREEN_WIDTH * 2
.getOldMenuItemScreenPosition
	pop af
.oldMenuItemLoop
	add hl, bc
	dec a
	jr nz, .oldMenuItemLoop
.checkForArrow1
	ld a, [hl]
	cp "▶" ; was an arrow next to the previously selected menu item?
	jr nz, .skipClearingArrow
.clearArrow
	ld a, [wTileBehindCursor]
	ld [hl], a
.skipClearingArrow
	pop hl
	ld a, [wCurrentMenuItem]
	and a
	jr z, .checkForArrow2
	push af
	ldh a, [hUILayoutFlags]
	bit BIT_DOUBLE_SPACED_MENU, a
	jr z, .doubleSpaced2
	ld bc, SCREEN_WIDTH
	jr .getCurrentMenuItemScreenPosition
.doubleSpaced2
	ld bc, SCREEN_WIDTH * 2
.getCurrentMenuItemScreenPosition
	pop af
.currentMenuItemLoop
	add hl, bc
	dec a
	jr nz, .currentMenuItemLoop
.checkForArrow2
	ld a, [hl]
	cp "▶" ; has the right arrow already been placed?
	jr z, .skipSavingTile ; if so, don't lose the saved tile
	ld [wTileBehindCursor], a ; save tile before overwriting with right arrow
.skipSavingTile
	ld a, "▶" ; place right arrow
	ld [hl], a
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	ld a, [wCurrentMenuItem]
	ld [wLastMenuItem], a
	ret

; This is used to mark a menu cursor other than the one currently being
; manipulated. In the case of submenus, this is used to show the location of
; the menu cursor in the parent menu. In the case of swapping items in list,
; this is used to mark the item that was first chosen to be swapped.
PlaceUnfilledArrowMenuCursor::
	ld b, a
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld [hl], "▷"
	ld a, b
	ret

; Replaces the menu cursor with a blank space.
EraseMenuCursor::
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld [hl], " "
	ret

; This toggles a blinking down arrow at hl on and off after a delay has passed.
; This is often called even when no blinking is occurring.
; The reason is that most functions that call this initialize hDownArrowBlinkCount1 to 0.
; The effect is that if the tile at hl is initialized with a down arrow,
; this function will toggle that down arrow on and off, but if the tile isn't
; initialized with a down arrow, this function does nothing.
; That allows this to be called without worrying about if a down arrow should
; be blinking.
HandleDownArrowBlinkTiming::
	ld a, [hl]
	ld b, a
	ld a, "▼"
	cp b
	jr nz, .downArrowOff
.downArrowOn
	ldh a, [hDownArrowBlinkCount1]
	dec a
	ldh [hDownArrowBlinkCount1], a
	ret nz
	ldh a, [hDownArrowBlinkCount2]
	dec a
	ldh [hDownArrowBlinkCount2], a
	ret nz
	ld a, " "
	ld [hl], a
	ld a, $ff
	ldh [hDownArrowBlinkCount1], a
	ld a, $06
	ldh [hDownArrowBlinkCount2], a
	ret
.downArrowOff
	ldh a, [hDownArrowBlinkCount1]
	and a
	ret z
	dec a
	ldh [hDownArrowBlinkCount1], a
	ret nz
	dec a
	ldh [hDownArrowBlinkCount1], a
	ldh a, [hDownArrowBlinkCount2]
	dec a
	ldh [hDownArrowBlinkCount2], a
	ret nz
	ld a, $06
	ldh [hDownArrowBlinkCount2], a
	ld a, "▼"
	ld [hl], a
	ret

; The following code either enables or disables the automatic drawing of
; text boxes by DisplayTextID. Both functions cause DisplayTextID to wait
; for a button press after displaying text (unless [wEnteringCableClub] is set).

EnableAutoTextBoxDrawing::
	xor a
	jr AutoTextBoxDrawingCommon

DisableAutoTextBoxDrawing::
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX

AutoTextBoxDrawingCommon::
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a ; make DisplayTextID wait for button press
	ret

PrintText::
; Print text hl at (1, 14).
	push hl
	ld a, MESSAGE_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call UpdateSprites
	call Delay3
	pop hl
PrintText_NoCreatingTextBox::
	bccoord 1, 14
	jp TextCommandProcessor
