Func_5317: ; 5317 (1:5317)
	ld c, $50
	call DelayFrames
	call ClearScreen
	call UpdateSprites
	call LoadFontTilePatterns
	call LoadHpBarAndStatusTilePatterns
	call LoadTrainerInfoTextBoxTiles
	hlCoord 3, 8
	ld b, $2
	ld c, $c
	call Func_5ab3
	hlCoord 4, 10
	ld de, PleaseWaitString ; $550f
	call PlaceString
	ld hl, W_NUMHITS ; wd074
	xor a
	ld [hli], a
	ld [hl], $50

Func_5345: ; 5345
	ld hl, wd152
	ld a, $fd
	ld b, $6
.asm_534c
	ld [hli], a
	dec b
	jr nz, .asm_534c
	ld hl, wd141
	ld a, $fd
	ld b, $7
.asm_5357
	ld [hli], a
	dec b
	jr nz, .asm_5357
	ld b, $a
.asm_535d
	call Random
	cp $fd
	jr nc, .asm_535d
	ld [hli], a
	dec b
	jr nz, .asm_535d
	ld hl, wTileMapBackup
	ld a, $fd
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld b, $c8
	xor a
.asm_5373
	ld [hli], a
	dec b
	jr nz, .asm_5373
	ld hl, W_GRASSRATE ; W_GRASSRATE
	ld bc, $1a9
.asm_537d
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_537d
	ld hl, wPartyMons - 1
	ld de, wTileMapBackup + 10
	ld bc, $0
.asm_538d
	inc c
	ld a, c
	cp $fd
	jr z, .asm_53a9
	ld a, b
	dec a
	jr nz, .asm_539c
	ld a, c
	cp $d
	jr z, .asm_53b2
.asm_539c
	inc hl
	ld a, [hl]
	cp $fe
	jr nz, .asm_538d
	ld a, c
	ld [de], a
	inc de
	ld [hl], $ff
	jr .asm_538d
.asm_53a9
	ld a, $ff
	ld [de], a
	inc de
	ld bc, $100
	jr .asm_538d
.asm_53b2
	ld a, $ff
	ld [de], a
	call Func_227f
	ld a, [$ffaa]
	cp $2
	jr nz, .asm_53d2
	call Delay3
	xor a
	ld [$ffac], a
	ld a, $81
	ld [$ff02], a
	call DelayFrame
	xor a
	ld [$ffac], a
	ld a, $81
	ld [$ff02], a
.asm_53d2
	call Delay3
	ld a, $8
	ld [rIE], a ; $ffff
	ld hl, wd141
	ld de, wTileMapBackup2
	ld bc, $11
	call Func_216f
	ld a, $fe
	ld [de], a
	ld hl, wd152
	ld de, wd893
	ld bc, $1a8
	call Func_216f
	ld a, $fe
	ld [de], a
	ld hl, wTileMapBackup
	ld de, wTileMapBackup + 200
	ld bc, $c8
	call Func_216f
	ld a, $d
	ld [rIE], a ; $ffff
	ld a, $ff
	call PlaySound
	ld a, [$ffaa]
	cp $2
	jr z, .asm_5431
	ld hl, wTileMapBackup2
.asm_5415
	ld a, [hli]
	and a
	jr z, .asm_5415
	cp $fd
	jr z, .asm_5415
	cp $fe
	jr z, .asm_5415
	dec hl
	ld de, wd148
	ld c, $a
.asm_5427
	ld a, [hli]
	cp $fe
	jr z, .asm_5427
	ld [de], a
	inc de
	dec c
	jr nz, .asm_5427
.asm_5431
	ld hl, wd896
.asm_5434
	ld a, [hli]
	and a
	jr z, .asm_5434
	cp $fd
	jr z, .asm_5434
	cp $fe
	jr z, .asm_5434
	dec hl
	ld de, W_GRASSRATE ; W_GRASSRATE
	ld c, $b
