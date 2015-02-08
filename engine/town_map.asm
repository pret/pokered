DisplayTownMap: ; 70e3e (1c:4e3e)
	call LoadTownMap
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	ld a, $1
	ld [hJoy7], a
	ld a, [W_CURMAP] ; W_CURMAP
	push af
	ld b, $0
	call Func_711c4
	hlCoord 1, 0
	ld de, wcd6d
	call PlaceString
	ld hl, wOAMBuffer
	ld de, wTileMapBackup
	ld bc, $10
	call CopyData
	ld hl, vSprites + $40
	ld de, TownMapCursor ; $4f40
	ld bc, (BANK(TownMapCursor) << 8) + $04
	call CopyVideoDataDouble
	xor a
	ld [wWhichTrade], a ; wWhichTrade
	pop af
	jr Func_70e92

Func_70e7e: ; 70e7e (1c:4e7e)
	ld hl, wTileMap
	ld bc, $114
	call ClearScreenArea
	ld hl, TownMapOrder ; $4f11
	ld a, [wWhichTrade] ; wWhichTrade
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]

Func_70e92: ; 70e92 (1c:4e92)
	ld de, wHPBarMaxHP
	call Func_712f1
	ld a, [de]
	push hl
	call Func_71258
	ld a, $4
	ld [wcd5b], a
	ld hl, wOAMBuffer + $10
	call Func_71279
	pop hl
	ld de, wcd6d
.asm_70eac
	ld a, [hli]
	ld [de], a
	inc de
	cp $50
	jr nz, .asm_70eac
	hlCoord 1, 0
	ld de, wcd6d
	call PlaceString
	ld hl, wOAMBuffer + $10
	ld de, wTileMapBackup + 16
	ld bc, $10
	call CopyData
.asm_70ec8
	call TownMapSpriteBlinkingAnimation
	call JoypadLowSensitivity
	ld a, [hJoy5]
	ld b, a
	and $c3
	jr z, .asm_70ec8
	ld a, (SFX_02_3c - SFX_Headers_02) / 3
	call PlaySound
	bit 6, b
	jr nz, .asm_70ef2
	bit 7, b
	jr nz, .asm_70f01
	xor a
	ld [wTownMapSpriteBlinkingEnabled], a
	ld [hJoy7], a
	ld [wTownMapSpriteBlinkingCounter], a
	call Func_711ab
	pop hl
	pop af
	ld [hl], a
	ret
.asm_70ef2
	ld a, [wWhichTrade] ; wWhichTrade
	inc a
	cp $2f
	jr nz, .asm_70efb
	xor a
.asm_70efb
	ld [wWhichTrade], a ; wWhichTrade
	jp Func_70e7e
.asm_70f01
	ld a, [wWhichTrade] ; wWhichTrade
	dec a
	cp $ff
	jr nz, .asm_70f0b
	ld a, $2e
.asm_70f0b
	ld [wWhichTrade], a ; wWhichTrade
	jp Func_70e7e

INCLUDE "data/town_map_order.asm"

TownMapCursor: ; 70f40 (1c:4f40)
	INCBIN "gfx/town_map_cursor.1bpp"

LoadTownMap_Nest: ; 70f60 (1c:4f60)
	call LoadTownMap
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	call Func_711ef
	call GetMonName
	hlCoord 1, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, MonsNestText
	call PlaceString
	call WaitForTextScrollButtonPress
	call Func_711ab
	pop hl
	pop af
	ld [hl], a
	ret

MonsNestText: ; 70f89 (1c:4f89)
	db "'s NEST@"

LoadTownMap_Fly: ; 70f90 (1c:4f90)
	call ClearSprites
	call LoadTownMap
	call LoadPlayerSpriteGraphics
	call LoadFontTilePatterns
	ld de, BirdSprite ; $4d80
	ld hl, vSprites + $40
	ld bc, (BANK(BirdSprite) << 8) + $0c
	call CopyVideoData
	ld de, TownMapUpArrow ; $5093
	ld hl, vChars1 + $6d0
	ld bc, (BANK(TownMapUpArrow) << 8) + $01
	call CopyVideoDataDouble
	call Func_71070
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	ld hl, wTileMap
	ld de, ToText
	call PlaceString
	ld a, [W_CURMAP] ; W_CURMAP
	ld b, $0
	call Func_711c4
	ld hl, wTrainerEngageDistance
	deCoord 18, 0

.townMapFlyLoop
	ld a, $7f
	ld [de], a
	push hl
	push hl
	hlCoord 3, 0
	ld bc, $10f
	call ClearScreenArea
	pop hl
	ld a, [hl]
	ld b, $4
	call Func_711c4
	hlCoord 3, 0
	ld de, wcd6d
	call PlaceString
	ld c, $f
	call DelayFrames
	hlCoord 18, 0
	ld [hl], $ed
	hlCoord 19, 0
	ld [hl], $ee
	pop hl
