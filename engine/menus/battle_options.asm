DEF PAGE3_OPTION1_LEFT_XPOS EQU 11
DEF PAGE3_OPTION1_RIGHT_XPOS EQU 14
DEF PAGE3_OPTION2_LEFT_XPOS EQU 11
DEF PAGE3_OPTION2_RIGHT_XPOS EQU 14
DEF PAGE3_OPTION3_LEFT_XPOS EQU 11
DEF PAGE3_OPTION3_RIGHT_XPOS EQU 14
DEF PAGE3_OPTION4_LEFT_XPOS EQU 11
DEF PAGE3_OPTION4_RIGHT_XPOS EQU 14
DEF PAGE3_OPTION5_LEFT_XPOS EQU 11
DEF PAGE3_OPTION5_RIGHT_XPOS EQU 14
DEF PAGE3_OPTION6_LEFT_XPOS EQU 11
DEF PAGE3_OPTION6_RIGHT_XPOS EQU 14

DEF PAGE3_OPTION1_BIT EQU BIT_GHOST_PSYCHIC
DEF PAGE3_OPTION2_BIT EQU BIT_ICE_FIRE
DEF PAGE3_OPTION3_BIT EQU BIT_BUG_PSN
DEF PAGE3_OPTION4_BIT EQU BIT_PSN_BUG
DEF PAGE3_OPTION5_BIT EQU BIT_EXP_BAR
DEF PAGE3_OPTION6_BIT EQU BIT_NPC_STAT_EXP

BattleOptionText:
	db   "BATTLE OPTIONS"
	next " GHSTxPSY: 0× 2×"
	next " ICExFIRE: 1× 0.5×"
	next " BUGxPSN:  2× 0.5×"
	next " PSNxBUG:  2× 1×"
	next " EXP BAR:  ON OFF"
	next " NPC EVs:  ON OFF@"

BattleOptionMenuCancelText:
	db "NEXT     CANCEL@"

DisplayBattleOptions:
	hlcoord 0, 0
	ld b, 14
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, BattleOptionText
	call PlaceString
	hlcoord 2, 16
	ld de, BattleOptionMenuCancelText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld [wOptionsCancelCursorX], a
	ld a, 3 ; first sprite option Y coordinate
	ld [wTopMenuItemY], a
	call SetCursorPositionsFromBattleOptions
	ld a, [wOptionsPage3Option1CursorX] ; text speed cursor X coordinate
	ld [wTopMenuItemX], a
	ld a, $01
	ldh [hAutoBGTransferEnabled], a ; enable auto background transfer
	call Delay3
.loop
	call PlaceMenuCursor
	call SetBattleOptionsFromCursorPositions
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
	cp 16 ; is the cursor on the cancel row?
	jr z, .cancelMore
	jr .loop
.cancelMore
	ld a, [wTopMenuItemX]
	cp 10 ; is the cursor on cancel?
	jr z, .exitMenu
	ld a, SFX_PRESS_AB
	call PlaySound
	call ClearScreen
	callfar DisplaySpriteOptions
.exitMenu
	ld a, SFX_PRESS_AB
	call PlaySound
	ret
.checkDirectionKeys
	ld a, [wTopMenuItemY]
	bit BIT_D_DOWN, b
	jr nz, .downPressed
	bit BIT_D_UP, b
	jr nz, .upPressed
	call leftRightPressedBattleOptions
	jp .loop
.downPressed
	cp 16
	ld b, -13 ;b = how far vertically the cursor will go compared to its current location
	ld hl, wOptionsPage3Option1CursorX
	jr z, .updateMenuVariables
	ld b, 2
	cp 3
	inc hl
	jr z, .updateMenuVariables
	cp 5
	inc hl
	jr z, .updateMenuVariables
	cp 7
	inc hl
	jr z, .updateMenuVariables
	cp 9
	inc hl
	jr z, .updateMenuVariables
	cp 11
	inc hl
	jr z, .updateMenuVariables
	ld b, 3
	ld hl, wOptionsCancelCursorX
	jr .updateMenuVariables
.upPressed
	cp 5
	ld b, -2
	ld hl, wOptionsPage3Option1CursorX
	jr z, .updateMenuVariables
	cp 7
	inc hl
	jr z, .updateMenuVariables
	cp 9
	inc hl
	jr z, .updateMenuVariables
	cp 11
	inc hl
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


