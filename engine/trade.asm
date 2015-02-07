Func_410e2: ; 410e2 (10:50e2)
	ld a, [wTradedPlayerMonSpecies]
	ld [wcd5e], a
	ld a, [wTradedEnemyMonSpecies]
	ld [wcd5f], a
	ld de, PointerIDs_41138
	jr Func_41102

Func_410f3: ; 410f3 (10:50f3)
	ld a, [wTradedEnemyMonSpecies]
	ld [wcd5e], a
	ld a, [wTrainerSpriteOffset]
	ld [wcd5f], a
	ld de, PointerIDs_41149

Func_41102: ; 41102 (10:5102)
	ld a, [W_OPTIONS]
	push af
	ld a, [hSCY]
	push af
	ld a, [hSCX]
	push af
	xor a
	ld [W_OPTIONS], a
	ld [hSCY], a
	ld [hSCX], a
	push de
.asm_41115
	pop de
	ld a, [de]
	cp $ff
	jr z, .asm_4112d
	inc de
	push de
	ld hl, PointerTable_4115f
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .asm_41115
	push de
	jp [hl]
.asm_4112d
	pop af
	ld [hSCX], a
	pop af
	ld [hSCY], a
	pop af
	ld [W_OPTIONS], a
	ret

; these bytes refer to the $00th through $10th pointer of PointerTable_4115f
PointerIDs_41138: ; 41138 (10:5138)
	db $00,$01,$02,$03,$05,$07,$08,$09,$0A,$0B,$06,$08,$02,$04,$07,$0E,$FF

PointerIDs_41149: ; 41149 (10:5149)
	db $00,$08,$0D,$0B,$10,$05,$10,$08,$02,$04,$0F,$01,$02,$03,$10,$06,$10,$07,$08,$09,$0E,$FF

PointerTable_4115f: ; 4115f (10:515f)
	dw LoadTradingGFXAndMonNames
	dw Trade_ShowPlayerMon
	dw Trade_DrawOpenEndOfLinkCable
	dw Trade_AnimateBallEnteringLinkCable
	dw Trade_ShowEnemyMon
	dw Func_41376
	dw Func_413c6
	dw Trade_Delay100
	dw Func_415c8
	dw PrintTradeWentToText
	dw PrintTradeForSendsText
	dw PrintTradeFarewellText
	dw PrintTradeTakeCareText
	dw PrintTradeWillTradeText
	dw Func_4123b
	dw Func_415df
	dw Trade_SwapNames

Trade_Delay100: ; 41181 (10:5181)
	ld c, 100
	jp DelayFrames

Trade_CopyTileMapToVRAM: ; 41186 (10:5186)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

Trade_Delay80: ; 41191 (10:5191)
	ld c, 80
	jp DelayFrames

Trade_ClearTileMap: ; 41196 (10:5196)
	ld hl, wTileMap
	ld bc, 20 * 18
	ld a, " "
	jp FillMemory

LoadTradingGFXAndMonNames: ; 411a1 (10:51a1)
	call Trade_ClearTileMap
	call DisableLCD
	ld hl, TradingAnimationGraphics
	ld de, vChars2 + $310
	ld bc, $310
	ld a, BANK(TradingAnimationGraphics)
	call FarCopyData2
	ld hl, TradingAnimationGraphics2
	ld de, vSprites + $7c0
	ld bc, $40
	ld a, BANK(TradingAnimationGraphics2)
	call FarCopyData2
	ld hl, vBGMap0
	ld bc, $800
	ld a, " "
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
	ld [rOBP0], a
	call EnableLCD
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, [wTradedPlayerMonSpecies]
	ld [wd11e], a
	call GetMonName
	ld hl, wcd6d
	ld de, wcf4b
	ld bc, $b
	call CopyData
	ld a, [wTradedEnemyMonSpecies]
	ld [wd11e], a
	jp GetMonName