.asm_71004
	push hl
	call DelayFrame
	call JoypadLowSensitivity
	ld a, [hJoy5]
	ld b, a
	pop hl
	and $c3
	jr z, .asm_71004
	bit 0, b
	jr nz, .asm_71026
	ld a, (SFX_02_3c - SFX_Headers_02) / 3
	call PlaySound
	bit 6, b
	jr nz, .asm_71042
	bit 7, b
	jr nz, .asm_71058
	jr .asm_71037
.asm_71026
	ld a, (SFX_02_3e - SFX_Headers_02) / 3
	call PlaySound
	ld a, [hl]
	ld [wDestinationMap], a
	ld hl, wd732
	set 3, [hl]
	inc hl
	set 7, [hl]
.asm_71037
	xor a
	ld [wTownMapSpriteBlinkingEnabled], a
	call GBPalWhiteOutWithDelay3
	pop hl
	pop af
	ld [hl], a
	ret
.asm_71042
	deCoord 18, 0
	inc hl
	ld a, [hl]
	cp $ff
	jr z, .asm_71052
	cp $fe
	jr z, .asm_71042
	jp .townMapFlyLoop
.asm_71052
	ld hl, wTrainerEngageDistance
	jp .townMapFlyLoop
.asm_71058
	deCoord 19, 0
	dec hl
	ld a, [hl]
	cp $ff
	jr z, .asm_71068
	cp $fe
	jr z, .asm_71058
	jp .townMapFlyLoop
.asm_71068
	ld hl, wcd49
	jr .asm_71058

ToText: ; 7106d (1c:506d)
	db "To@"

Func_71070: ; 71070 (1c:5070)
	ld hl, wWhichTrade ; wWhichTrade
	ld [hl], $ff
	inc hl
	ld a, [W_TOWNVISITEDFLAG]
	ld e, a
	ld a, [W_TOWNVISITEDFLAG + 1]
	ld d, a
	ld bc, $b
.asm_71081
	srl d
	rr e
	ld a, $fe
	jr nc, .asm_7108a
	ld a, b
.asm_7108a
	ld [hl], a
	inc hl
	inc b
	dec c
	jr nz, .asm_71081
	ld [hl], $ff
	ret

TownMapUpArrow: ; 71093 (1c:5093)
	INCBIN "gfx/up_arrow.1bpp"

LoadTownMap: ; 7109b (1c:509b)
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	ld hl, wTileMap
	ld b, $12
	ld c, $12
	call TextBoxBorder
	call DisableLCD
	ld hl, WorldMapTileGraphics ; $65a8
	ld de, vChars2 + $600
	ld bc, $100
	ld a, BANK(WorldMapTileGraphics)
	call FarCopyData2
	ld hl, MonNestIcon ; $56be
	ld de, vSprites + $40
	ld bc, $8
	ld a, BANK(MonNestIcon)
	call FarCopyDataDouble
	ld hl, wTileMap
	ld de, CompressedMap ; $5100
.asm_710d3
	ld a, [de]
	and a
	jr z, .asm_710e9
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	add $60
.asm_710e2
	ld [hli], a
	dec c
	jr nz, .asm_710e2
	inc de
	jr .asm_710d3
.asm_710e9
	call EnableLCD
	ld b, $2
	call GoPAL_SET
	call Delay3
	call GBPalNormal
	xor a
	ld [wTownMapSpriteBlinkingCounter], a
	inc a
	ld [wTownMapSpriteBlinkingEnabled], a
	ret

CompressedMap: ; 71100 (1c:5100)
; you can decompress this file with the redrle program in the extras/ dir
	INCBIN "gfx/town_map.rle"

Func_711ab: ; 711ab (1c:51ab)
	xor a
	ld [wTownMapSpriteBlinkingEnabled], a
	call GBPalWhiteOut
	call ClearScreen
	call ClearSprites
	call LoadPlayerSpriteGraphics
	call LoadFontTilePatterns
	call UpdateSprites
	jp GoPAL_SET_CF1C

Func_711c4: ; 711c4 (1c:51c4)
	push af
	ld a, b
	ld [wcd5b], a
	pop af
	ld de, wHPBarMaxHP
	call Func_712f1
	ld a, [de]
	push hl
	call Func_71258
	call Func_7126d
	pop hl
	ld de, wcd6d
.asm_711dc
	ld a, [hli]
	ld [de], a
	inc de
	cp $50
	jr nz, .asm_711dc
	ld hl, wOAMBuffer
	ld de, wTileMapBackup
	ld bc, $a0
	jp CopyData

Func_711ef: ; 711ef (1c:51ef)
	callba FindWildLocationsOfMon
	call Func_712d9
	ld hl, wOAMBuffer
	ld de, wBuffer
