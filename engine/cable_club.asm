Func_5317: ; 5317 (1:5317)
	ld c, $50
	call DelayFrames
	call ClearScreen
	call UpdateSprites
	call LoadFontTilePatterns
	call LoadHpBarAndStatusTilePatterns
	call LoadTrainerInfoTextBoxTiles
	FuncCoord 3, 8 ; $c443
	ld hl, Coord
	ld b, $2
	ld c, $c
	call Func_5ab3
	FuncCoord 4, 10 ; $c46c
	ld hl, Coord
	ld de, PleaseWaitString ; $550f
	call PlaceString
	ld hl, W_NUMHITS ; $d074
	xor a
	ld [hli], a
	ld [hl], $50

Func_5345: ; 5345
	ld hl, $d152
	ld a, $fd
	ld b, $6
.asm_534c
	ld [hli], a
	dec b
	jr nz, .asm_534c
	ld hl, $d141
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
	ld hl, W_GRASSRATE ; $d887
	ld bc, $1a9
.asm_537d
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_537d
	ld hl, W_PARTYMONEND ; $d16a
	ld de, $c512
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
	ld hl, $d141
	ld de, wTileMapBackup2
	ld bc, $11
	call Func_216f
	ld a, $fe
	ld [de], a
	ld hl, $d152
	ld de, $d893
	ld bc, $1a8
	call Func_216f
	ld a, $fe
	ld [de], a
	ld hl, wTileMapBackup
	ld de, $c5d0
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
	ld de, $d148
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
	ld hl, $d896
.asm_5434
	ld a, [hli]
	and a
	jr z, .asm_5434
	cp $fd
	jr z, .asm_5434
	cp $fe
	jr z, .asm_5434
	dec hl
	ld de, W_GRASSRATE ; $d887
	ld c, $b
.asm_5446
	ld a, [hli]
	cp $fe
	jr z, .asm_5446
	ld [de], a
	inc de
	dec c
	jr nz, .asm_5446
	ld de, wEnemyPartyCount ; $d89c
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
	ld hl, W_PARTYMON1_NUM ; $d16b (aliases: W_PARTYMON1DATA)
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
	ld b, $0
	dec a
	ld c, a
	add hl, bc
	ld a, $fe
	ld [hl], a
	pop bc
	pop hl
	jr .asm_546a
.asm_5489
	ld hl, W_PARTYMON6DATA + W_PARTYMON1_MOVE4PP - W_PARTYMON1DATA ; $d267
	dec c
	jr nz, .asm_546a
	ld de, $c5d0
	ld hl, W_WATERRATE ; $d8a4
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
	ld hl, $d9a0
	dec c
	jr nz, .asm_5497
	ld a, $ac
	ld [$cf8d], a
	ld a, $d9
	ld [$cf8e], a
	xor a
	ld [$cc38], a
	ld a, $ff
	call PlaySound
	ld a, [$ffaa]
	cp $2
	ld c, $42
	call z, DelayFrames
	ld a, [W_ISLINKBATTLE] ; $d12b
	cp $3
	ld a, $32
	ld [W_ISLINKBATTLE], a ; $d12b
	jr nz, .asm_5506
	ld a, $4
	ld [W_ISLINKBATTLE], a ; $d12b
	ld a, SONY1 + $c8
	ld [W_CUROPPONENT], a ; $d059
	call ClearScreen
	call Delay3
	ld hl, W_OPTIONS ; $d355
	res 7, [hl]
	ld a, $2c
	call Predef ; indirect jump to InitOpponent (3ef18 (f:6f18))
	ld a, $7
	call Predef ; indirect jump to HealParty (f6a5 (3:76a5))
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
	ld a, [$cc38]
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
	ld hl, $cc3d
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [$cc37], a
	ld [$cc26], a
	ld [$cc2a], a
	ld [$cc34], a
	inc a
	ld [$cc42], a
	jp .asm_55dc
.asm_5557
	xor a
	ld [$cc37], a
	inc a
	ld [$cc49], a
	ld a, $a1
	ld [$cc29], a
	ld a, [$d89c]
	ld [$cc28], a
	ld a, $9
	ld [$cc24], a
	ld a, $1
	ld [$cc25], a
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
	ld a, [$cc28]
	ld c, a
	ld a, [$cc26]
	cp c
	jr c, .asm_559a ; 0x5591 $7
	ld a, [$cc28]
	dec a
	ld [$cc26], a
