OPTION1_LEFT_XPOS EQU 9
OPTION1_RIGHT_XPOS EQU 12
OPTION2_LEFT_XPOS EQU 9
OPTION2_RIGHT_XPOS EQU 12
OPTION3_LEFT_XPOS EQU 13
OPTION3_RIGHT_XPOS EQU 16
OPTION4_LEFT_XPOS EQU 13
OPTION4_RIGHT_XPOS EQU 16
OPTION5_LEFT_XPOS EQU 13
OPTION5_RIGHT_XPOS EQU 16
OPTION6_LEFT_XPOS EQU 13
OPTION6_RIGHT_XPOS EQU 16

OPTION1_BIT EQU BIT_BACK_SPRITES
OPTION2_BIT EQU BIT_MENU_ICON_SPRITES
OPTION3_BIT EQU BIT_BULBASAUR_SPRITE
OPTION4_BIT EQU BIT_SQUIRTLE_SPRITE
OPTION5_BIT EQU BIT_BLASTOISE_SPRITE
OPTION6_BIT EQU BIT_PIDGEOT_SPRITE

SpritesOptionText:
	db   "SPRITES 1"
	next " BACK:   OG SW97"
	next " ICONS:  OG OGplus"
	next " BULBASAUR:  RB RG"
	next " SQUIRTLE:   RB RG"
	next " BLASTOISE:  RB RG"
	next " PIDGEOT:    RB RG@"

SpriteMenuCancelText:
	db "NEXT     CANCEL@"

DisplaySpriteOptions:
	hlcoord 0, 0
	ld b, 14
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, SpritesOptionText
	call PlaceString
	hlcoord 2, 16
	ld de, SpriteMenuCancelText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld [wOptionsCancelCursorX], a
	ld a, 3 ; first sprite option Y coordinate
	ld [wTopMenuItemY], a
	call SetCursorPositionsFromSpriteOptions
	ld a, [wOptionsPage2Option1CursorX] ; text speed cursor X coordinate
	ld [wTopMenuItemX], a
	ld a, $01
	ldh [hAutoBGTransferEnabled], a ; enable auto background transfer
	call Delay3
.loop
	call PlaceMenuCursor
	call SetSpriteOptionsFromCursorPositions
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
	callfar DisplaySpriteOptions2
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
	call leftRightPressed
	jp .loop
.downPressed
	cp 16
	ld b, -13 ;b = how far vertically the cursor will go compared to its current location
	ld hl, wOptionsPage2Option1CursorX
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
	ld hl, wOptionsPage2Option1CursorX
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


leftRightPressed:
	cp 3 ; cursor in Back Sprite section?
	jr z, .cursorInOption1
	cp 5 ; cursor in Menu Sprite section?
	jr z, .cursorInOption2
	cp 7 ; cursor in Bulbasaur section?
	jr z, .cursorInOption3
	cp 9 ; cursor in Squirtle section?
	jr z, .cursorInOption4
	cp 11 ; cursor in Blastoise section?
	jr z, .cursorInOption5
	cp 13 ; cursor in Pidgeot section?
	jr z, .cursorInOption6
	cp 16 ; cursor on Cancel?
	jr z, .cursorCancelRow
.cursorInOption1
	ld a, [wOptionsPage2Option1CursorX] ; battle animation cursor X coordinate
	ld b, OPTION1_LEFT_XPOS
	cp OPTION1_RIGHT_XPOS
	jr z, .loadOption1X
	ld b, OPTION1_RIGHT_XPOS