.asm_71200
	ld a, [de]
	cp $ff
	jr z, .asm_7121d
	and a
	jr z, .asm_7121a
	push hl
	call Func_712f1
	pop hl
	ld a, [de]
	cp $19
	jr z, .asm_7121a
	call Func_71258
	ld a, $4
	ld [hli], a
	xor a
	ld [hli], a
.asm_7121a
	inc de
	jr .asm_71200
.asm_7121d
	ld a, l
	and a
	jr nz, .asm_71236
	hlCoord 1, 7
	ld b, $2
	ld c, $f
	call TextBoxBorder
	hlCoord 2, 9
	ld de, AreaUnknownText
	call PlaceString
	jr .asm_7123e
.asm_71236
	ld a, [W_CURMAP] ; W_CURMAP
	ld b, $0
	call Func_711c4
.asm_7123e
	ld hl, wOAMBuffer
	ld de, wTileMapBackup
	ld bc, $a0
	jp CopyData

AreaUnknownText: ; 7124a (1c:524a)
	db " AREA UNKNOWN@"

Func_71258: ; 71258 (1c:5258)
	push af
	and $f0
	srl a
	add $18
	ld b, a
	ld [hli], a
	pop af
	and $f
	swap a
	srl a
	add $18
	ld c, a
	ld [hli], a
	ret

Func_7126d: ; 7126d (1c:526d)
	ld a, [wcd5b]
	and a
	ld hl, wOAMBuffer + $90
	jr z, Func_71279
	ld hl, wOAMBuffer + $80

Func_71279: ; 71279 (1c:5279)
	push hl
	ld hl, $fcfc
	add hl, bc
	ld b, h
	ld c, l
	pop hl

Func_71281: ; 71281 (1c:5281)
	ld de, $202
.asm_71284
	push de
	push bc
.asm_71286
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wcd5b]
	ld [hli], a
	inc a
	ld [wcd5b], a
	xor a
	ld [hli], a
	inc d
	ld a, $8
	add c
	ld c, a
	dec e
	jr nz, .asm_71286
	pop bc
	pop de
	ld a, $8
	add b
	ld b, a
	dec d
	jr nz, .asm_71284
	ret

Func_712a6: ; 712a6 (1c:52a6)
	xor a
	ld [wcd5c], a
	ld de, $202
.asm_712ad
	push de
	push bc
.asm_712af
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wcd5b]
	ld [hli], a
	ld a, [wcd5c]
	ld [hli], a
	xor $20
	ld [wcd5c], a
	inc d
	ld a, $8
	add c
	ld c, a
	dec e
	jr nz, .asm_712af
	pop bc
	pop de
	push hl
	ld hl, wcd5b
	inc [hl]
	inc [hl]
	pop hl
	ld a, $8
	add b
	ld b, a
	dec d
	jr nz, .asm_712ad
	ret

Func_712d9: ; 712d9 (1c:52d9)
	ld de, wHPBarMaxHP
.asm_712dc
	ld a, [de]
	inc de
	cp $ff
	ret z
	ld c, a
	ld l, e
	ld h, d
.asm_712e4
	ld a, [hl]
	cp $ff
	jr z, .asm_712dc
	cp c
	jr nz, .asm_712ee
	xor a
	ld [hl], a
.asm_712ee
	inc hl
	jr .asm_712e4

Func_712f1: ; 712f1 (1c:52f1)
	cp REDS_HOUSE_1F
	jr c, .asm_71304
	ld bc, $4
	ld hl, InternalMapEntries ; $5382
.asm_712fb
	cp [hl]
	jr c, .asm_71301
	add hl, bc
	jr .asm_712fb
.asm_71301
	inc hl
	jr .asm_7130d
.asm_71304
	ld hl, ExternalMapEntries ; $5313
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	add hl, bc
.asm_7130d
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

INCLUDE "data/town_map_entries.asm"

INCLUDE "text/map_names.asm"

MonNestIcon: ; 716be (1c:56be)
	INCBIN "gfx/mon_nest_icon.1bpp"

TownMapSpriteBlinkingAnimation: ; 716c6 (1c:56c6)
	ld a, [wTownMapSpriteBlinkingCounter]
	inc a
	cp 25
	jr z, .hideSprites
	cp 50
	jr nz, .done
; show sprites when the counter reaches 50
	ld hl, wTileMapBackup
	ld de, wOAMBuffer
	ld bc, $90
	call CopyData
	xor a
	jr .done
.hideSprites
	ld hl, wOAMBuffer
	ld b, $24
	ld de, $4
.hideSpritesLoop
	ld [hl], $a0
	add hl, de
	dec b
	jr nz, .hideSpritesLoop
	ld a, 25
.done
	ld [wTownMapSpriteBlinkingCounter], a
	jp DelayFrame
