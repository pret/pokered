Func_410e2: ; 410e2 (10:50e2)
	ld a, [wWhichTrade] ; wWhichTrade
	ld [wcd5e], a
	ld a, [wTrainerEngageDistance]
	ld [wcd5f], a
	ld de, PointerIDs_41138 ; $5138
	jr Func_41102

Func_410f3: ; 410f3 (10:50f3)
	ld a, [wTrainerEngageDistance]
	ld [wcd5e], a
	ld a, [wTrainerSpriteOffset]
	ld [wcd5f], a
	ld de, PointerIDs_41149

Func_41102: ; 41102 (10:5102)
	ld a, [W_OPTIONS] ; W_OPTIONS
	push af
	ld a, [$ffaf]
	push af
	ld a, [$ffae]
	push af
	xor a
	ld [W_OPTIONS], a ; W_OPTIONS
	ld [$ffaf], a
	ld [$ffae], a
	push de
.asm_41115
	pop de
	ld a, [de]
	cp $ff
	jr z, .asm_4112d
	inc de
	push de
	ld hl, PointerTable_4115f ; $515f
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .asm_41115 ; $5115
	push de
	jp [hl]
.asm_4112d
	pop af
	ld [$ffae], a
	pop af
	ld [$ffaf], a
	pop af
	ld [W_OPTIONS], a ; W_OPTIONS
	ret

; these bytes refer to the $00th through $10th pointer of PointerTable_4115f
PointerIDs_41138: ; 41138 (10:5138)
	db $00,$01,$02,$03,$05,$07,$08,$09,$0A,$0B,$06,$08,$02,$04,$07,$0E,$FF

PointerIDs_41149: ; 41149 (10:5149)
	db $00,$08,$0D,$0B,$10,$05,$10,$08,$02,$04,$0F,$01,$02,$03,$10,$06,$10,$07,$08,$09,$0E,$FF

PointerTable_4115f: ; 4115f (10:515f)
	dw LoadTradingGFXAndMonNames
	dw Func_41245
	dw Func_41298
	dw Func_412d2
	dw Func_41336
	dw Func_41376
	dw Func_413c6
	dw Func_41181
	dw Func_415c8
	dw PrintTradeWentToText
	dw PrintTradeForSendsText
	dw PrintTradeFarewellText
	dw PrintTradeTakeCareText
	dw PrintTradeWillTradeText
	dw Func_4123b
	dw Func_415df
	dw Func_41217

Func_41181: ; 41181 (10:5181)
	ld c, $64
	jp DelayFrames

Func_41186: ; 41186 (10:5186)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ret

Delay50: ; 41191 (10:5191)
	ld c, $50
	jp DelayFrames

Func_41196: ; 41196 (10:5196)
	ld hl, wTileMap
	ld bc, $168
	ld a, $7f
	jp FillMemory

LoadTradingGFXAndMonNames: ; 411a1 (10:51a1)
	call Func_41196
	call DisableLCD
	ld hl, TradingAnimationGraphics ; $69be
	ld de, vChars2 + $310
	ld bc, $310
	ld a, BANK(TradingAnimationGraphics)
	call FarCopyData2
	ld hl, TradingAnimationGraphics2 ; $6cce
	ld de, vSprites + $7c0
	ld bc, $40
	ld a, BANK(TradingAnimationGraphics2)
	call FarCopyData2
	ld hl, vBGMap0
	ld bc, $800
	ld a, $7f
	call FillMemory
	call ClearSprites
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld hl, wd730
	set 6, [hl]
	ld a, [wOnSGB]
	and a
	ld a, $e4
	jr z, .asm_411e5
	ld a, $f0
.asm_411e5
	ld [rOBP0], a ; $ff48
	call EnableLCD
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, [wWhichTrade] ; wWhichTrade
	ld [wd11e], a
	call GetMonName
	ld hl, wcd6d
	ld de, wcf4b
	ld bc, $b
	call CopyData
	ld a, [wTrainerEngageDistance]
	ld [wd11e], a
	jp GetMonName

Func_4120b: ; 4120b (10:520b)
	ld a, $d0
	ld [rOBP1], a ; $ff49
	ld b, BANK(Func_7176c)
	ld hl, Func_7176c
	jp Bankswitch

Func_41217: ; 41217 (10:5217)
	ld hl, wPlayerName
	ld de, wHPBarMaxHP
	ld bc, $000b
	call CopyData
	ld hl, W_GRASSRATE
	ld de, wPlayerName
	ld bc, $000b
	call CopyData
	ld hl, wHPBarMaxHP
	ld de, W_GRASSRATE
	ld bc, $000b
	jp CopyData