.asm_5446
	ld a, [hli]
	cp $fe
	jr z, .asm_5446
	ld [de], a
	inc de
	dec c
	jr nz, .asm_5446
	ld de, wEnemyPartyCount ; wEnemyPartyCount
	ld bc, $194
.asm_5456
	ld a, [hli]
	cp $fe
	jr z, .asm_5456
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_5456
	ld de, wTileMapBackup
	ld hl, wPartyMons
	ld c, $2
.asm_546a
	ld a, [de]
	inc de
	and a
	jr z, .asm_546a
	cp $fd
	jr z, .asm_546a
	cp $fe
	jr z, .asm_546a
	cp $ff
	jr z, .asm_5489
	push hl
	push bc
	ld b, 0
	dec a
	ld c, a
	add hl, bc
	ld a, $fe
	ld [hl], a
	pop bc
	pop hl
	jr .asm_546a
.asm_5489
	ld hl, wPartyMons + $fc ; wd267
	dec c
	jr nz, .asm_546a
	ld de, wTileMapBackup + 200
	ld hl, wEnemyMons
	ld c, $2
.asm_5497
	ld a, [de]
	inc de
	and a
	jr z, .asm_5497
	cp $fd
	jr z, .asm_5497
	cp $fe
	jr z, .asm_5497
	cp $ff
	jr z, .asm_54b6
	push hl
	push bc
	ld b, $0
	dec a
	ld c, a
	add hl, bc
	ld a, $fe
	ld [hl], a
	pop bc
	pop hl
	jr .asm_5497
.asm_54b6
	ld hl, wEnemyMons + $fc
	dec c
	jr nz, .asm_5497
	ld a, $ac
	ld [wcf8d], a
	ld a, $d9
	ld [wcf8e], a
	xor a
	ld [wcc38], a
	ld a, $ff
	call PlaySound
	ld a, [$ffaa]
	cp $2
	ld c, $42
	call z, DelayFrames
	ld a, [W_ISLINKBATTLE] ; W_ISLINKBATTLE
	cp $3
	ld a, $32
	ld [W_ISLINKBATTLE], a ; W_ISLINKBATTLE
	jr nz, .asm_5506
	ld a, $4
	ld [W_ISLINKBATTLE], a ; W_ISLINKBATTLE
	ld a, SONY1 + $c8
	ld [W_CUROPPONENT], a ; wd059
	call ClearScreen
	call Delay3
	ld hl, W_OPTIONS ; W_OPTIONS
	res 7, [hl]
	predef InitOpponent
	predef HealParty
	jp Func_577d
.asm_5506
	ld c, BANK(Music_GameCorner)
	ld a, MUSIC_GAME_CORNER
	call PlayMusic
	jr Func_551c

PleaseWaitString: ; 550f (1:550f)
	db "PLEASE WAIT!@"

Func_551c:
	ld hl, PointerTable_5a5b ; $5a5b
	ld b, $0
	ld a, [wcc38]
	cp $ff
	jp z, LoadTitlescreenGraphics
	add a
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

TradeCenter_SelectMon:
	call ClearScreen
	call LoadTrainerInfoTextBoxTiles
	call Func_57f2
	call Func_57a2
	xor a
	ld hl, wcc3d
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wcc37], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuJoypadPollCount], a
	inc a
	ld [wcc42], a
	jp .asm_55dc
.asm_5557
	xor a
	ld [wcc37], a
	inc a
	ld [wcc49], a
	ld a, $a1
	ld [wMenuWatchedKeys], a
	ld a, [wEnemyPartyCount]
	ld [wMaxMenuItem], a
	ld a, $9
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
.asm_5574
	ld hl, $fff6
	set 1, [hl]
	call HandleMenuInput
	ld hl, $fff6
	res 1, [hl]
	and a
	jp z, .asm_565b
	bit 0, a
	jr z, .asm_55b0 ; 0x5587 $27
	ld a, [wMaxMenuItem]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr c, .asm_559a ; 0x5591 $7
	ld a, [wMaxMenuItem]
	dec a
	ld [wCurrentMenuItem], a