Func_4120b: ; 4120b (10:520b)
	ld a, %11010000
	ld [rOBP1], a
	ld b, BANK(Func_7176c)
	ld hl, Func_7176c
	jp Bankswitch

Trade_SwapNames: ; 41217 (10:5217)
	ld hl, wPlayerName
	ld de, wBuffer
	ld bc, 11
	call CopyData
	ld hl, wLinkEnemyTrainerName
	ld de, wPlayerName
	ld bc, 11
	call CopyData
	ld hl, wBuffer
	ld de, wLinkEnemyTrainerName
	ld bc, 11
	jp CopyData

Func_4123b: ; 4123b (10:523b)
	xor a
	call LoadGBPal
	ld hl, wd730
	res 6, [hl]
	ret

Trade_ShowPlayerMon: ; 41245 (10:5245)
	ld a, %10101011
	ld [rLCDC], a
	ld a, $50
	ld [hWY], a
	ld a, $86
	ld [rWX], a
	ld [hSCX], a
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	hlCoord 4, 0
	ld b, 6
	ld c, 10
	call TextBoxBorder
	call Trade_PrintPlayerMonInfoText
	ld b, $98
	call CopyScreenTileBufferToVRAM
	call ClearScreen
	ld a, [wTradedPlayerMonSpecies]
	call Trade_LoadMonSprite
	ld a, $7e
.slideScreenLoop
	push af
	call DelayFrame
	pop af
	ld [rWX], a
	ld [hSCX], a
	dec a
	dec a
	and a
	jr nz, .slideScreenLoop
	call Trade_Delay80
	ld a, TRADE_BALL_POOF_ANIM
	call Trade_ShowAnimation
	ld a, TRADE_BALL_DROP_ANIM
	call Trade_ShowAnimation
	ld a, [wTradedPlayerMonSpecies]
	call PlayCry
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

Trade_DrawOpenEndOfLinkCable: ; 41298 (10:5298)
	call Trade_ClearTileMap
	ld b, $98
	call CopyScreenTileBufferToVRAM
	ld b, $8
	call GoPAL_SET
	ld hl, vBGMap1 + $8c
	call Trade_RedrawRows4And5
	ld a, $a0
	ld [hSCX], a
	call DelayFrame
	ld a, %10001011
	ld [rLCDC], a
	hlCoord 6, 2
	ld b, $7 ; open end of link cable tile ID list index
	call CopyTileIDsFromList_ZeroBaseTileID
	call Trade_CopyTileMapToVRAM
	ld a, (SFX_02_3d - SFX_Headers_02) / 3
	call PlaySound
	ld c, 20
.loop
	ld a, [hSCX]
	add 4
	ld [hSCX], a
	dec c
	jr nz, .loop
	ret

Trade_AnimateBallEnteringLinkCable: ; 412d2 (10:52d2)
	ld a, TRADE_BALL_SHAKE_ANIM
	call Trade_ShowAnimation
	ld c, 10
	call DelayFrames
	ld a, %11100100
	ld [rOBP0], a
	xor a
	ld [wd09f], a
	ld bc, $2060
.moveBallInsideLinkCableLoop
	push bc
	xor a
	ld de, Trade_BallInsideLinkCableOAM
	call WriteOAMBlock
	ld a, [wd09f]
	xor $1
	ld [wd09f], a
	add $7e
	ld hl, wOAMBuffer + $02
	ld de, $4
	ld c, e
.cycleSpriteFramesLoop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .cycleSpriteFramesLoop
	call Delay3
	pop bc
	ld a, c
	add $4
	ld c, a
	cp $a0
	jr nc, .ballSpriteReachedEdgeOfScreen
	ld a, (SFX_02_3c - SFX_Headers_02) / 3
	call PlaySound
	jr .moveBallInsideLinkCableLoop
.ballSpriteReachedEdgeOfScreen
	call ClearSprites
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call ClearScreen
	ld b, $98
	call CopyScreenTileBufferToVRAM
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

