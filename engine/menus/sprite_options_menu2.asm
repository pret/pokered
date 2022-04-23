NIDORINO_RB_XPOS EQU 13
NIDORINO_RG_XPOS EQU 16
GOLBAT_RB_XPOS EQU 13
GOLBAT_RG_XPOS EQU 16
MANKEY_RB_XPOS EQU 13
MANKEY_RG_XPOS EQU 16
ARCANINE_RB_XPOS EQU 13
ARCANINE_RG_XPOS EQU 16
EXEGGUTOR_RB_XPOS EQU 13
EXEGGUTOR_RG_XPOS EQU 16
MEWTWO_RB_XPOS EQU 13
MEWTWO_RG_XPOS EQU 16

DisplaySpriteOptions2:
	hlcoord 0, 0
	ld b, 14
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, SpritesOptionText2
	call PlaceString
	hlcoord 2, 16
	ld de, SpriteMenuCancelText2
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld [wOptionsCancelCursorX], a
	ld a, 3 ; first sprite option Y coordinate
	ld [wTopMenuItemY], a
	call SetCursorPositionsFromSpriteOptions2
	ld a, [wOptionsNidorinoSpriteCursorX] ; text speed cursor X coordinate
	ld [wTopMenuItemX], a
	ld a, $01
	ldh [hAutoBGTransferEnabled], a ; enable auto background transfer
	call Delay3
.loop
	call PlaceMenuCursor
	call SetSpriteOptionsFromCursorPositions2
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
	callfar DisplayOptionMenu
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
	call leftRightPressed2
	jp .loop
.downPressed
	cp 16
	ld b, -13 ;b = how far vertically the cursor will go compared to its current location
	ld hl, wOptionsNidorinoSpriteCursorX
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
	ld hl, wOptionsNidorinoSpriteCursorX
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


leftRightPressed2:
	cp 3 ; cursor in Nidorino section?
	jr z, .cursorInNidorino
	cp 5 ; cursor in Golbat section?
	jr z, .cursorInGolbat
	cp 7 ; cursor in Mankey section?
	jr z, .cursorInMankey
	cp 9 ; cursor in Arcanine section?
	jr z, .cursorInArcanine
	cp 11 ; cursor in Exeggutor section?
	jr z, .cursorInExeggutor
	cp 13 ; cursor in Mewtwo section?
	jr z, .cursorInMewtwo
	cp 16 ; cursor on Cancel?
	jr z, .cursorCancelRow
.cursorInNidorino
	ld a, [wOptionsNidorinoSpriteCursorX] ; battle animation cursor X coordinate
	ld b, NIDORINO_RB_XPOS
	cp NIDORINO_RG_XPOS
	jr z, .loadNidorinoX
	ld b, NIDORINO_RG_XPOS
.loadNidorinoX
	ld a, b
	ld [wOptionsNidorinoSpriteCursorX], a
	jp .eraseOldMenuCursor
.cursorInGolbat
	ld a, [wOptionsGolbatSpriteCursorX] ; battle animation cursor X coordinate
	ld b, GOLBAT_RB_XPOS
	cp GOLBAT_RG_XPOS
	jr z, .loadGolbatX
	ld b, GOLBAT_RG_XPOS
.loadGolbatX
	ld a, b
	ld [wOptionsGolbatSpriteCursorX], a
	jp .eraseOldMenuCursor
.cursorInMankey
	ld a, [wOptionsMankeySpriteCursorX] ; battle animation cursor X coordinate
	ld b, MANKEY_RB_XPOS
	cp MANKEY_RG_XPOS
	jr z, .loadMankeyX
	ld b, MANKEY_RG_XPOS
.loadMankeyX
	ld a, b
	ld [wOptionsMankeySpriteCursorX], a
	jp .eraseOldMenuCursor
.cursorInArcanine
	ld a, [wOptionsArcanineSpriteCursorX] ; battle animation cursor X coordinate
	ld b, ARCANINE_RB_XPOS
	cp ARCANINE_RG_XPOS
	jr z, .loadArcanineX
	ld b, ARCANINE_RG_XPOS
.loadArcanineX
	ld a, b
	ld [wOptionsArcanineSpriteCursorX], a
	jp .eraseOldMenuCursor
.cursorInExeggutor
	ld a, [wOptionsExeggutorSpriteCursorX] ; battle animation cursor X coordinate
	ld b, EXEGGUTOR_RB_XPOS
	cp EXEGGUTOR_RG_XPOS
	jr z, .loadExeggutorX
	ld b, EXEGGUTOR_RG_XPOS
.loadExeggutorX
	ld a, b
	ld [wOptionsExeggutorSpriteCursorX], a
	jp .eraseOldMenuCursor