.asm_559a
	ld a, $1
	ld [wd11b], a
	callab Func_39bd5
	ld hl, wEnemyMons
	call Func_57d6
	jp .asm_565b
.asm_55b0
	bit 5, a
	jr z, .asm_55d4 ; 0x55b2 $20
	xor a
	ld [wcc49], a
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld a, [wTileBehindCursor]
	ld [hl], a
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wPartyCount]
	dec a
	cp b
	jr nc, .asm_55dc ; 0x55cd $d
	ld [wCurrentMenuItem], a
	jr .asm_55dc ; 0x55d2 $8
.asm_55d4
	bit 7, a
	jp z, .asm_565b
	jp .asm_572f
.asm_55dc
	xor a
	ld [wcc49], a
	ld [wcc37], a
	ld a, $91
	ld [wMenuWatchedKeys], a
	ld a, [wPartyCount]
	ld [wMaxMenuItem], a
	ld a, $1
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	ld hl, wTileMap + $15
	ld bc, $0601
	call ClearScreenArea
.asm_5601
	ld hl, $fff6
	set 1, [hl]
	call HandleMenuInput
	ld hl, $fff6
	res 1, [hl]
	and a
	jr nz, .asm_5614 ; 0x560f $3
	jp .asm_565b
.asm_5614
	bit 0, a
	jr z, .asm_562e ; 0x5616 $16
	jp .asm_5665
	ld a, $4
	ld [wd11b], a
	callab Func_39bd5
	call Func_57d6
	jp .asm_565b
.asm_562e
	bit 4, a
	jr z, .asm_5654 ; 0x5630 $22
	ld a, $1
	ld [wcc49], a
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld a, [wTileBehindCursor]
	ld [hl], a
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wEnemyPartyCount]
	dec a
	cp b
	jr nc, .asm_5651 ; 0x564c $3
	ld [wCurrentMenuItem], a
.asm_5651
	jp .asm_5557
.asm_5654
	bit 7, a
	jr z, .asm_565b ; 0x5656 $3
	jp .asm_572f
.asm_565b
	ld a, [wcc49]
	and a
	jp z, .asm_5601
	jp .asm_5574
.asm_5665
	call SaveScreenTilesToBuffer1
	call PlaceUnfilledArrowMenuCursor
	ld a, [wMaxMenuItem]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr c, .asm_5679 ; 0x5673 $4
	ld a, [wMaxMenuItem]
	dec a
.asm_5679
	push af
	ld hl, wTileMap + $118
	ld b, $2
	ld c, $12
	call Func_5ab3
	ld hl, wTileMap + $142
	ld de, .statsTrade
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuJoypadPollCount], a
	ld [wMaxMenuItem], a
	ld a, $10
	ld [wTopMenuItemY], a
.asm_569f
	ld a, $7f
	ld [wTileMap + $14b], a
	ld a, $13
	ld [wMenuWatchedKeys], a
	ld a, $1
	ld [wTopMenuItemX], a
	call HandleMenuInput
	bit 4, a
	jr nz, .asm_56c3 ; 0x56b3 $e
	bit 1, a
	jr z, .asm_56df ; 0x56b7 $26
.asm_56b9
	pop af
	ld [wCurrentMenuItem], a
	call LoadScreenTilesFromBuffer1
	jp .asm_55dc
.asm_56c3
	ld a, $7f
	ld [wTileMap + $141], a
	ld a, $23
	ld [wMenuWatchedKeys], a
	ld a, $b
	ld [wTopMenuItemX], a
	call HandleMenuInput
	bit 5, a
	jr nz, .asm_569f ; 0x56d7 $c6
	bit 1, a
	jr nz, .asm_56b9 ; 0x56db $dc
	jr .asm_56f9 ; 0x56dd $1a