Trade_BallInsideLinkCableOAM: ; 4132e (10:532e)
	db $7E,$00,$7E,$20
	db $7E,$40,$7E,$60

Trade_ShowEnemyMon: ; 41336 (10:5336)
	ld a, TRADE_BALL_TILT_ANIM
	call Trade_ShowAnimation
	call Func_415c8
	hlCoord 4, 10
	ld b, 6
	ld c, 10
	call TextBoxBorder
	call Trade_PrintEnemyMonInfoText
	call Trade_CopyTileMapToVRAM
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, [wTradedEnemyMonSpecies]
	call Trade_LoadMonSprite
	ld a, TRADE_BALL_POOF_ANIM
	call Trade_ShowAnimation
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, [wTradedEnemyMonSpecies]
	call PlayCry
	call Trade_Delay100
	hlCoord 4, 10
	ld bc, $80c
	call ClearScreenArea
	jp PrintTradeTakeCareText

Func_41376: ; 41376 (10:5376)
	call Func_41411
	ld a, $1
	ld [wd08a], a
	ld a, $e4
	ld [rOBP0], a
	ld a, $54
	ld [W_BASECOORDX], a
	ld a, $1c
	ld [W_BASECOORDY], a
	ld a, [wcd5e]
	ld [wcd5d], a
	call Func_41505
	call Func_4142d
	call Trade_CopyTileMapToVRAM
	call Func_4149f
	ld hl, vBGMap1 + $8c
	call Trade_RedrawRows4And5
	ld b, $6
	call Func_414c5
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Func_4149f
	ld b, $4
	call Func_414c5
	call Func_4145c
	ld b, $6
	call Func_414c5
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	call Func_41525
	jp ClearSprites

Func_413c6: ; 413c6 (10:53c6)
	call Func_41411
	xor a
	ld [wd08a], a
	ld a, $64
	ld [W_BASECOORDX], a
	ld a, $44
	ld [W_BASECOORDY], a
	ld a, [wcd5f]
	ld [wcd5d], a
	call Func_41505
	call Func_4145c
	call Trade_CopyTileMapToVRAM
	call Func_4149f
	ld hl, vBGMap1 + $94
	call Trade_RedrawRows4And5
	call Func_41525
	ld b, $6
	call Func_414c5
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Func_4149f
	ld b, $4
	call Func_414c5
	call Func_4142d
	ld b, $6
	call Func_414c5
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	jp ClearSprites

Func_41411: ; 41411 (10:5411)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call ClearScreen
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	call Func_4120b
	call DelayFrame
	ld a, %10101011
	ld [rLCDC], a
	xor a
	ld [hSCX], a
	ld a, $90
	ld [hWY], a
	ret

Func_4142d: ; 4142d (10:542d)
	call Trade_ClearTileMap
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
	call CopyTileIDsFromList_ZeroBaseTileID
	hlCoord 4, 12
	ld b, 2
	ld c, 7
	call TextBoxBorder
	hlCoord 5, 14
	ld de, wPlayerName
	call PlaceString
	jp DelayFrame

Func_4145c: ; 4145c (10:545c)
	call Trade_ClearTileMap
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
	call CopyTileIDsFromList_ZeroBaseTileID
	hlCoord 6, 0
	ld b, $2
	ld c, $7
	call TextBoxBorder
	hlCoord 7, 2
	ld de, wLinkEnemyTrainerName
	call PlaceString
	jp DelayFrame

Func_4149f: ; 4149f (10:549f)
	call Trade_ClearTileMap
	hlCoord 0, 4
	ld a, $5e
	ld c, $14
.asm_414a9
	ld [hli], a
	dec c
	jr nz, .asm_414a9
	ret

