; PureRGBnote: MOVED: CHANGED: Used to be in main_menu.asm but moved for space. 
; this menu was changed a bit to have a NEXT and BACK button to navigate pages more easily.

CopyOptionsFromSRAM::
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, 1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	; by checking if a name has been saved we can know if a save file was created
	callfar CheckSaveFileExists
	jr nc, .doneLoad
	ld a, [sOptions2]
	ld [wOptions2], a
	ld a, [sSpriteOptions]
	ld [wSpriteOptions], a
	ld a, [sSpriteOptions3]
	ld [wSpriteOptions3], a
.doneLoad
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

OptionsNextBackText::
	db "NEXT  BACK@"

DisplayOptionMenu:
	hlcoord 0, 0
	ld b, 3
	ld c, 18
	call TextBoxBorder
	hlcoord 0, 5
	ld b, 3
	ld c, 18
	call TextBoxBorder
	hlcoord 0, 10
	ld b, 3
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, TextSpeedOptionText
	call PlaceString
	hlcoord 1, 6
	ld de, BattleAnimationOptionText
	call PlaceString
	hlcoord 1, 11
	ld de, BattleStyleOptionText
	call PlaceString
	hlcoord 2, 16
	ld de, OptionsNextBackText
	call PlaceString
	hlcoord 16, 16
	ld de, Option1PageText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld a, [wTopMenuItemY]
	and a
	jr nz, .pageTurn
	ld a, 3 ; Text speed coordinate
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wOptionsCancelCursorX], a
	call SetCursorPositionsFromOptions
	ld a, [wOptionsTextSpeedCursorX] ; text speed cursor X coordinate
	ld [wTopMenuItemX], a
	jr .doneLoad
.pageTurn
	ld a, [wOptionsCancelCursorX]
	and a
	jr nz, .cancelXValue
	ld a, 1
.cancelXValue
	ld [wOptionsCancelCursorX], a
	ld [wTopMenuItemX], a ; next page coordinate
	push af
	ld a, 16 ; next page coordinate
	ld [wTopMenuItemY], a
.setCursor
	call SetCursorPositionsFromOptions
	pop af
	cp 7
	jr nz, .doneLoad
	hlcoord 1, 16
	ld [hl], " "
.doneLoad
	ld a, $01
	ldh [hAutoBGTransferEnabled], a ; enable auto background transfer
	call Delay3
.loop
	call PlaceMenuCursor
	call SetOptionsFromCursorPositions
.getJoypadStateLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	and A_BUTTON | B_BUTTON | START | D_RIGHT | D_LEFT | D_UP | D_DOWN ; any key besides select pressed?
	jr z, .getJoypadStateLoop
	bit BIT_B_BUTTON, b
	jr nz, .exitMenu
	bit BIT_START, b
	jr nz, .exitMenu
	bit BIT_A_BUTTON, b
	jr z, .checkDirectionKeys
	ld a, [wTopMenuItemY]
;;;;;;;;;; PureRGBnote: ADDED: changes to the first page of options to compensate for the additional pages added.
	cp 16 ; is the cursor on the cancel row?
	jr z, .cancelMore
	jr .loop
.cancelMore
	ld a, SFX_PRESS_AB
	call PlaySound
	call ClearScreen
	ld a, [wTopMenuItemX]
	cp 7 ; is the cursor on 'BACK'?
	jr z, .back
	jp DisplayOptions2
.back
	jp DisplaySpriteOptions4
;;;;;;;;;;
.exitMenu
	ld a, SFX_PRESS_AB
	call PlaySound
	ret
.eraseOldMenuCursor
	ld [wTopMenuItemX], a
	call EraseMenuCursor
	jp .loop
.checkDirectionKeys
	ld a, [wTopMenuItemY]
	bit BIT_D_DOWN, b
	jr nz, .downPressed
	bit BIT_D_UP, b
	jr nz, .upPressed
	cp 8 ; cursor in Battle Animation section?
	jr z, .cursorInBattleAnimation
	cp 13 ; cursor in Battle Style section?
	jr z, .cursorInBattleStyle
	cp 16 ; cursor on Cancel?
	jr z, .cursorCancelRow
.cursorInTextSpeed
	bit BIT_D_LEFT, b
	jp nz, .pressedLeftInTextSpeed
	jp .pressedRightInTextSpeed
.downPressed
	cp 16
	ld b, -13
	ld hl, wOptionsTextSpeedCursorX
	jr z, .updateMenuVariables
	ld b, 5
	cp 3
	inc hl
	jr z, .updateMenuVariables
	cp 8
	inc hl
	jr z, .updateMenuVariables
	ld b, 3
	ld hl, wOptionsCancelCursorX
	jr .updateMenuVariables
.upPressed
	cp 8
	ld b, -5
	ld hl, wOptionsTextSpeedCursorX
	jr z, .updateMenuVariables
	cp 13
	inc hl
	jr z, .updateMenuVariables
	cp 16
	ld b, -3
	inc hl
	jr z, .updateMenuVariables
	ld b, 13
	ld hl, wOptionsCancelCursorX
.updateMenuVariables
	add b
	ld [wTopMenuItemY], a
	ld a, [hl]
	ld [wTopMenuItemX], a
	call PlaceUnfilledArrowMenuCursor
	jp .loop