.asm_56df
	pop af
	ld [wCurrentMenuItem], a
	ld a, $4
	ld [wd11b], a
	callab Func_39bd5
	call Func_57d6
	call LoadScreenTilesFromBuffer1
	jp .asm_55dc
.asm_56f9
	call PlaceUnfilledArrowMenuCursor
	pop af
	ld [wCurrentMenuItem], a
	ld [wWhichTrade], a
	ld [wcc42], a
	call Func_226e
	ld a, [wcc3d]
	cp $f
	jp z, Func_551c
	ld [wTrainerEngageDistance], a
	call Func_57c7
	ld a, $1
	ld [wcc38], a
	jp Func_551c
.statsTrade
	db "STATS     TRADE@"
.asm_572f
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wMaxMenuItem]
	cp b
	jp nz, .asm_565b
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld a, $7f
	ld [hl], a
.asm_5745
	ld a, $ed
	ld [wTileMap + $141], a
.asm_574a
	call JoypadLowSensitivity
	ld a, [hJoy5]
	and a
	jr z, .asm_574a ; 0x5750 $f8
	bit 0, a
	jr nz, .asm_5769 ; 0x5754 $13
	bit 6, a
	jr z, .asm_574a ; 0x5758 $f0
	ld a, $7f
	ld [wTileMap + $141], a
	ld a, [wPartyCount]
	dec a
	ld [wCurrentMenuItem], a
	jp .asm_55dc
.asm_5769
	ld a, $ec
	ld [wTileMap + $141], a
	ld a, $f
	ld [wcc42], a
	call Func_226e
	ld a, [wcc3d]
	cp $f
	jr nz, .asm_5745 ; 0x577b $c8

Func_577d: ; 577d (1:577d)
	call GBPalWhiteOutWithDelay3
	ld hl, wcfc4
	ld a, [hl]
	push af
	push hl
	res 0, [hl]
	xor a
	ld [wd72d], a
	dec a
	ld [wDestinationWarpID], a
	call LoadMapData
	callba ClearVariablesAfterLoadingMapData
	pop hl
	pop af
	ld [hl], a
	call GBFadeInFromWhite
	ret

Func_57a2:
	ld hl, wTileMap + $137
	ld a, $7e
	ld bc, $0031
	call FillMemory
	ld hl, wTileMap + $12c
	ld b, $1
	ld c, $9
	call Func_5ab3
	ld hl, wTileMap + $142
	ld de, CancelTextString
	jp PlaceString

CancelTextString:
	db "CANCEL@"

Func_57c7:
	ld a, [wcc3d]
	ld hl, wTileMap + $b5
	ld bc, $0014
	call AddNTimes
	ld [hl], $ec
	ret

Func_57d6:
	ld a, [wCurrentMenuItem]
	ld [wWhichPokemon], a
	predef StatusScreen
	predef StatusScreen2
	call GBPalNormal
	call LoadTrainerInfoTextBoxTiles
	call Func_57f2
	jp Func_57a2

Func_57f2:
	ld hl, wTileMap
	ld b, $6
	ld c, $12
	call Func_5ab3
	ld hl, wTileMap + $a0
	ld b, $6
	ld c, $12
	call Func_5ab3
	ld hl, wTileMap + $5
	ld de, wPlayerName
	call PlaceString
	ld hl, wTileMap + $a5
	ld de, W_GRASSRATE
	call PlaceString
	ld hl, wTileMap + $16
	ld de, wPartySpecies
	call Func_5827
	ld hl, wTileMap + $b6
	ld de, wEnemyPartyMons

Func_5827:
	ld c, $0