Trade_RedrawRows4And5: ; 414ae (10:54ae)
	push hl
	hlCoord 0, 4
	call CopyToScreenEdgeTiles
	pop hl
	ld a, h
	ld [H_SCREENEDGEREDRAWADDR + 1], a
	ld a, l
	ld [H_SCREENEDGEREDRAWADDR], a
	ld a, REDRAWROW
	ld [H_SCREENEDGEREDRAW], a
	ld c, 10
	jp DelayFrames

Func_414c5: ; 414c5 (10:54c5)
	ld a, [wd08a]
	ld e, a
	ld d, $8
.asm_414cb
	ld a, e
	dec a
	jr z, .asm_414d5
	ld a, [hSCX]
	sub $2
	jr .asm_414d9
.asm_414d5
	ld a, [hSCX]
	add $2
.asm_414d9
	ld [hSCX], a
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
	ld a, [rBGP]
	xor $3c
	ld [rBGP], a
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
	ld a, [W_BASECOORDY]
	add [hl]
	ld [hli], a
	ld a, [W_BASECOORDX]
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
	ld [W_BASECOORDX], a
	ld a, c
	ld [W_BASECOORDY], a
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
	ld hl, OAMPointers_41574
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

; a = species
Trade_LoadMonSprite: ; 415a4 (10:55a4)
	ld [wcf91], a
	ld [wd0b5], a
	ld [wcf1d], a
	ld b, $b
	ld c, $0
	call GoPAL_SET
	ld a, [H_AUTOBGTRANSFERENABLED]
	xor $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call GetMonHeader
	hlCoord 7, 2
	call LoadFlippedFrontSpriteByMonIndex
	ld c, 10
	jp DelayFrames

Func_415c8: ; 415c8 (10:55c8)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call ClearScreen
	ld a, %11100011
	ld [rLCDC], a
	ld a, $7
	ld [rWX], a
	xor a
	ld [hWY], a
	ld a, $90
	ld [hSCX], a
	ret

Func_415df: ; 415df (10:55df)
	ld c, 50
	call DelayFrames
.loop
	call DelayFrame
	ld a, [rWX]
	inc a
	inc a
	ld [rWX], a
	cp $a1
	jr nz, .loop
	call Trade_ClearTileMap
	ld c, 10
	call DelayFrames
	ld a, $7
	ld [rWX], a
	ret

PrintTradeWentToText: ; 415fe (10:55fe)
	ld hl, TradeWentToText
	call PrintText
	ld c, 200
	call DelayFrames
	jp Func_415df

TradeWentToText: ; 4160c (10:560c)
	TX_FAR _TradeWentToText
	db "@"

PrintTradeForSendsText: ; 41611 (10:5611)
	ld hl, TradeForText
	call PrintText
	call Trade_Delay80
	ld hl, TradeSendsText
	call PrintText
	jp Trade_Delay80

TradeForText: ; 41623 (10:5623)
	TX_FAR _TradeForText
	db "@"

TradeSendsText: ; 41628 (10:5628)
	TX_FAR _TradeSendsText
	db "@"

PrintTradeFarewellText: ; 4162d (10:562d)
	ld hl, TradeWavesFarewellText
	call PrintText
	call Trade_Delay80
	ld hl, TradeTransferredText
	call PrintText
	call Trade_Delay80
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
	jp Trade_Delay80

TradeTakeCareText: ; 41655 (10:5655)
	TX_FAR _TradeTakeCareText
	db "@"

PrintTradeWillTradeText: ; 4165a (10:565a)
	ld hl, TradeWillTradeText
	call PrintText
	call Trade_Delay80
	ld hl, TradeforText
	call PrintText
	jp Trade_Delay80

TradeWillTradeText: ; 4166c (10:566c)
	TX_FAR _TradeWillTradeText
	db "@"

TradeforText: ; 41671 (10:5671)
	TX_FAR _TradeforText
	db "@"

Trade_ShowAnimation: ; 41676 (10:5676)
	ld [W_ANIMATIONID], a
	xor a
	ld [wcc5b], a
	predef_jump MoveAnimation