Func_4123b: ; 4123b (10:523b)
	xor a
	call LoadGBPal
	ld hl, wd730
	res 6, [hl]
	ret

Func_41245: ; 41245 (10:5245)
	ld a, $ab
	ld [rLCDC], a ; $ff40
	ld a, $50
	ld [hWY], a
	ld a, $86
	ld [rWX], a ; $ff4b
	ld [$ffae], a
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	hlCoord 4, 0
	ld b, $6
	ld c, $a
	call TextBoxBorder
	call Func_42769
	ld b, $98
	call CopyScreenTileBufferToVRAM
	call ClearScreen
	ld a, [wWhichTrade] ; wWhichTrade
	call Func_415a4
	ld a, $7e
.asm_41273
	push af
	call DelayFrame
	pop af
	ld [rWX], a ; $ff4b
	ld [$ffae], a
	dec a
	dec a
	and a
	jr nz, .asm_41273
	call Delay50
	ld a, ANIM_AD
	call Func_41676
	ld a, ANIM_AA
	call Func_41676
	ld a, [wWhichTrade] ; wWhichTrade
	call PlayCry
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ret

Func_41298: ; 41298 (10:5298)
	call Func_41196
	ld b, $98
	call CopyScreenTileBufferToVRAM
	ld b, $8
	call GoPAL_SET
	ld hl, vBGMap1 + $8c
	call Func_414ae
	ld a, $a0
	ld [$ffae], a
	call DelayFrame
	ld a, $8b
	ld [rLCDC], a ; $ff40
	hlCoord 6, 2
	ld b, $7
	call Func_41842
	call Func_41186
	ld a, (SFX_02_3d - SFX_Headers_02) / 3
	call PlaySound
	ld c, $14
.asm_412c8
	ld a, [$ffae]
	add $4
	ld [$ffae], a
	dec c
	jr nz, .asm_412c8
	ret

Func_412d2: ; 412d2 (10:52d2)
	ld a, ANIM_AB
	call Func_41676
	ld c, 10
	call DelayFrames
	ld a, $e4
	ld [rOBP0], a ; $ff48
	xor a
	ld [wd09f], a
	ld bc, $2060
.asm_412e7
	push bc
	xor a
	ld de, UnknownOAM_4132e ; $532e
	call WriteOAMBlock
	ld a, [wd09f]
	xor $1
	ld [wd09f], a
	add $7e
	ld hl, wOAMBuffer + $02
	ld de, $4
	ld c, e
.asm_41300
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_41300
	call Delay3
	pop bc
	ld a, c
	add $4
	ld c, a
	cp $a0
	jr nc, .asm_41318
	ld a, (SFX_02_3c - SFX_Headers_02) / 3
	call PlaySound
	jr .asm_412e7
.asm_41318
	call ClearSprites
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call ClearScreen
	ld b, $98
	call CopyScreenTileBufferToVRAM
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ret

UnknownOAM_4132e: ; 4132e (10:532e)
	db $7E,$00,$7E,$20
	db $7E,$40,$7E,$60

Func_41336: ; 41336 (10:5336)
	ld a, ANIM_AC
	call Func_41676
	call Func_415c8
	hlCoord 4, 10
	ld b, $6
	ld c, $a
	call TextBoxBorder
	call Func_427a7
	call Func_41186
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, [wTrainerEngageDistance]
	call Func_415a4
	ld a, ANIM_AD
	call Func_41676
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, [wTrainerEngageDistance]
	call PlayCry
	call Func_41181
	hlCoord 4, 10
	ld bc, $80c
	call ClearScreenArea
	jp PrintTradeTakeCareText

Func_41376: ; 41376 (10:5376)
	call Func_41411
	ld a, $1
	ld [wd08a], a
	ld a, $e4
	ld [rOBP0], a ; $ff48
	ld a, $54
	ld [W_BASECOORDX], a ; wd081
	ld a, $1c
	ld [W_BASECOORDY], a ; wd082
	ld a, [wcd5e]
	ld [wcd5d], a
	call Func_41505
	call Func_4142d
	call Func_41186
	call Func_4149f
	ld hl, vBGMap1 + $8c
	call Func_414ae
	ld b, $6
	call Func_414c5
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Func_4149f
	ld b, $4
	call Func_414c5
	call Func_4145c
	ld b, $6
	call Func_414c5
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Func_41525
	jp ClearSprites

