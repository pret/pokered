BACKSPRITES_OG_XPOS EQU 9
BACKSPRITES_SW_XPOS EQU 12
BULBASAUR_RB_XPOS EQU 13
BULBASAUR_RG_XPOS EQU 16
BLASTOISE_RB_XPOS EQU 13
BLASTOISE_RG_XPOS EQU 16

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
	ld a, [wOptionsBackSpritesCursorX] ; text speed cursor X coordinate
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
	callfar DisplayOptionMenu
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
	cp 3 ; cursor in Back Sprite section?
	jr z, .cursorInBackSprite
	cp 5 ; cursor in Bulbasaur section?
	jr z, .cursorInBulbasaur
	cp 7 ; cursor in Blastoise section?
	jr z, .cursorInBlastoise
	cp 16 ; cursor on Cancel?
	jr z, .cursorCancelRow
.downPressed
	cp 16
	ld b, -13 ;b = how far vertically the cursor will go compared to its current location
	ld hl, wOptionsBackSpritesCursorX
	jr z, .updateMenuVariables
	ld b, 2
	cp 3
	inc hl
	jr z, .updateMenuVariables
	cp 5
	inc hl
	jr z, .updateMenuVariables
	ld b, 9
	ld hl, wOptionsCancelCursorX
	jr .updateMenuVariables
.upPressed
	cp 5
	ld b, -2
	ld hl, wOptionsBackSpritesCursorX
	jr z, .updateMenuVariables
	cp 7
	inc hl
	jr z, .updateMenuVariables
	cp 16
	ld b, -9
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
.cursorInBackSprite
	ld a, [wOptionsBackSpritesCursorX] ; battle animation cursor X coordinate
	ld b, BACKSPRITES_OG_XPOS
	cp BACKSPRITES_SW_XPOS
	jr z, .loadBackSpriteX
	ld b, BACKSPRITES_SW_XPOS
.loadBackSpriteX
	ld a, b
	ld [wOptionsBackSpritesCursorX], a
	jp .eraseOldMenuCursor
.cursorInBulbasaur
	ld a, [wOptionsBulbasaurSpriteCursorX] ; battle animation cursor X coordinate
	ld b, BULBASAUR_RB_XPOS
	cp BULBASAUR_RG_XPOS
	jr z, .loadBulbasaurX
	ld b, BULBASAUR_RG_XPOS
.loadBulbasaurX
	ld a, b
	ld [wOptionsBulbasaurSpriteCursorX], a
	jp .eraseOldMenuCursor
.cursorInBlastoise
	ld a, [wOptionsBlastoiseSpriteCursorX] ; battle animation cursor X coordinate
	ld b, BLASTOISE_RB_XPOS
	cp BLASTOISE_RG_XPOS
	jr z, .loadBlastoiseX
	ld b, BLASTOISE_RG_XPOS
.loadBlastoiseX
	ld a, b
	ld [wOptionsBlastoiseSpriteCursorX], a
	jp .eraseOldMenuCursor
.cursorCancelRow
	ld a, [wOptionsCancelCursorX] ; battle style cursor X coordinate
	xor $0b ; toggle between 1 and 10
	ld [wOptionsCancelCursorX], a
	jp .eraseOldMenuCursor

; sets the options variable according to the current placement of the menu cursors in the options menu
SetSpriteOptionsFromCursorPositions:
	ld d, 00000000 ; load empty byte into d
	ld a, [wOptionsBackSpritesCursorX] ; battle style cursor X coordinate
	cp BACKSPRITES_SW_XPOS 
	jr z, .backSpritesSW
.backSpritesOG
	res 0, d
	jr .checkBulbasaur
.backSpritesSW
	set 0, d
.checkBulbasaur
	ld a, [wOptionsBulbasaurSpriteCursorX] ; battle style cursor X coordinate
	cp BULBASAUR_RG_XPOS 
	jr z, .bulbasaurRG
.bulbasaurRB
	res 1, d
	jr .checkBlastoise
.bulbasaurRG
	set 1, d
.checkBlastoise
	ld a, [wOptionsBlastoiseSpriteCursorX] ; battle style cursor X coordinate
	cp BLASTOISE_RG_XPOS 
	jr z, .blastoiseRG
.blastoiseRB
	res 2, d
	jr .storeOptions
.blastoiseRG
	set 2, d
.storeOptions
	ld a, d
	ld [wSpriteOptions], a
	ret

SetCursorPositionsFromSpriteOptions:
	ld hl, wSpriteOptions
	ld a, 9
	bit BIT_BACK_SPRITES, [hl]
	jr z, .storeBackSpriteCursorX
	ld a, 12
.storeBackSpriteCursorX
	ld [wOptionsBackSpritesCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 3
	call .placeUnfilledRightArrow
	jr .getBulbasaurSpriteOption
.getBulbasaurSpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_BULBASAUR_SPRITE, [hl]
	jr z, .storeBulbasaurSpriteCursorX
	ld a, 16
.storeBulbasaurSpriteCursorX
	ld [wOptionsBulbasaurSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 5
	call .placeUnfilledRightArrow
	jr .getBlastoiseSpriteOption
.getBlastoiseSpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_BLASTOISE_SPRITE, [hl]
	jr z, .storeBlastoiseSpriteCursorX
	ld a, 16
.storeBlastoiseSpriteCursorX
	ld [wOptionsBlastoiseSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 7
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

SpritesOptionText:
	db   "SPRITES"
	next " BACK:   OG SW97"
	next " BULBASAUR:  RB RG"
	next " BLASTOISE:  RB RG@"

SpriteMenuCancelText:
	db "BACK     CANCEL@"