.asm_559a
	ld a, $1
	ld [$d11b], a
	callab Func_39bd5
	ld hl, wEnemyMons
	call Func_57d6
	jp .asm_565b
.asm_55b0
	bit 5, a
	jr z, .asm_55d4 ; 0x55b2 $20
	xor a
	ld [$cc49], a
	ld a, [$cc30]
	ld l, a
	ld a, [$cc31]
	ld h, a
	ld a, [$cc27]
	ld [hl], a
	ld a, [$cc26]
	ld b, a
	ld a, [$d163]
	dec a
	cp b
	jr nc, .asm_55dc ; 0x55cd $d
	ld [$cc26], a
	jr .asm_55dc ; 0x55d2 $8
.asm_55d4
	bit 7, a
	jp z, .asm_565b
	jp .asm_572f
.asm_55dc
	xor a
	ld [$cc49], a
	ld [$cc37], a
	ld a, $91
	ld [$cc29], a
	ld a, [$d163]
	ld [$cc28], a
	ld a, $1
	ld [$cc24], a
	ld a, $1
	ld [$cc25], a
	ld hl, $c3b5
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
	ld [$d11b], a
	callab Func_39bd5
	call Func_57d6
	jp .asm_565b
.asm_562e
	bit 4, a
	jr z, .asm_5654 ; 0x5630 $22
	ld a, $1
	ld [$cc49], a
	ld a, [$cc30]
	ld l, a
	ld a, [$cc31]
	ld h, a
	ld a, [$cc27]
	ld [hl], a
	ld a, [$cc26]
	ld b, a
	ld a, [$d89c]
	dec a
	cp b
	jr nc, .asm_5651 ; 0x564c $3
	ld [$cc26], a
.asm_5651
	jp .asm_5557
.asm_5654
	bit 7, a
	jr z, .asm_565b ; 0x5656 $3
	jp .asm_572f
.asm_565b
	ld a, [$cc49]
	and a
	jp z, .asm_5601
	jp .asm_5574
.asm_5665
	call SaveScreenTilesToBuffer1
	call PlaceUnfilledArrowMenuCursor
	ld a, [$cc28]
	ld c, a
	ld a, [$cc26]
	cp c
	jr c, .asm_5679 ; 0x5673 $4
	ld a, [$cc28]
	dec a
.asm_5679
	push af
	ld hl, $c4b8
	ld b, $2
	ld c, $12
	call Func_5ab3
	ld hl, $c4e2
	ld de, .statsTrade
	call PlaceString
	xor a
	ld [$cc26], a
	ld [$cc2a], a
	ld [$cc34], a
	ld [$cc28], a
	ld a, $10
	ld [$cc24], a
.asm_569f
	ld a, $7f
	ld [$c4eb], a
	ld a, $13
	ld [$cc29], a
	ld a, $1
	ld [$cc25], a
	call HandleMenuInput
	bit 4, a
	jr nz, .asm_56c3 ; 0x56b3 $e
	bit 1, a
	jr z, .asm_56df ; 0x56b7 $26
.asm_56b9
	pop af
	ld [$cc26], a
	call LoadScreenTilesFromBuffer1
	jp .asm_55dc
.asm_56c3
	ld a, $7f
	ld [$c4e1], a
	ld a, $23
	ld [$cc29], a
	ld a, $b
	ld [$cc25], a
	call HandleMenuInput
	bit 5, a
	jr nz, .asm_569f ; 0x56d7 $c6
	bit 1, a
	jr nz, .asm_56b9 ; 0x56db $dc
	jr .asm_56f9 ; 0x56dd $1a
.asm_56df
	pop af
	ld [$cc26], a
	ld a, $4
	ld [$d11b], a
	callab Func_39bd5
	call Func_57d6
	call LoadScreenTilesFromBuffer1
	jp .asm_55dc
.asm_56f9
	call PlaceUnfilledArrowMenuCursor
	pop af
	ld [$cc26], a
	ld [$cd3d], a
	ld [$cc42], a
	call Func_226e
	ld a, [$cc3d]
	cp $f
	jp z, Func_551c
	ld [$cd3e], a
	call Func_57c7
	ld a, $1
	ld [$cc38], a
	jp Func_551c