.asm_5829
	ld a, [de]
	cp $ff
	ret z
	ld [wd11e], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ld [$ff95], a
	call GetMonName
	pop hl
	call PlaceString
	pop de
	inc de
	pop hl
	ld bc, $0014
	add hl, bc
	pop bc
	inc c
	jr .asm_5829 ; 0x5847 $e0

TradeCenter_Trade:
	ld c, $64
	call DelayFrames
	xor a
	ld [wcc43], a
	ld [wcc3e], a
	ld [wcc37], a
	ld [wMenuJoypadPollCount], a
	ld hl, wTileMap + $f0
	ld b, $4
	ld c, $12
	call Func_5ab3
	ld a, [wWhichTrade]
	ld hl, wPartySpecies
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wd11e], a
	call GetMonName
	ld hl, wcd6d
	ld de, wTrainerFacingDirection
	ld bc, $000b
	call CopyData
	ld a, [wTrainerEngageDistance]
	ld hl, wEnemyPartyMons
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wd11e], a
	call GetMonName
	ld hl, WillBeTradedText
	ld bc, wTileMap + $119
	call TextCommandProcessor
	call SaveScreenTilesToBuffer1
	ld hl, wTileMap + $96
	ld bc, $080b
	ld a, $5
	ld [wd12c], a
	ld a, $14
	ld [wd125], a
	call DisplayTextBoxID
	call LoadScreenTilesFromBuffer1
	ld a, [wCurrentMenuItem]
	and a
	jr z, .asm_58d9 ; 0x58b9 $1e
	ld a, $1
	ld [wcc42], a
	ld hl, wTileMap + $f0
	ld b, $4
	ld c, $12
	call Func_5ab3
	ld hl, wTileMap + $119
	ld de, TradeCanceled
	call PlaceString
	call Func_226e
	jp Func_5a18
.asm_58d9
	ld a, $2
	ld [wcc42], a
	call Func_226e
	ld a, [wcc3d]
	dec a
	jr nz, .asm_58fd ; 0x58e5 $16
	ld hl, wTileMap + $f0
	ld b, $4
	ld c, $12
	call Func_5ab3
	ld hl, wTileMap + $119
	ld de, TradeCanceled
	call PlaceString
	jp Func_5a18
.asm_58fd
	ld a, [wWhichTrade]
	ld hl, wPartyMonOT ; OT names of player
	call SkipFixedLengthTextEntries
	ld de, wTrainerScreenX
	ld bc, $000b
	call CopyData
	ld hl, wPartyMon1Species
	ld a, [wWhichTrade]
	ld bc, $002c
	call AddNTimes
	ld bc, $000c
	add hl, bc
	ld a, [hli]
	ld [wcd4c], a
	ld a, [hl]
	ld [wcd4d], a
	ld a, [wTrainerEngageDistance]
	ld hl, wEnemyMonOT ; OT names of other player
	call SkipFixedLengthTextEntries
	ld de, wcd4e
	ld bc, $000b
	call CopyData
	ld hl, wEnemyMons
	ld a, [wTrainerEngageDistance]
	ld bc, $002c
	call AddNTimes
	ld bc, $000c
	add hl, bc
	ld a, [hli]
	ld [wcd59], a
	ld a, [hl]
	ld [wcd5a], a
	ld a, [wWhichTrade]
	ld [wWhichPokemon], a
	ld hl, wPartySpecies
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wWhichTrade], a
	xor a
	ld [wcf95], a
	call RemovePokemon
	ld a, [wTrainerEngageDistance]
	ld c, a
	ld [wWhichPokemon], a
	ld hl, wEnemyPartyMons
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wcf91], a
	ld hl, wEnemyMons
	ld a, c
	ld bc, $002c
	call AddNTimes
	ld de, wcf98
	ld bc, $002c
	call CopyData
	call AddEnemyMonToPlayerParty
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, $1
	ld [wccd4], a
	ld a, [wTrainerEngageDistance]
	ld hl, wEnemyPartyMons
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTrainerEngageDistance], a
	ld a, $a
	ld [wMusicHeaderPointer], a
	ld a, $2
	ld [wc0f0], a
	ld a, MUSIC_SAFARI_ZONE
	ld [wc0ee], a
	call PlaySound
	ld c, $64
	call DelayFrames
	call ClearScreen
	call LoadHpBarAndStatusTilePatterns
	xor a
	ld [wcc5b], a
	ld a, [$ffaa]
	cp $1
	jr z, .asm_59d9 ; 0x59d0 $7
	predef Func_410e2
	jr .asm_59de ; 0x59d7 $5