Func_413c6: ; 413c6 (10:53c6)
	call Func_41411
	xor a
	ld [wd08a], a
	ld a, $64
	ld [W_BASECOORDX], a ; wd081
	ld a, $44
	ld [W_BASECOORDY], a ; wd082
	ld a, [wcd5f]
	ld [wcd5d], a
	call Func_41505
	call Func_4145c
	call Func_41186
	call Func_4149f
	ld hl, vBGMap1 + $94
	call Func_414ae
	call Func_41525
	ld b, $6
	call Func_414c5
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Func_4149f
	ld b, $4
	call Func_414c5
	call Func_4142d
	ld b, $6
	call Func_414c5
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	jp ClearSprites

Func_41411: ; 41411 (10:5411)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call ClearScreen
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Func_4120b
	call DelayFrame
	ld a, $ab
	ld [rLCDC], a ; $ff40
	xor a
	ld [$ffae], a
	ld a, $90
	ld [hWY], a
	ret

Func_4142d: ; 4142d (10:542d)
	call Func_41196
	hlCoord 11, 4
	ld a, $5d
	ld [hli], a
	ld a, $5e
	ld c, $8
.asm_4143a
	ld [hli], a
	dec c
	jr nz, .asm_4143a
	hlCoord 5, 3
	ld b, $6
	call Func_41842
	hlCoord 4, 12
	ld b, $2
	ld c, $7
	call TextBoxBorder
	hlCoord 5, 14
	ld de, wPlayerName ; wd158
	call PlaceString
	jp DelayFrame

Func_4145c: ; 4145c (10:545c)
	call Func_41196
	hlCoord 0, 4
	ld a, $5e
	ld c, $e
.asm_41466
	ld [hli], a
	dec c
	jr nz, .asm_41466
	ld a, $5f
	ld [hl], a
	ld de, $14
	add hl, de
	ld a, $61
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld a, $60
	ld [hld], a
	ld a, $5d
	ld [hl], a
	hlCoord 7, 8
	ld b, $6
	call Func_41842
	hlCoord 6, 0
	ld b, $2
	ld c, $7
	call TextBoxBorder
	hlCoord 7, 2
	ld de, W_GRASSRATE ; W_GRASSRATE
	call PlaceString
	jp DelayFrame

Func_4149f: ; 4149f (10:549f)
	call Func_41196
	hlCoord 0, 4
	ld a, $5e
	ld c, $14
.asm_414a9
	ld [hli], a
	dec c
	jr nz, .asm_414a9
	ret

Func_414ae: ; 414ae (10:54ae)
	push hl
	hlCoord 0, 4
	call CopyToScreenEdgeTiles
	pop hl
	ld a, h
	ld [H_SCREENEDGEREDRAWADDR + 1], a
	ld a, l
	ld [H_SCREENEDGEREDRAWADDR], a ; $ffd1
	ld a, $2
	ld [H_SCREENEDGEREDRAW], a ; $ffd0
	ld c, $a
	jp DelayFrames

Func_414c5: ; 414c5 (10:54c5)
	ld a, [wd08a]
	ld e, a
	ld d, $8
.asm_414cb
	ld a, e
	dec a
	jr z, .asm_414d5
	ld a, [$ffae]
	sub $2
	jr .asm_414d9
.asm_414d5
	ld a, [$ffae]
	add $2
.asm_414d9
	ld [$ffae], a
	call DelayFrame
	dec d
	jr nz, .asm_414cb
	call Func_414e8
	dec b
	jr nz, Func_414c5
	ret

Func_414e8: ; 414e8 (10:54e8)
	push de
	push bc
	push hl
	ld a, [rBGP] ; $ff47
	xor $3c
	ld [rBGP], a ; $ff47
	ld hl, wOAMBuffer + $02
	ld de, $4
	ld c, $14
.asm_414f9
	ld a, [hl]
	xor $40
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_414f9
	pop hl
	pop bc
	pop de
	ret

Func_41505: ; 41505 (10:5505)
	callba Func_71882
	call Func_41558

Func_41510: ; 41510 (10:5510)
	ld hl, wOAMBuffer
	ld c, $14
.asm_41515
	ld a, [W_BASECOORDY] ; wd082
	add [hl]
	ld [hli], a
	ld a, [W_BASECOORDX] ; wd081
	add [hl]
	ld [hli], a
	inc hl
	inc hl
	dec c
	jr nz, .asm_41515
	ret

Func_41525: ; 41525 (10:5525)
	ld a, [wd08a]
	and a
	jr z, .asm_41536
	ld bc, $400
	call .asm_4153f
	ld bc, $a
	jr .asm_4153f
.asm_41536
	ld bc, $f6
	call .asm_4153f
	ld bc, $fc00
.asm_4153f
	ld a, b
	ld [W_BASECOORDX], a ; wd081
	ld a, c
	ld [W_BASECOORDY], a ; wd082
	ld d, $4