.statsTrade
	db "STATS     TRADE@"
.asm_572f
	ld a, [$cc26]
	ld b, a
	ld a, [$cc28]
	cp b
	jp nz, .asm_565b
	ld a, [$cc30]
	ld l, a
	ld a, [$cc31]
	ld h, a
	ld a, $7f
	ld [hl], a
.asm_5745
	ld a, $ed
	ld [$c4e1], a
.asm_574a
	call JoypadLowSensitivity
	ld a, [$ffb5]
	and a
	jr z, .asm_574a ; 0x5750 $f8
	bit 0, a
	jr nz, .asm_5769 ; 0x5754 $13
	bit 6, a
	jr z, .asm_574a ; 0x5758 $f0
	ld a, $7f
	ld [$c4e1], a
	ld a, [$d163]
	dec a
	ld [$cc26], a
	jp .asm_55dc
.asm_5769
	ld a, $ec
	ld [$c4e1], a
	ld a, $f
	ld [$cc42], a
	call Func_226e
	ld a, [$cc3d]
	cp $f
	jr nz, .asm_5745 ; 0x577b $c8

Func_577d: ; 577d (1:577d)
	call GBPalWhiteOutWithDelay3
	ld hl, $cfc4
	ld a, [hl]
	push af
	push hl
	res 0, [hl]
	xor a
	ld [$d72d], a
	dec a
	ld [$d42f], a
	call LoadMapData
	callba Func_c335
	pop hl
	pop af
	ld [hl], a
	call GBFadeIn2
	ret

Func_57a2:
	ld hl, $c4d7
	ld a, $7e
	ld bc, $0031
	call FillMemory
	ld hl, $c4cc
	ld b, $1
	ld c, $9
	call Func_5ab3
	ld hl, $c4e2
	ld de, CancelTextString
	jp PlaceString

CancelTextString:
	db "CANCEL@"

Func_57c7:
	ld a, [$cc3d]
	ld hl, $c455
	ld bc, $0014
	call AddNTimes
	ld [hl], $ec
	ret

Func_57d6:
	ld a, [$cc26]
	ld [wWhichPokemon], a
	ld a, $36
	call Predef
	ld a, $37
	call Predef
	call GBPalNormal
	call LoadTrainerInfoTextBoxTiles
	call Func_57f2
	jp Func_57a2

Func_57f2:
	ld hl, wTileMap
	ld b, $6
	ld c, $12
	call Func_5ab3
	ld hl, $c440
	ld b, $6
	ld c, $12
	call Func_5ab3
	ld hl, $c3a5
	ld de, W_PLAYERNAME
	call PlaceString
	ld hl, $c445
	ld de, $d887
	call PlaceString
	ld hl, $c3b6
	ld de, $d164
	call Func_5827
	ld hl, $c456
	ld de, $d89d

Func_5827:
	ld c, $0
.asm_5829
	ld a, [de]
	cp $ff
	ret z
	ld [$d11e], a
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
	ld [$cc43], a
	ld [$cc3e], a
	ld [$cc37], a
	ld [$cc34], a
	ld hl, $c490
	ld b, $4
	ld c, $12
	call Func_5ab3
	ld a, [$cd3d]
	ld hl, $d164
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [$d11e], a
	call GetMonName
	ld hl, $cd6d
	ld de, $cd3f
	ld bc, $000b
	call CopyData
	ld a, [$cd3e]
	ld hl, $d89d
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [$d11e], a
	call GetMonName
	ld hl, WillBeTradedText
	ld bc, $c4b9
	call TextCommandProcessor
	call SaveScreenTilesToBuffer1
	ld hl, $c436
	ld bc, $080b
	ld a, $5
	ld [$d12c], a
	ld a, $14
	ld [$d125], a
	call DisplayTextBoxID
	call LoadScreenTilesFromBuffer1
	ld a, [$cc26]
	and a
	jr z, .asm_58d9 ; 0x58b9 $1e
	ld a, $1
	ld [$cc42], a
	ld hl, $c490
	ld b, $4
	ld c, $12
	call Func_5ab3
	ld hl, $c4b9
	ld de, TradeCanceled
	call PlaceString
	call Func_226e
	jp Func_5a18