.loadOption1X
	ld a, b
	ld [wOptionsPage2Option1CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption2
	ld a, [wOptionsPage2Option2CursorX] ; battle animation cursor X coordinate
	ld b, OPTION2_LEFT_XPOS
	cp OPTION2_RIGHT_XPOS
	jr z, .loadOption2X
	ld b, OPTION2_RIGHT_XPOS
.loadOption2X
	ld a, b
	ld [wOptionsPage2Option2CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption3
	ld a, [wOptionsPage2Option3CursorX] ; battle animation cursor X coordinate
	ld b, OPTION3_LEFT_XPOS
	cp OPTION3_RIGHT_XPOS
	jr z, .loadOption3X
	ld b, OPTION3_RIGHT_XPOS
.loadOption3X
	ld a, b
	ld [wOptionsPage2Option3CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption4
	ld a, [wOptionsPage2Option4CursorX] ; battle animation cursor X coordinate
	ld b, OPTION4_LEFT_XPOS
	cp OPTION4_RIGHT_XPOS
	jr z, .loadOption4X
	ld b, OPTION4_RIGHT_XPOS
.loadOption4X
	ld a, b
	ld [wOptionsPage2Option4CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption5
	ld a, [wOptionsPage2Option5CursorX] ; battle animation cursor X coordinate
	ld b, OPTION5_LEFT_XPOS
	cp OPTION5_RIGHT_XPOS
	jr z, .loadOption5X
	ld b, OPTION5_RIGHT_XPOS
.loadOption5X
	ld a, b
	ld [wOptionsPage2Option5CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption6
	ld a, [wOptionsPage2Option6CursorX] ; battle animation cursor X coordinate
	ld b, OPTION6_LEFT_XPOS
	cp OPTION6_RIGHT_XPOS
	jr z, .loadOption6X
	ld b, OPTION6_RIGHT_XPOS
.loadOption6X
	ld a, b
	ld [wOptionsPage2Option6CursorX], a
	jp .eraseOldMenuCursor
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
SetSpriteOptionsFromCursorPositions:
	ld a, [wSpriteOptions2]
	ld d, a
	ld a, [wOptionsPage2Option1CursorX] ; battle style cursor X coordinate
	cp OPTION1_RIGHT_XPOS 
	jr z, .option1setRight
.option1setLeft
	res OPTION1_BIT, d
	jr .checkOption2
.option1setRight
	set OPTION1_BIT, d
.checkOption2
	ld a, [wOptionsPage2Option2CursorX] ; battle style cursor X coordinate
	cp OPTION2_RIGHT_XPOS 
	jr z, .option2setRight
.option2setLeft
	res OPTION2_BIT, d
	jr .checkOption3
.option2setRight
	set OPTION2_BIT, d
.checkOption3
	ld a, [wOptionsPage2Option3CursorX] ; battle style cursor X coordinate
	cp OPTION3_RIGHT_XPOS 
	jr z, .option3setRight
.option3setLeft
	res OPTION3_BIT, d
	jr .storeOptions
.option3setRight
	set OPTION3_BIT, d
.storeOptions
	ld a, d
	ld [wSpriteOptions2], a
	ld a, [wSpriteOptions]
	ld d, a
.checkOption4
	ld a, [wOptionsPage2Option4CursorX] ; battle style cursor X coordinate
	cp OPTION4_RIGHT_XPOS 
	jr z, .option4setRight
.option4setLeft
	res OPTION4_BIT, d
	jr .checkOption5
.option4setRight
	set OPTION4_BIT, d
.checkOption5
	ld a, [wOptionsPage2Option5CursorX] ; battle style cursor X coordinate
	cp OPTION5_RIGHT_XPOS 
	jr z, .option5setRight
.option5setLeft
	res OPTION5_BIT, d
	jr .checkOption6
.option5setRight
	set OPTION5_BIT, d
.checkOption6
	ld a, [wOptionsPage2Option6CursorX] ; battle style cursor X coordinate
	cp OPTION6_RIGHT_XPOS 
	jr z, .option6setRight
.option6setLeft
	res OPTION6_BIT, d
	jr .storeSpriteOptions
.option6setRight
	set OPTION6_BIT, d
.storeSpriteOptions
	ld a, d
	ld [wSpriteOptions], a
	ret

SetCursorPositionsFromSpriteOptions:
	ld hl, wSpriteOptions2
	ld a, 9
	bit OPTION1_BIT, [hl]
	jr z, .storeOption1CursorX
	ld a, 12
.storeOption1CursorX
	ld [wOptionsPage2Option1CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 3
	call .placeUnfilledRightArrow
.getOption2
	ld a, 9
	ld hl, wSpriteOptions2
	bit OPTION2_BIT, [hl]
	jr z, .storeOption2CursorX
	ld a, 12
.storeOption2CursorX
	ld [wOptionsPage2Option2CursorX], a ; Menu Sprites Cursor X Coordinate
	hlcoord 0, 5
	call .placeUnfilledRightArrow
.getOption3
	ld a, 13
	ld hl, wSpriteOptions2
	bit OPTION3_BIT, [hl]
	jr z, .storeOption3SpriteCursorX
	ld a, 16
.storeOption3SpriteCursorX
	ld [wOptionsPage2Option3CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 7
	call .placeUnfilledRightArrow
.getOption4SpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit OPTION4_BIT, [hl]
	jr z, .storeOption4SpriteCursorX
	ld a, 16
.storeOption4SpriteCursorX
	ld [wOptionsPage2Option4CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 9
	call .placeUnfilledRightArrow
.getOption5SpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit OPTION5_BIT, [hl]
	jr z, .storeOption5SpriteCursorX
	ld a, 16
.storeOption5SpriteCursorX
	ld [wOptionsPage2Option5CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 11
	call .placeUnfilledRightArrow
.getOption6SpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit OPTION6_BIT, [hl]
	jr z, .storeOption6SpriteCursorX
	ld a, 16
.storeOption6SpriteCursorX
	ld [wOptionsPage2Option6CursorX], a ; Back Sprites Cursor X Coordinate
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