.asm_41549
	call Func_41510
	call Func_414e8
	ld c, $8
	call DelayFrames
	dec d
	jr nz, .asm_41549
	ret

Func_41558: ; 41558 (10:5558)
	ld hl, OAMPointers_41574 ; $5574
	ld c, $4
	xor a
.asm_4155e
	push bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	push hl
	inc a
	push af
	call WriteOAMBlock
	pop af
	pop hl
	pop bc
	dec c
	jr nz, .asm_4155e
	ret

OAMPointers_41574: ; 41574 (10:5574)
	dw UnknownOAM_41584
	db $08,$08
	dw UnknownOAM_4158c
	db $18,$08
	dw UnknownOAM_41594
	db $08,$18
	dw UnknownOAM_4159c
	db $18,$18

UnknownOAM_41584: ; 41584 (10:5584)
	db $38,$10,$39,$10
	db $3A,$10,$3B,$10

UnknownOAM_4158c: ; 4158c (10:558c)
	db $39,$30,$38,$30
	db $3B,$30,$3A,$30

UnknownOAM_41594: ; 41594 (10:5594)
	db $3A,$50,$3B,$50
	db $38,$50,$39,$50

UnknownOAM_4159c: ; 4159c (10:559c)
	db $3B,$70,$3A,$70
	db $39,$70,$38,$70

Func_415a4: ; 415a4 (10:55a4)
	ld [wcf91], a
	ld [wd0b5], a
	ld [wcf1d], a
	ld b, $b
	ld c, $0
	call GoPAL_SET
	ld a, [H_AUTOBGTRANSFERENABLED] ; $ffba
	xor $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call GetMonHeader
	hlCoord 7, 2
	call LoadFlippedFrontSpriteByMonIndex
	ld c, $a
	jp DelayFrames

Func_415c8: ; 415c8 (10:55c8)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call ClearScreen
	ld a, $e3
	ld [rLCDC], a ; $ff40
	ld a, $7
	ld [rWX], a ; $ff4b
	xor a
	ld [hWY], a
	ld a, $90
	ld [$ffae], a
	ret

Func_415df: ; 415df (10:55df)
	ld c, $32
	call DelayFrames
.asm_415e4
	call DelayFrame
	ld a, [rWX] ; $ff4b
	inc a
	inc a
	ld [rWX], a ; $ff4b
	cp $a1
	jr nz, .asm_415e4
	call Func_41196
	ld c, $a
	call DelayFrames
	ld a, $7
	ld [rWX], a ; $ff4b
	ret

PrintTradeWentToText: ; 415fe (10:55fe)
	ld hl, TradeWentToText
	call PrintText
	ld c, $c8
	call DelayFrames
	jp Func_415df

TradeWentToText: ; 4160c (10:560c)
	TX_FAR _TradeWentToText
	db "@"

PrintTradeForSendsText: ; 41611 (10:5611)
	ld hl, TradeForText
	call PrintText
	call Delay50
	ld hl, TradeSendsText
	call PrintText
	jp Delay50

TradeForText: ; 41623 (10:5623)
	TX_FAR _TradeForText
	db "@"

TradeSendsText: ; 41628 (10:5628)
	TX_FAR _TradeSendsText
	db "@"

PrintTradeFarewellText: ; 4162d (10:562d)
	ld hl, TradeWavesFarewellText
	call PrintText
	call Delay50
	ld hl, TradeTransferredText
	call PrintText
	call Delay50
	jp Func_415df

TradeWavesFarewellText: ; 41642 (10:5642)
	TX_FAR _TradeWavesFarewellText
	db "@"

TradeTransferredText: ; 41647 (10:5647)
	TX_FAR _TradeTransferredText
	db "@"

PrintTradeTakeCareText: ; 4164c (10:564c)
	ld hl, TradeTakeCareText
	call PrintText
	jp Delay50

TradeTakeCareText: ; 41655 (10:5655)
	TX_FAR _TradeTakeCareText
	db "@"

PrintTradeWillTradeText: ; 4165a (10:565a)
	ld hl, TradeWillTradeText
	call PrintText
	call Delay50
	ld hl, TradeforText
	call PrintText
	jp Delay50

TradeWillTradeText: ; 4166c (10:566c)
	TX_FAR _TradeWillTradeText
	db "@"

TradeforText: ; 41671 (10:5671)
	TX_FAR _TradeforText
	db "@"

Func_41676: ; 41676 (10:5676)
	ld [W_ANIMATIONID], a ; W_ANIMATIONID
	xor a
	ld [wcc5b], a
	predef_jump MoveAnimation