.asm_58d9
	ld a, $2
	ld [$cc42], a
	call Func_226e
	ld a, [$cc3d]
	dec a
	jr nz, .asm_58fd ; 0x58e5 $16
	ld hl, $c490
	ld b, $4
	ld c, $12
	call Func_5ab3
	ld hl, $c4b9
	ld de, TradeCanceled
	call PlaceString
	jp Func_5a18
.asm_58fd
	ld a, [$cd3d]
	ld hl, W_PARTYMON1OT ; OT names of player
	call SkipFixedLengthTextEntries
	ld de, $cd41
	ld bc, $000b
	call CopyData
	ld hl, $d16b
	ld a, [$cd3d]
	ld bc, $002c
	call AddNTimes
	ld bc, $000c
	add hl, bc
	ld a, [hli]
	ld [$cd4c], a
	ld a, [hl]
	ld [$cd4d], a
	ld a, [$cd3e]
	ld hl, W_ENEMYMON1OT ; OT names of other player
	call SkipFixedLengthTextEntries
	ld de, $cd4e
	ld bc, $000b
	call CopyData
	ld hl, wEnemyMons
	ld a, [$cd3e]
	ld bc, $002c
	call AddNTimes
	ld bc, $000c
	add hl, bc
	ld a, [hli]
	ld [$cd59], a
	ld a, [hl]
	ld [$cd5a], a
	ld a, [$cd3d]
	ld [wWhichPokemon], a
	ld hl, $d164
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [$cd3d], a
	xor a
	ld [$cf95], a
	call RemovePokemon
	ld a, [$cd3e]
	ld c, a
	ld [wWhichPokemon], a
	ld hl, $d89d
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [$cf91], a
	ld hl, wEnemyMons
	ld a, c
	ld bc, $002c
	call AddNTimes
	ld de, $cf98
	ld bc, $002c
	call CopyData
	call AddEnemyMonToPlayerParty
	ld a, [$d163]
	dec a
	ld [wWhichPokemon], a
	ld a, $1
	ld [$ccd4], a
	ld a, [$cd3e]
	ld hl, $d89d
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [$cd3e], a
	ld a, $a
	ld [wMusicHeaderPointer], a
	ld a, $2
	ld [$c0f0], a
	ld a, MUSIC_SAFARI_ZONE
	ld [$c0ee], a
	call PlaySound
	ld c, $64
	call DelayFrames
	call ClearScreen
	call LoadHpBarAndStatusTilePatterns
	xor a
	ld [$cc5b], a
	ld a, [$ffaa]
	cp $1
	jr z, .asm_59d9 ; 0x59d0 $7
	ld a, $38
	call Predef
	jr .asm_59de ; 0x59d7 $5
.asm_59d9
	ld a, $2f
	call Predef
.asm_59de
	callab Func_3ad0e
	call ClearScreen
	call LoadTrainerInfoTextBoxTiles
	call Func_226e
	ld c, $28
	call DelayFrames
	ld hl, $c490
	ld b, $4
	ld c, $12
	call Func_5ab3
	ld hl, $c4b9
	ld de, TradeCompleted
	call PlaceString
	ld a, $50
	call Predef
	ld c, $32
	call DelayFrames
	xor a
	ld [$cc38], a
	jp Func_5345

Func_5a18:
	ld c, $64
	call DelayFrames
	xor a
	ld [$cc38], a
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
	ld a, [W_ISLINKBATTLE] ; $d12b
	cp $2
	jr z, .asm_5a75
	cp $3
	jr z, .asm_5a75
	cp $5
	ret nz
	ld a, $4d
	call Predef ; indirect jump to Func_5aaf (5aaf (1:5aaf))
	jp Init
.asm_5a75
	call Func_5317
	ld hl, Club_GFX
	ld a, h
	ld [$d52f], a
	ld a, l
	ld [$d52e], a
	ld a, Bank(Club_GFX)
	ld [$d52b], a
	ld hl, Club_Coll
	ld a, h
	ld [$d531], a
	ld a, l
	ld [$d530], a
	xor a
	ld [W_GRASSRATE], a ; $d887
	inc a
	ld [W_ISLINKBATTLE], a ; $d12b
	ld [$ffb5], a
	ld a, $a
	ld [wMusicHeaderPointer], a
	ld a, BANK(Music_Celadon)
	ld [$c0f0], a
	ld a, MUSIC_CELADON
	ld [$c0ee], a
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
