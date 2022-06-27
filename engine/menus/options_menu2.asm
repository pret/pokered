PAGE2_OPTION1_LEFT_XPOS EQU 9
PAGE2_OPTION1_MIDDLE_XPOS EQU 12
PAGE2_OPTION1_RIGHT_XPOS EQU 16
PAGE2_OPTION2_LEFT_XPOS EQU 4
PAGE2_OPTION2_RIGHT_XPOS EQU 11
PAGE2_OPTION3_LEFT_XPOS EQU 12
PAGE2_OPTION3_RIGHT_XPOS EQU 16
PAGE2_OPTION4_LEFT_XPOS EQU 12
PAGE2_OPTION4_RIGHT_XPOS EQU 15


PAGE2_OPTION2_BIT EQU BIT_ALT_PKMN_PALETTES
PAGE2_OPTION3_BIT EQU BIT_AUDIO_PAN
PAGE2_OPTION4_BIT EQU BIT_BIKE_MUSIC

Options2Text:
	db   "OPTIONS 2"
	next " COLORS: OG SGB Y"
	next " ALT PKMN COLORS:"
	next "    OFF    ON"
	next " AUDIO PAN: OFF ON"
	next " BIKE SONG: ON OFF@"

Page2MenuCancelText:
	db "NEXT     CANCEL@"

DisplayOptions2:
	hlcoord 0, 0
	ld b, 14
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, Options2Text
	call PlaceString
	hlcoord 2, 16
	ld de, Page2MenuCancelText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld [wOptionsCancelCursorX], a
	ld a, 3 ; first sprite option Y coordinate
	ld [wTopMenuItemY], a
	call SetCursorPositionsFromOptions2
	ld a, [wOptionsPage2Option1CursorX] ; text speed cursor X coordinate
	ld [wTopMenuItemX], a
	ld a, $01
	ldh [hAutoBGTransferEnabled], a ; enable auto background transfer
	call Delay3
.loop
	call PlaceMenuCursor
	call SetOptions2FromCursorPositions
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
	callfar DisplayBattleOptions
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
	call Page2LeftRightPressed
	jp .loop
.downPressed
	cp 16
	ld b, -13 ;b = how far vertically the cursor will go compared to its current location
	ld hl, wOptionsPage2Option1CursorX
	jr z, .updateMenuVariables
	ld b, 4
	cp 3
	inc hl
	jr z, .updateMenuVariables
	cp 7
	ld b, 2
	inc hl
	jr z, .updateMenuVariables
	cp 9
	inc hl
	jr z, .updateMenuVariables
	ld b, 5
	ld hl, wOptionsCancelCursorX
	jr .updateMenuVariables
.upPressed
	cp 7
	ld b, -4
	ld hl, wOptionsPage2Option1CursorX
	jr z, .updateMenuVariables
	cp 9
	ld b, -2
	inc hl
	jr z, .updateMenuVariables
	cp 11
	inc hl
	jr z, .updateMenuVariables
	cp 16
	ld b, -5
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


Page2LeftRightPressed:
	cp 3 ; cursor in Back Sprite section?
	jr z, .cursorInOption1
	cp 7 ; cursor in Menu Sprite section?
	jr z, .cursorInOption2
	cp 9 ; cursor in Bulbasaur section?
	jr z, .cursorInOption3
	cp 11 ; cursor in Squirtle section?
	jr z, .cursorInOption4
	cp 16 ; cursor on Cancel?
	jr z, .cursorCancelRow
.cursorInOption1
	call GetTwoBitXPosition