.cursorInBattleAnimation
	ld a, [wOptionsBattleAnimCursorX] ; battle animation cursor X coordinate
	xor $0b ; toggle between 1 and 10
	ld [wOptionsBattleAnimCursorX], a
	jp .eraseOldMenuCursor
.cursorInBattleStyle
	ld a, [wOptionsBattleStyleCursorX] ; battle style cursor X coordinate
	xor $0b ; toggle between 1 and 10
	ld [wOptionsBattleStyleCursorX], a
	jp .eraseOldMenuCursor
;;;;;;;;;; PureRGBnote: ADDED: changes to the first page of options to compensate for the additional pages added.
.cursorCancelRow
	ld a, [wOptionsCancelCursorX] ; battle style cursor X coordinate
	xor 6 ; toggle between 1 and 7
	ld [wOptionsCancelCursorX], a
	jp .eraseOldMenuCursor
;;;;;;;;;;
.pressedLeftInTextSpeed
;;;;;;;;;; PureRGBnote: CHANGED: Instant text speed replaced medium speed, so we need to adjust the X positions of the cursors a bit.
	ld a, [wOptionsTextSpeedCursorX] ; text speed cursor X coordinate
	cp 1                             ; leftmost position
	jr z, .updateTextSpeedXCoord     ; don't do anything
	cp 9                             ; middle position
	jr nz, .fromSlowToMedium         ; not in middle, go from slow to medium
	sub 8                            ; subtract from accumulator to go from medium to fast
	jr .updateTextSpeedXCoord
.fromSlowToMedium
	sub 5
	jr .updateTextSpeedXCoord
.pressedRightInTextSpeed
	ld a, [wOptionsTextSpeedCursorX] ; text speed cursor X coordinate
	cp 14                            ; rightmost position
	jr z, .updateTextSpeedXCoord     ; don't do anything if rightmost
	cp 9                             ; middle position
	jr nz, .fromFastToMedium         ; not middle, go from leftmost to middle
	add 5                            ; add to accumulator to go from medium to slow
	jr .updateTextSpeedXCoord
.fromFastToMedium
	add 8
.updateTextSpeedXCoord
	ld [wOptionsTextSpeedCursorX], a ; text speed cursor X coordinate
	jp .eraseOldMenuCursor

TextSpeedOptionText:
	db   "TEXT SPEED"
	next " INSTANT FAST SLOW@"

;;;;;;;;;;

BattleAnimationOptionText:
	db   "BATTLE ANIMATION"
	next " ON       OFF@"

BattleStyleOptionText:
	db   "BATTLE STYLE"
	next " SHIFT    SET@"

OptionMenuCancelText:
	db "NEXT  BACK@"

; sets the options variable according to the current placement of the menu cursors in the options menu
SetOptionsFromCursorPositions:
	ld hl, TextSpeedOptionData
	ld a, [wOptionsTextSpeedCursorX] ; text speed cursor X coordinate
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr z, .textSpeedMatchFound
	inc hl
	jr .loop
.textSpeedMatchFound
	ld a, [hl]
	ld d, a
	ld a, [wOptionsBattleAnimCursorX] ; battle animation cursor X coordinate
	dec a
	jr z, .battleAnimationOn
.battleAnimationOff
	set 7, d
	jr .checkBattleStyle
.battleAnimationOn
	res 7, d
.checkBattleStyle
	ld a, [wOptionsBattleStyleCursorX] ; battle style cursor X coordinate
	dec a
	jr z, .battleStyleShift
.battleStyleSet
	set 6, d
	jr .storeOptions
.battleStyleShift
	res 6, d
.storeOptions
	ld a, d
	ld [wOptions], a
	ret

; reads the options variable and places menu cursors in the correct positions within the options menu
SetCursorPositionsFromOptions:
	ld hl, TextSpeedOptionData + 1
	ld a, [wOptions]
	ld c, a
	and TEXT_DELAY_BITS
	push bc
	ld de, 2
	call IsInArray
	pop bc
	dec hl
	ld a, [hl]
	ld [wOptionsTextSpeedCursorX], a ; text speed cursor X coordinate
	hlcoord 0, 3
	call .placeUnfilledRightArrow
	sla c
	ld a, 1 ; On
	jr nc, .storeBattleAnimationCursorX
	ld a, 10 ; Off
.storeBattleAnimationCursorX
	ld [wOptionsBattleAnimCursorX], a ; battle animation cursor X coordinate
	hlcoord 0, 8
	call .placeUnfilledRightArrow
	sla c
	ld a, 1
	jr nc, .storeBattleStyleCursorX
	ld a, 10
.storeBattleStyleCursorX
	ld [wOptionsBattleStyleCursorX], a ; battle style cursor X coordinate
	hlcoord 0, 13
	call .placeUnfilledRightArrow
; cursor in front of Cancel
	hlcoord 0, 16
	ld a, 1
.placeUnfilledRightArrow
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], "▷"
	ret

; PureRGBnote: CHANGED: x coordinates modified due to text changes for INSTANT speed.
; table that indicates how the 3 text speed options affect frame delays
; Format:
; 00: X coordinate of menu cursor
; 01: delay after printing a letter (in frames)
TextSpeedOptionData:
	db 14, TEXT_DELAY_SLOW
	db  9, TEXT_DELAY_MEDIUM
	db  1, TEXT_DELAY_FAST
	db  9, -1 ; end (default X coordinate)

Option1PageText:
	db "1/7@"