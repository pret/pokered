AnimateHallOfFame: ; 701a0 (1c:41a0)
	call Func_70423
	call ClearScreen
	ld c, $64
	call DelayFrames
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	call DisableLCD
	ld hl, $9800
	ld bc, $800
	ld a, $7f
	call FillMemory
	call EnableLCD
	ld hl, rLCDC ; $ff40
	set 3, [hl]
	xor a
	ld hl, $cc5b
	ld bc, $60
	call FillMemory
	xor a
	ld [$cfcb], a
	ld [$ffd7], a
	ld [W_SPRITEFLIPPED], a
	ld [$d358], a
	ld [$cd40], a
	inc a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld hl, $d5a2
	ld a, [hl]
	inc a
	jr z, .asm_701eb
	inc [hl]
.asm_701eb
	ld a, $90
	ld [$ffb0], a
	ld c, BANK(Music_HallOfFame)
	ld a, MUSIC_HALL_OF_FAME
	call PlayMusic
	ld hl, W_PARTYMON1 ; $d164
	ld c, $ff
.asm_701fb
	ld a, [hli]
	cp $ff
	jr z, .asm_70241
	inc c
	push hl
	push bc
	ld [wWhichTrade], a ; $cd3d
	ld a, c
	ld [$cd3e], a
	ld hl, W_PARTYMON1_LEVEL ; $d18c
	ld bc, $2c
	call AddNTimes
	ld a, [hl]
	ld [$cd3f], a
	call Func_70278
	call Func_702e1
	ld c, $50
	call DelayFrames
	FuncCoord 2, 13 ; $c4a6
	ld hl, Coord
	ld b, $3
	ld c, $e
	call TextBoxBorder
	FuncCoord 4, 15 ; $c4d0
	ld hl, Coord
	ld de, HallOfFameText
	call PlaceString
	ld c, $b4
	call DelayFrames
	call GBFadeOut2
	pop bc
	pop hl
	jr .asm_701fb
.asm_70241
	ld a, c
	inc a
	ld hl, $cc5b
	ld bc, $10
	call AddNTimes
	ld [hl], $ff
	call Func_73b0d
	xor a
	ld [wWhichTrade], a ; $cd3d
	inc a
	ld [$cd40], a
	call Func_70278
	call Func_70377
	call Func_70423
	xor a
	ld [$ffb0], a
	ld hl, rLCDC ; $ff40
	res 3, [hl]
	ret

HallOfFameText: ; 7026b (1c:426b)
	db "HALL OF FAME@"

Func_70278: ; 70278 (1c:4278)
	call ClearScreen
	ld a, $d0
	ld [$ffaf], a
	ld a, $c0
	ld [$ffae], a
	ld a, [wWhichTrade] ; $cd3d
	ld [$cf91], a
	ld [$d0b5], a
	ld [$cfd9], a
	ld [$cf1d], a
	ld a, [$cd40]
	and a
	jr z, .asm_7029d
	call Func_7033e
	jr .asm_702ab
.asm_7029d
	FuncCoord 12, 5 ; $c410
	ld hl, Coord
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	ld a, $4
	call Predef ; indirect jump to LoadMonBackSprite (3f103 (f:7103))
.asm_702ab
	ld b, $b
	ld c, $0
	call GoPAL_SET
	ld a, $e4
	ld [rBGP], a ; $ff47
	ld c, $31
	call Func_7036d
	ld d, $a0
	ld e, $4
	ld a, [$cf1b]
	and a
	jr z, .asm_702c7
	sla e
.asm_702c7
	call .asm_702d5
	xor a
	ld [$ffaf], a
	ld c, a
	call Func_7036d
	ld d, $0
	ld e, $fc
.asm_702d5
	call DelayFrame
	ld a, [$ffae]
	add e
	ld [$ffae], a
	cp d
	jr nz, .asm_702d5
	ret

Func_702e1: ; 702e1 (1c:42e1)
	ld a, [$cd3e]
	ld hl, W_PARTYMON1NAME ; $d2b5
	call GetPartyMonName
	call Func_702f0
	jp Func_70404