.cursorInMewtwo
	ld a, [wOptionsMewtwoSpriteCursorX] ; battle animation cursor X coordinate
	ld b, MEWTWO_RB_XPOS
	cp MEWTWO_RG_XPOS
	jr z, .loadMewtwoX
	ld b, MEWTWO_RG_XPOS
.loadMewtwoX
	ld a, b
	ld [wOptionsMewtwoSpriteCursorX], a
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
SetSpriteOptionsFromCursorPositions2:
	ld a, [wSpriteOptions2]
	ld d, a
	ld a, [wOptionsExeggutorSpriteCursorX] ; battle style cursor X coordinate
	cp EXEGGUTOR_RG_XPOS 
	jr z, .exeggutorRG
.exeggutorRB
	res BIT_EXEGGUTOR_SPRITE, d
	jr .storeOptions
.exeggutorRG
	set BIT_EXEGGUTOR_SPRITE, d
.storeOptions
	ld a, d
	ld [wSpriteOptions2], a
	ld a, [wSpriteOptions]
	ld d, a
	ld a, [wOptionsNidorinoSpriteCursorX] ; battle style cursor X coordinate
	cp NIDORINO_RG_XPOS 
	jr z, .nidorinoRG
.nidorinoRB
	res 3, d
	jr .checkGolbat
.nidorinoRG
	set 3, d
.checkGolbat
	ld a, [wOptionsGolbatSpriteCursorX] ; battle style cursor X coordinate
	cp GOLBAT_RG_XPOS 
	jr z, .golbatRG
.golbatRB
	res 4, d
	jr .checkMankey
.golbatRG
	set 4, d
.checkMankey
	ld a, [wOptionsMankeySpriteCursorX] ; battle style cursor X coordinate
	cp MANKEY_RG_XPOS 
	jr z, .mankeyRG
.mankeyRB
	res 5, d
	jr .checkArcanine
.mankeyRG
	set 5, d
.checkArcanine
	ld a, [wOptionsArcanineSpriteCursorX] ; battle style cursor X coordinate
	cp ARCANINE_RG_XPOS 
	jr z, .arcanineRG
.arcanineRB
	res 6, d
	jr .checkMewtwo
.arcanineRG
	set 6, d
.checkMewtwo
	ld a, [wOptionsMewtwoSpriteCursorX] ; battle style cursor X coordinate
	cp MEWTWO_RG_XPOS 
	jr z, .mewtwoRG
.mewtwoRB
	res 7, d
	jr .storeOptions2
.mewtwoRG
	set 7, d
.storeOptions2
	ld a, d
	ld [wSpriteOptions], a
	ret

SetCursorPositionsFromSpriteOptions2:
	ld hl, wSpriteOptions
	ld a, 13
	bit BIT_NIDORINO_SPRITE, [hl]
	jr z, .storeNidorinoCursorX
	ld a, 16
.storeNidorinoCursorX
	ld [wOptionsNidorinoSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 3
	call .placeUnfilledRightArrow
.getGolbatSpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_GOLBAT_SPRITE, [hl]
	jr z, .storeGolbatSpriteCursorX
	ld a, 16
.storeGolbatSpriteCursorX
	ld [wOptionsGolbatSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 5
	call .placeUnfilledRightArrow
.getMankeySpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_MANKEY_SPRITE, [hl]
	jr z, .storeMankeySpriteCursorX
	ld a, 16
.storeMankeySpriteCursorX
	ld [wOptionsMankeySpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 7
	call .placeUnfilledRightArrow
.getArcanineSpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_ARCANINE_SPRITE, [hl]
	jr z, .storeArcanineSpriteCursorX
	ld a, 16
.storeArcanineSpriteCursorX
	ld [wOptionsArcanineSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 9
	call .placeUnfilledRightArrow
.getExeggutorSpriteOption
	ld a, 13
	ld hl, wSpriteOptions2
	bit BIT_EXEGGUTOR_SPRITE, [hl]
	jr z, .storeExeggutorSpriteCursorX
	ld a, 16
.storeExeggutorSpriteCursorX
	ld [wOptionsExeggutorSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 11
	call .placeUnfilledRightArrow
.getMewtwoSpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_MEWTWO_SPRITE, [hl]
	jr z, .storeMewtwoSpriteCursorX
	ld a, 16
.storeMewtwoSpriteCursorX
	ld [wOptionsMewtwoSpriteCursorX], a ; Back Sprites Cursor X Coordinate
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

SpritesOptionText2:
	db   "SPRITES 2"
	next " NIDORINO:   RB RG"
	next " GOLBAT:     Y  RB"
	next " MANKEY:     RB RG"
	next " ARCANINE:   RB RG"
	next " EXEGGUTOR:  Y  RB"
	next " MEWTWO:     RB RG@"

SpriteMenuCancelText2:
	db "BACK     CANCEL@"