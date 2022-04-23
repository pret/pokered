BACKSPRITES_OG_XPOS EQU 9
BACKSPRITES_SW_XPOS EQU 12
BULBASAUR_RB_XPOS EQU 13
BULBASAUR_RG_XPOS EQU 16
SQUIRTLE_RB_XPOS EQU 13
SQUIRTLE_RG_XPOS EQU 16
BLASTOISE_RB_XPOS EQU 13
BLASTOISE_RG_XPOS EQU 16
PIDGEOT_RB_XPOS EQU 13
PIDGEOT_RG_XPOS EQU 16

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
	ld hl, wOptionsBackSpritesCursorX
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
	ld b, 5
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
	cp 9
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


leftRightPressed:
	cp 3 ; cursor in Back Sprite section?
	jr z, .cursorInBackSprite
	cp 5 ; cursor in Bulbasaur section?
	jr z, .cursorInBulbasaur
	cp 7 ; cursor in Squirtle section?
	jr z, .cursorInSquirtle
	cp 9 ; cursor in Blastoise section?
	jr z, .cursorInBlastoise
	cp 11 ; cursor in Pidgeot section?
	jr z, .cursorInPidgeot
	cp 16 ; cursor on Cancel?
	jr z, .cursorCancelRow
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
.cursorInSquirtle
	ld a, [wOptionsSquirtleSpriteCursorX] ; battle animation cursor X coordinate
	ld b, SQUIRTLE_RB_XPOS
	cp SQUIRTLE_RG_XPOS
	jr z, .loadSquirtleX
	ld b, SQUIRTLE_RG_XPOS
.loadSquirtleX
	ld a, b
	ld [wOptionsSquirtleSpriteCursorX], a
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
.cursorInPidgeot
	ld a, [wOptionsPidgeotSpriteCursorX] ; battle animation cursor X coordinate
	ld b, PIDGEOT_RB_XPOS
	cp PIDGEOT_RG_XPOS
	jr z, .loadPidgeotX
	ld b, PIDGEOT_RG_XPOS
.loadPidgeotX
	ld a, b
	ld [wOptionsPidgeotSpriteCursorX], a
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
	ld a, [wOptionsBackSpritesCursorX] ; battle style cursor X coordinate
	cp BACKSPRITES_SW_XPOS 
	jr z, .backSpritesSW
.backSpritesOG
	res BIT_BACK_SPRITES, d
	jr .checkBulbasaur
.backSpritesSW
	set BIT_BACK_SPRITES, d
.checkBulbasaur
	ld a, [wOptionsBulbasaurSpriteCursorX] ; battle style cursor X coordinate
	cp BULBASAUR_RG_XPOS 
	jr z, .bulbasaurRG
.bulbasaurRB
	res BIT_BULBASAUR_SPRITE, d
	jr .storeOptions
.bulbasaurRG
	set BIT_BULBASAUR_SPRITE, d
.storeOptions
	ld a, d
	ld [wSpriteOptions2], a
	ld a, [wSpriteOptions]
	ld d, a
.checkSquirtle
	ld a, [wOptionsSquirtleSpriteCursorX] ; battle style cursor X coordinate
	cp SQUIRTLE_RG_XPOS 
	jr z, .squirtleRG
.squirtleRB
	res BIT_SQUIRTLE_SPRITE, d
	jr .checkBlastoise
.squirtleRG
	set BIT_SQUIRTLE_SPRITE, d
.checkBlastoise
	ld a, [wOptionsBlastoiseSpriteCursorX] ; battle style cursor X coordinate
	cp BLASTOISE_RG_XPOS 
	jr z, .blastoiseRG
.blastoiseRB
	res BIT_BLASTOISE_SPRITE, d
	jr .checkPidgeot
.blastoiseRG
	set BIT_BLASTOISE_SPRITE, d
.checkPidgeot
	ld a, [wOptionsPidgeotSpriteCursorX] ; battle style cursor X coordinate
	cp PIDGEOT_RG_XPOS 
	jr z, .pidgeotRG
.pidgeotRB
	res BIT_PIDGEOT_SPRITE, d
	jr .storeSpriteOptions
.pidgeotRG
	set BIT_PIDGEOT_SPRITE, d
.storeSpriteOptions
	ld a, d
	ld [wSpriteOptions], a
	ret

SetCursorPositionsFromSpriteOptions:
	ld hl, wSpriteOptions2
	ld a, 9
	bit BIT_BACK_SPRITES, [hl]
	jr z, .storeBackSpriteCursorX
	ld a, 12
.storeBackSpriteCursorX
	ld [wOptionsBackSpritesCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 3
	call .placeUnfilledRightArrow
.getBulbasaurSpriteOption
	ld a, 13
	ld hl, wSpriteOptions2
	bit BIT_BULBASAUR_SPRITE, [hl]
	jr z, .storeBulbasaurSpriteCursorX
	ld a, 16
.storeBulbasaurSpriteCursorX
	ld [wOptionsBulbasaurSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 5
	call .placeUnfilledRightArrow
.getSquirtleSpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_SQUIRTLE_SPRITE, [hl]
	jr z, .storeSquirtleSpriteCursorX
	ld a, 16
.storeSquirtleSpriteCursorX
	ld [wOptionsSquirtleSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 7
	call .placeUnfilledRightArrow
.getBlastoiseSpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_BLASTOISE_SPRITE, [hl]
	jr z, .storeBlastoiseSpriteCursorX
	ld a, 16
.storeBlastoiseSpriteCursorX
	ld [wOptionsBlastoiseSpriteCursorX], a ; Back Sprites Cursor X Coordinate
	hlcoord 0, 9
	call .placeUnfilledRightArrow
.getPidgeotSpriteOption
	ld a, 13
	ld hl, wSpriteOptions
	bit BIT_PIDGEOT_SPRITE, [hl]
	jr z, .storePidgeotSpriteCursorX
	ld a, 16
.storePidgeotSpriteCursorX
	ld [wOptionsPidgeotSpriteCursorX], a ; Back Sprites Cursor X Coordinate
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

SpritesOptionText:
	db   "SPRITES 1"
	next " BACK:   OG SW97"
	next " BULBASAUR:  RB RG"
	next " SQUIRTLE:   RB RG"
	next " BLASTOISE:  RB RG"
	next " PIDGEOT:    RB RG@"

SpriteMenuCancelText:
	db "NEXT     CANCEL@"