Func_702f0: ; 702f0 (1c:42f0)
	FuncCoord 0, 2 ; $c3c8
	ld hl, Coord
	ld b, $9
	ld c, $a
	call TextBoxBorder
	FuncCoord 2, 6 ; $c41a
	ld hl, Coord
	ld de, HoFMonInfoText
	call PlaceString
	FuncCoord 1, 4 ; $c3f1
	ld hl, Coord
	ld de, $cd6d
	call PlaceString
	ld a, [$cd3f]
	FuncCoord 8, 7 ; $c434
	ld hl, Coord
	call PrintLevelCommon
	ld a, [wWhichTrade] ; $cd3d
	ld [$d0b5], a
	FuncCoord 3, 9 ; $c457
	ld hl, Coord
	ld a, $4b
	call Predef ; indirect jump to Func_27d6b (27d6b (9:7d6b))
	ld a, [wWhichTrade] ; $cd3d
	jp PlayCry

HoFMonInfoText: ; 70329 (1c:4329)
	db   "LEVEL/"
	next "TYPE1/"
	next "TYPE2/@"

Func_7033e: ; 7033e (1c:433e)
	ld de, RedPicFront ; $6ede
	ld a, BANK(RedPicFront)
	call UncompressSpriteFromDE
	ld hl, S_SPRITEBUFFER1
	ld de, $a000
	ld bc, $310
	call CopyData
	ld de, $9000
	call InterlaceMergeSpriteBuffers
	ld de, RedPicBack ; $7e0a
	ld a, BANK(RedPicBack)
	call UncompressSpriteFromDE
	ld a, $3
	call Predef ; indirect jump to ScaleSpriteByTwo (2fe40 (b:7e40))
	ld de, $9310
	call InterlaceMergeSpriteBuffers
	ld c, $1

Func_7036d: ; 7036d (1c:436d)
	ld b, $0
	FuncCoord 12, 5 ; $c410
	ld hl, Coord
	ld a, $31
	jp Predef ; indirect jump to Func_79dda (79dda (1e:5dda))

Func_70377: ; 70377 (1c:4377)
	ld hl, $d747
	set 3, [hl]
	ld a, $56
	call Predef ; indirect jump to DisplayDexRating (44169 (11:4169))
	FuncCoord 0, 4 ; $c3f0
	ld hl, Coord
	ld b, $6
	ld c, $a
	call TextBoxBorder
	FuncCoord 5, 0 ; $c3a5
	ld hl, Coord
	ld b, $2
	ld c, $9
	call TextBoxBorder
	FuncCoord 7, 2 ; $c3cf
	ld hl, Coord
	ld de, W_PLAYERNAME ; $d158
	call PlaceString
	FuncCoord 1, 6 ; $c419
	ld hl, Coord
	ld de, HoFPlayTimeText
	call PlaceString
	FuncCoord 5, 7 ; $c431
	ld hl, Coord
	ld de, $da41
	ld bc, $103
	call PrintNumber
	ld [hl], $6d
	inc hl
	ld de, $da43
	ld bc, $8102
	call PrintNumber
	FuncCoord 1, 9 ; $c455
	ld hl, Coord
	ld de, HoFMoneyText
	call PlaceString
	FuncCoord 4, 10 ; $c46c
	ld hl, Coord
	ld de, wPlayerMoney ; $d347
	ld c, $a3
	call PrintBCDNumber
	ld hl, DexSeenOwnedText
	call Func_703e2
	ld hl, DexRatingText
	call Func_703e2
	ld hl, $cc5d

Func_703e2: ; 703e2 (1c:43e2)
	call PrintText
	ld c, $78
	jp DelayFrames

HoFPlayTimeText: ; 703ea (1c:43ea)
	db "PLAY TIME@"

HoFMoneyText: ; 703f4 (1c:43f4)
	db "MONEY@"

DexSeenOwnedText: ; 703fa (1c:43fa)
	TX_FAR _DexSeenOwnedText
	db "@"

DexRatingText: ; 703ff (1c:43ff)
	TX_FAR _DexRatingText
	db "@"

Func_70404: ; 70404 (1c:4404)
	ld hl, $cc5b
	ld bc, $10
	ld a, [$cd3e]
	call AddNTimes
	ld a, [wWhichTrade] ; $cd3d
	ld [hli], a
	ld a, [$cd3f]
	ld [hli], a
	ld e, l
	ld d, h
	ld hl, $cd6d
	ld bc, $b
	jp CopyData

Func_70423: ; 70423 (1c:4423)
	ld a, $a
	ld [$cfc8], a
	ld [$cfc9], a
	ld a, $ff
	ld [wMusicHeaderPointer], a
	jp GBFadeOut2