leftRightPressedBattleOptions:
	cp 3 ; cursor in Back Sprite section?
	jr z, .cursorInOption1
	cp 5 ; cursor in Menu Sprite section?
	jr z, .cursorInOption2
	cp 7 ; cursor in Bulbasaur section?
	jr z, .cursorInOption3
	cp 9 ; cursor in Squirtle section?
	jr z, .cursorInOption4
	cp 11 ; cursor in Squirtle section?
	jr z, .cursorInOption5
	cp 13 ; cursor in Squirtle section?
	jr z, .cursorInOption6
	cp 16 ; cursor on Cancel?
	jr z, .cursorCancelRow
.cursorInOption1
	ld a, [wOptionsPage3Option1CursorX] ; battle animation cursor X coordinate
	ld b, PAGE3_OPTION1_LEFT_XPOS
	cp PAGE3_OPTION1_RIGHT_XPOS
	jr z, .loadOption1X
	ld b, PAGE3_OPTION1_RIGHT_XPOS
.loadOption1X
	ld a, b
	ld [wOptionsPage3Option1CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption2
	ld a, [wOptionsPage3Option2CursorX] ; battle animation cursor X coordinate
	ld b, PAGE3_OPTION2_LEFT_XPOS
	cp PAGE3_OPTION2_RIGHT_XPOS
	jr z, .loadOption2X
	ld b, PAGE3_OPTION2_RIGHT_XPOS
.loadOption2X
	ld a, b
	ld [wOptionsPage3Option2CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption3
	ld a, [wOptionsPage3Option3CursorX] ; battle animation cursor X coordinate
	ld b, PAGE3_OPTION3_LEFT_XPOS
	cp PAGE3_OPTION3_RIGHT_XPOS
	jr z, .loadOption3X
	ld b, PAGE3_OPTION3_RIGHT_XPOS
.loadOption3X
	ld a, b
	ld [wOptionsPage3Option3CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption4
	ld a, [wOptionsPage3Option4CursorX] ; battle animation cursor X coordinate
	ld b, PAGE3_OPTION4_LEFT_XPOS
	cp PAGE3_OPTION4_RIGHT_XPOS
	jr z, .loadOption4X
	ld b, PAGE3_OPTION4_RIGHT_XPOS
.loadOption4X
	ld a, b
	ld [wOptionsPage3Option4CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption5
	ld a, [wOptionsPage3Option5CursorX] ; battle animation cursor X coordinate
	ld b, PAGE3_OPTION5_LEFT_XPOS
	cp PAGE3_OPTION5_RIGHT_XPOS
	jr z, .loadOption5X
	ld b, PAGE3_OPTION5_RIGHT_XPOS
.loadOption5X
	ld a, b
	ld [wOptionsPage3Option5CursorX], a
	jr .eraseOldMenuCursor
.cursorInOption6
	ld a, [wOptionsPage3Option6CursorX] ; battle animation cursor X coordinate
	ld b, PAGE3_OPTION6_LEFT_XPOS
	cp PAGE3_OPTION6_RIGHT_XPOS
	jr z, .loadOption6X
	ld b, PAGE3_OPTION6_RIGHT_XPOS
.loadOption6X
	ld a, b
	ld [wOptionsPage3Option6CursorX], a
	jr .eraseOldMenuCursor
.cursorCancelRow
	ld a, [wOptionsCancelCursorX] ; battle style cursor X coordinate
	xor $0b ; toggle between 1 and 10
	ld [wOptionsCancelCursorX], a
	jp .eraseOldMenuCursor
.eraseOldMenuCursor
	ld [wTopMenuItemX], a
	call EraseMenuCursor
	ret


; sets the options variable according to the current placement of the menu cursors in the options menu
SetBattleOptionsFromCursorPositions:
	ld a, [wSpriteOptions2]
	ld d, a
	ld a, [wOptionsPage3Option1CursorX] ; battle style cursor X coordinate
	cp PAGE3_OPTION1_LEFT_XPOS 
	jr z, .option1setLeft
.option1setRight
	res PAGE3_OPTION1_BIT, d
	jr .checkOption2
.option1setLeft
	set PAGE3_OPTION1_BIT, d
.checkOption2
	ld a, [wOptionsPage3Option2CursorX] ; battle style cursor X coordinate
	cp PAGE3_OPTION2_RIGHT_XPOS 
	jr z, .option2setRight
.option2setLeft
	res PAGE3_OPTION2_BIT, d
	jr .checkOption3
.option2setRight
	set PAGE3_OPTION2_BIT, d
.checkOption3
	ld a, [wOptionsPage3Option3CursorX] ; battle style cursor X coordinate
	cp PAGE3_OPTION3_RIGHT_XPOS 
	jr z, .option3setRight
.option3setLeft
	res PAGE3_OPTION3_BIT, d
	jr .checkOption4
.option3setRight
	set PAGE3_OPTION3_BIT, d
.checkOption4
	ld a, [wOptionsPage3Option4CursorX] ; battle style cursor X coordinate
	cp PAGE3_OPTION4_RIGHT_XPOS 
	jr z, .option4setRight
.option4setLeft
	res PAGE3_OPTION4_BIT, d
	jr .storeOptions
.option4setRight
	set PAGE3_OPTION4_BIT, d
.storeOptions
	ld a, d
	ld [wSpriteOptions2], a
.checkOption5
	ld a, [wOptions2]
	ld d, a
	ld a, [wOptionsPage3Option5CursorX]
	cp PAGE3_OPTION5_RIGHT_XPOS
	jr z, .option5setRight
.option5setLeft
	set PAGE3_OPTION5_BIT, d
	jr .checkOption6
.option5setRight
	res PAGE3_OPTION5_BIT, d
.checkOption6
	ld a, [wOptionsPage3Option6CursorX]
	cp PAGE3_OPTION6_RIGHT_XPOS
	jr z, .option6setRight
.option6setLeft
	set PAGE3_OPTION6_BIT, d
	jr .storeOptions2
.option6setRight
	res PAGE3_OPTION6_BIT, d	
.storeOptions2
	ld a, d
	ld [wOptions2], a
	ret

SetCursorPositionsFromBattleOptions:
	ld hl, wSpriteOptions2
	ld a, PAGE3_OPTION1_RIGHT_XPOS
	bit PAGE3_OPTION1_BIT, [hl]
	jr z, .storeOption1CursorX
	ld a, PAGE3_OPTION1_LEFT_XPOS
.storeOption1CursorX
	ld [wOptionsPage3Option1CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 3
	call .placeUnfilledRightArrow
.getOption2
	ld a, PAGE3_OPTION2_LEFT_XPOS
	ld hl, wSpriteOptions2
	bit PAGE3_OPTION2_BIT, [hl]
	jr z, .storeOption2CursorX
	ld a, PAGE3_OPTION2_RIGHT_XPOS
.storeOption2CursorX
	ld [wOptionsPage3Option2CursorX], a ; Menu Sprites Cursor X Coordinate
	hlcoord 0, 5
	call .placeUnfilledRightArrow
.getOption3
	ld a, PAGE3_OPTION3_LEFT_XPOS
	ld hl, wSpriteOptions2
	bit PAGE3_OPTION3_BIT, [hl]
	jr z, .storeOption3SpriteCursorX
	ld a, PAGE3_OPTION3_RIGHT_XPOS
.storeOption3SpriteCursorX
	ld [wOptionsPage3Option3CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 7
	call .placeUnfilledRightArrow
.getOption4SpriteOption
	ld a, PAGE3_OPTION4_LEFT_XPOS
	ld hl, wSpriteOptions2
	bit PAGE3_OPTION4_BIT, [hl]
	jr z, .storeOption4SpriteCursorX
	ld a, PAGE3_OPTION4_RIGHT_XPOS
.storeOption4SpriteCursorX
	ld [wOptionsPage3Option4CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 9
	call .placeUnfilledRightArrow
.getOption5SpriteOption
	ld a, PAGE3_OPTION5_RIGHT_XPOS
	ld hl, wOptions2
	bit PAGE3_OPTION5_BIT, [hl]
	jr z, .storeOption5SpriteCursorX
	ld a, PAGE3_OPTION5_LEFT_XPOS
.storeOption5SpriteCursorX
	ld [wOptionsPage3Option5CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 11
	call .placeUnfilledRightArrow
.getOption6SpriteOption
	ld a, PAGE3_OPTION6_RIGHT_XPOS
	ld hl, wOptions2
	bit PAGE3_OPTION6_BIT, [hl]
	jr z, .storeOption6SpriteCursorX
	ld a, PAGE3_OPTION6_LEFT_XPOS
.storeOption6SpriteCursorX
	ld [wOptionsPage3Option6CursorX], a ; Back Sprites Cursor X Coordinate
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