.asm_59d9
	predef Func_410f3
.asm_59de
	callab TryEvolvingMon
	call ClearScreen
	call LoadTrainerInfoTextBoxTiles
	call Func_226e
	ld c, $28
	call DelayFrames
	ld hl, wTileMap + $f0
	ld b, $4
	ld c, $12
	call Func_5ab3
	ld hl, wTileMap + $119
	ld de, TradeCompleted
	call PlaceString
	predef SaveSAVtoSRAM2
	ld c, $32
	call DelayFrames
	xor a
	ld [wcc38], a
	jp Func_5345

Func_5a18:
	ld c, $64
	call DelayFrames
	xor a
	ld [wcc38], a
	jp Func_551c

WillBeTradedText: ; 5a24 (1:5a24)
	TX_FAR _WillBeTradedText
	db "@"

TradeCompleted:
	db "Trade completed!@"

TradeCanceled:
	db   "Too bad! The trade"
	next "was canceled!@"

PointerTable_5a5b: ; 5a5b (1:5a5b)
	dw TradeCenter_SelectMon
	dw TradeCenter_Trade

Func_5a5f: ; 5a5f (1:5a5f)
	ld a, [W_ISLINKBATTLE] ; W_ISLINKBATTLE
	cp $2
	jr z, .asm_5a75
	cp $3
	jr z, .asm_5a75
	cp $5
	ret nz
	predef Func_5aaf
	jp Init
.asm_5a75
	call Func_5317
	ld hl, Club_GFX
	ld a, h
	ld [W_TILESETGFXPTR + 1], a
	ld a, l
	ld [W_TILESETGFXPTR], a
	ld a, Bank(Club_GFX)
	ld [W_TILESETBANK], a
	ld hl, Club_Coll
	ld a, h
	ld [W_TILESETCOLLISIONPTR + 1], a
	ld a, l
	ld [W_TILESETCOLLISIONPTR], a
	xor a
	ld [W_GRASSRATE], a ; W_GRASSRATE
	inc a
	ld [W_ISLINKBATTLE], a ; W_ISLINKBATTLE
	ld [hJoy5], a
	ld a, $a
	ld [wMusicHeaderPointer], a
	ld a, BANK(Music_Celadon)
	ld [wc0f0], a
	ld a, MUSIC_CELADON
	ld [wc0ee], a
	jp PlaySound

Func_5aaf: ; 5aaf (1:5aaf)
	ret

Func_5ab0:
	call GetPredefRegisters

Func_5ab3: ; 5ab3 (1:5ab3)
	push hl
	ld a, $78
	ld [hli], a
	inc a
	call Func_5ae0
	inc a
	ld [hl], a
	pop hl
	ld de, $14
	add hl, de
.asm_5ac2
	push hl
	ld a, $7b
	ld [hli], a
	ld a, $7f
	call Func_5ae0
	ld [hl], $77
	pop hl
	ld de, $14
	add hl, de
	dec b
	jr nz, .asm_5ac2
	ld a, $7c
	ld [hli], a
	ld a, $76
	call Func_5ae0
	ld [hl], $7d
	ret

Func_5ae0: ; 5ae0 (1:5ae0)
	ld d, c
.asm_5ae1
	ld [hli], a
	dec d
	jr nz, .asm_5ae1
	ret