.loadOption1X
	ld a, b
	ld [wOptionsPage2Option1CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption2
	ld a, [wOptionsPage2Option2CursorX] ; battle animation cursor X coordinate
	ld b, PAGE2_OPTION2_LEFT_XPOS
	cp PAGE2_OPTION2_RIGHT_XPOS
	jr z, .loadOption2X
	ld b, PAGE2_OPTION2_RIGHT_XPOS
.loadOption2X
	ld a, b
	ld [wOptionsPage2Option2CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption3
	ld a, [wOptionsPage2Option3CursorX] ; battle animation cursor X coordinate
	ld b, PAGE2_OPTION3_LEFT_XPOS
	cp PAGE2_OPTION3_RIGHT_XPOS
	jr z, .loadOption3X
	ld b, PAGE2_OPTION3_RIGHT_XPOS
.loadOption3X
	ld a, b
	ld [wOptionsPage2Option3CursorX], a
	jp .eraseOldMenuCursor
.cursorInOption4
	ld a, [wOptionsPage2Option4CursorX] ; battle animation cursor X coordinate
	ld b, PAGE2_OPTION4_LEFT_XPOS
	cp PAGE2_OPTION4_RIGHT_XPOS
	jr z, .loadOption4X
	ld b, PAGE2_OPTION4_RIGHT_XPOS
.loadOption4X
	ld a, b
	ld [wOptionsPage2Option4CursorX], a
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

GetTwoBitXPosition:
	ld a, b
	bit BIT_D_LEFT, b ; did the player press the left button
	jr nz, .left
	ld a, [wOptionsPage2Option1CursorX] ; battle animation cursor X coordinate
	ld b, PAGE2_OPTION1_LEFT_XPOS
	cp PAGE2_OPTION1_RIGHT_XPOS
	jr z, .done
	ld b, PAGE2_OPTION1_MIDDLE_XPOS
	cp PAGE2_OPTION1_LEFT_XPOS
	jr z, .done
	ld b, PAGE2_OPTION1_RIGHT_XPOS
	jr .done
.left
	ld a, [wOptionsPage2Option1CursorX] ; battle animation cursor X coordinate
	ld b, PAGE2_OPTION1_MIDDLE_XPOS
	cp PAGE2_OPTION1_RIGHT_XPOS
	jr z, .done
	ld b, PAGE2_OPTION1_LEFT_XPOS
	cp PAGE2_OPTION1_MIDDLE_XPOS
	jr z, .done
	ld b, PAGE2_OPTION1_RIGHT_XPOS
.done
	ret


; sets the options variable according to the current placement of the menu cursors in the options menu
SetOptions2FromCursorPositions:
	ld a, [wOptions2]
	ld b, a
	ld d, a
	call SetTwoBitPropFromXPosition
.checkOption2
	ld a, [wOptionsPage2Option2CursorX] ; battle style cursor X coordinate
	cp PAGE2_OPTION2_RIGHT_XPOS 
	jr z, .option2setRight
.option2setLeft
	res PAGE2_OPTION2_BIT, d
	jr .checkOption3
.option2setRight
	set PAGE2_OPTION2_BIT, d
.checkOption3
	ld a, [wOptionsPage2Option3CursorX] ; battle style cursor X coordinate
	cp PAGE2_OPTION3_RIGHT_XPOS 
	jr z, .option3setRight
.option3setLeft
	res PAGE2_OPTION3_BIT, d
	jr .checkOption4
.option3setRight
	set PAGE2_OPTION3_BIT, d
.checkOption4
	ld a, [wOptionsPage2Option4CursorX] ; battle style cursor X coordinate
	cp PAGE2_OPTION4_RIGHT_XPOS 
	jr z, .option4setRight
.option4setLeft
	res PAGE2_OPTION4_BIT, d
	jr .storeOptions
.option4setRight
	set PAGE2_OPTION4_BIT, d
.storeOptions
	ld a, d
	ld [wOptions2], a
	call CompareOptions2
	ret

SetTwoBitPropFromXPosition:
	ld a, [wOptionsPage2Option1CursorX] ; battle style cursor X coordinate
	cp PAGE2_OPTION1_RIGHT_XPOS 
	jr z, .option1setRight
	cp PAGE2_OPTION1_MIDDLE_XPOS 
	jr z, .option1setMiddle
.option1setLeft
	ld a, PALETTES_DEFAULT
	jr .done
.option1setRight
	ld a, PALETTES_YELLOW
	jr .done
.option1setMiddle
	ld a, PALETTES_SGB
.done
	or %11111100
	set 0, d
	set 1, d
	and d ; a = first two bits are set according to PALLETES value, last 6 bits retained from other options values
	ld d, a
	ret

CompareOptions2:
	ld a, b ; b = old setting of Options2 before changing it
	and %11
	ld c, a
	ld a, d
	and %11
	cp c
	jp nz, RunDefaultPaletteCommand ; refresh palettes if we changed the palette setting on GBC
	bit BIT_BIKE_MUSIC, b
	jr nz, .compareNonZero
	bit BIT_BIKE_MUSIC, d
	jr nz, .tryPlayMusic ; reset music if we changed the bike music option
	ret
.compareNonZero	
	bit BIT_BIKE_MUSIC, d
	ret nz
.tryPlayMusic
	ld a, [wInGame]
	and a
	ret z
	ld a, [wWalkBikeSurfState]
	cp 1
	ret nz
	jp PlayDefaultMusic ; reset music if we're on a bike and in-game

SetCursorPositionsFromOptions2:
	ld hl, wOptions2
	call GetTwoBitXPositionFromOptions
.storeOption1CursorX
	ld [wOptionsPage2Option1CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 3
	call .placeUnfilledRightArrow
.getOption2
	ld a, PAGE2_OPTION2_LEFT_XPOS
	ld hl, wOptions2
	bit PAGE2_OPTION2_BIT, [hl]
	jr z, .storeOption2CursorX
	ld a, PAGE2_OPTION2_RIGHT_XPOS
.storeOption2CursorX
	ld [wOptionsPage2Option2CursorX], a ; Menu Sprites Cursor X Coordinate
	hlcoord 0, 7
	call .placeUnfilledRightArrow
.getOption3
	ld a, PAGE2_OPTION3_LEFT_XPOS
	ld hl, wOptions2
	bit PAGE2_OPTION3_BIT, [hl]
	jr z, .storeOption3SpriteCursorX
	ld a, PAGE2_OPTION3_RIGHT_XPOS
.storeOption3SpriteCursorX
	ld [wOptionsPage2Option3CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 9
	call .placeUnfilledRightArrow
.getOption4SpriteOption
	ld a, PAGE2_OPTION4_LEFT_XPOS
	ld hl, wOptions2
	bit PAGE2_OPTION4_BIT, [hl]
	jr z, .storeOption4SpriteCursorX
	ld a, PAGE2_OPTION4_RIGHT_XPOS
.storeOption4SpriteCursorX
	ld [wOptionsPage2Option4CursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 11
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

GetTwoBitXPositionFromOptions:
	ld a, [hl]
	and %11 ;only care about first two bits
	ld d, PAGE2_OPTION1_LEFT_XPOS
	jr z, .done
	cp 1
	ld d, PAGE2_OPTION1_MIDDLE_XPOS
	jr z, .done
	ld d, PAGE2_OPTION1_RIGHT_XPOS
.done
	ld a, d
	ret