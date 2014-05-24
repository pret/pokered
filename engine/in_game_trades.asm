Predef54: ; 71ad9 (1c:5ad9)
; trigger the trade offer/action specified by wWhichTrade
	call SaveScreenTilesToBuffer2
	ld hl,TradeMons
	ld a,[wWhichTrade]
	ld b,a
	swap a
	sub b
	sub b
	ld c,a
	ld b,$0
	add hl,bc
	ld a,[hli]
	ld [$cd0f],a
	ld a,[hli]
	ld [$cd34],a
	ld a,[hli]
	push af
	ld de,$cd29
	ld bc,$000b
	call CopyData
	pop af
	ld l,a
	ld h,$0
	ld de,InGameTradeTextPointers ; $5d64
	add hl,hl
	add hl,de
	ld a,[hli]
	ld [$cd10],a
	ld a,[hl]
	ld [$cd11],a
	ld a,[$cd0f]
	ld de,$cd13
	call Func_71b6a
	ld a,[$cd34]
	ld de,$cd1e
	call Func_71b6a
	ld hl,$d737
	ld a,[wWhichTrade]
	ld c,a
	ld b,$2
	ld a,$10
	call Predef
	ld a,c
	and a
	ld a,$4
	ld [$cd12],a
	jr nz,.asm_99bca ; 0x71b36 $20
	xor a
	ld [$cd12],a
	call .asm_99bca
	ld a,$1
	ld [$cd12],a
	call YesNoChoice
	ld a,[$cc26]
	and a
	jr nz,.asm_99bca ; 0x71b4b $b
	call Func_71c07
	jr c,.asm_99bca ; 0x71b50 $6
	ld hl, TradedForText
	call PrintText
.asm_99bca ; 0x71b58
	ld hl,$cd12
	ld a,[hld]
	ld e,a
	ld d,$0
	ld a,[hld]
	ld l,[hl]
	ld h,a
	add hl,de
	add hl,de
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp PrintText

Func_71b6a: ; 71b6a (1c:5b6a)
	push de
	ld [$d11e],a
	call GetMonName
	ld hl,$cd6d
	pop de
	ld bc,$b
	jp CopyData

INCLUDE "data/trades.asm"

Func_71c07: ; 71c07 (1c:5c07)
	xor a
	ld [$d07d],a
	dec a
	ld [$cfcb],a
	call DisplayPartyMenu
	push af
	call Func_71ca2
	pop af
	ld a,$1
	jp c,.asm_c4bc2
	ld a,[$cd0f]
	ld b,a
	ld a,[$cf91]
	cp b
	ld a,$2
	jr nz,.asm_c4bc2 ; 0x71c26 $75
	ld a,[wWhichPokemon]
	ld hl,$d18c
	ld bc,$002c
	call AddNTimes
	ld a,[hl]
	ld [$d127],a
	ld hl,$d737
	ld a,[wWhichTrade]
	ld c,a
	ld b,$1
	ld a,$10
	call Predef
	ld hl, ConnectCableText
	call PrintText
	ld a,[wWhichPokemon]
	push af
	ld a,[$d127]
	push af
	call LoadHpBarAndStatusTilePatterns
	call Func_71cc1
	ld a,$38
	call Predef
	pop af
	ld [$d127],a
	pop af
	ld [wWhichPokemon],a
	ld a,[$cd34]
	ld [$cf91],a
	xor a
	ld [$cc49],a
	ld [$cf95],a
	call RemovePokemon
	ld a,$80
	ld [$cc49],a
	call AddPokemonToParty
	call Func_71d19
	callab EvolveTradeMon
	call ClearScreen
	call Func_71ca2
	callba Func_eedc
	and a
	ld a,$3
	jr .asm_ee803 ; 0x71c9b $1
.asm_c4bc2 ; 0x71c9d
	scf
.asm_ee803 ; 0x71c9e
	ld [$cd12],a
	ret

Func_71ca2: ; 71ca2 (1c:5ca2)
	call GBPalWhiteOutWithDelay3
	call Func_3dbe
	call ReloadTilesetTilePatterns
	call LoadScreenTilesFromBuffer2
	call Delay3
	call LoadGBPal
	ld c, $a
	call DelayFrames
	ld b, BANK(LoadWildData)
	ld hl, LoadWildData
	jp Bankswitch

Func_71cc1: ; 71cc1 (1c:5cc1)
	ld hl, wWhichTrade ; $cd3d
	ld a, [$cd0f]
	ld [hli], a
	ld a, [$cd34]
	ld [hl], a
	ld hl, W_PARTYMON1OT ; $d273
	ld bc, $b
	ld a, [wWhichPokemon] ; $cf92
	call AddNTimes
	ld de, $cd41
	ld bc, $b
	call Func_71d11
	ld hl, String_71d59 ; $5d59
	ld de, $cd4e
	call Func_71d11
	ld de, W_GRASSRATE ; $d887
	call Func_71d11
	ld hl, W_PARTYMON1_OTID ; $d177
	ld bc, $2c
	ld a, [wWhichPokemon] ; $cf92
	call AddNTimes
	ld de, $cd4c
	ld bc, $2
	call Func_71d11
	call Random
	ld hl, hRandomAdd
	ld de, $cd59
	jp CopyData

Func_71d11: ; 71d11 (1c:5d11)
	push hl
	push bc
	call CopyData
	pop bc
	pop hl
	ret

Func_71d19: ; 71d19 (1c:5d19)
	ld hl, W_PARTYMON1NAME ; $d2b5
	ld bc, $b
	call Func_71d4f
	ld hl, $cd29
	ld bc, $b
	call CopyData
	ld hl, W_PARTYMON1OT ; $d273
	ld bc, $b
	call Func_71d4f
	ld hl, String_71d59 ; $5d59
	ld bc, $b
	call CopyData
	ld hl, W_PARTYMON1_OTID ; $d177
	ld bc, $2c
	call Func_71d4f
	ld hl, $cd59
	ld bc, $2
	jp CopyData

Func_71d4f: ; 71d4f (1c:5d4f)
	ld a, [W_NUMINPARTY] ; $d163
	dec a
	call AddNTimes
	ld e, l
	ld d, h
	ret

String_71d59: ; 71d59 (1c:5d59)
	; "TRAINER@@@@@@@@@@"
	db $5d, "@@@@@@@@@@"

InGameTradeTextPointers: ; 71d64 (1c:5d64)
	dw TradeTextPointers1
	dw TradeTextPointers2
	dw TradeTextPointers3

TradeTextPointers1: ; 71d6a (1c:5d6a)
	dw WannaTrade1Text
	dw NoTrade1Text
	dw WrongMon1Text
	dw Thanks1Text
	dw AfterTrade1Text

TradeTextPointers2: ; 71d74 (1c:5d74)
	dw WannaTrade2Text
	dw NoTrade2Text
	dw WrongMon2Text
	dw Thanks2Text
	dw AfterTrade2Text

TradeTextPointers3: ; 71d7e (1c:5d7e)
	dw WannaTrade3Text
	dw NoTrade3Text
	dw WrongMon3Text
	dw Thanks3Text
	dw AfterTrade3Text

ConnectCableText: ; 71d88 (1c:5d88)
	TX_FAR _ConnectCableText
	db "@"

TradedForText: ; 71d8d (1c:5d8d)
	TX_FAR _TradedForText
	db $11, $a, "@"

WannaTrade1Text: ; 71d94 (1c:5d94)
	TX_FAR _WannaTrade1Text
	db "@"

NoTrade1Text: ; 71d99 (1c:5d99)
	TX_FAR _NoTrade1Text
	db "@"

WrongMon1Text: ; 71d9e (1c:5d9e)
	TX_FAR _WrongMon1Text
	db "@"

Thanks1Text: ; 71da3 (1c:5da3)
	TX_FAR _Thanks1Text
	db "@"

AfterTrade1Text: ; 71da8 (1c:5da8)
	TX_FAR _AfterTrade1Text
	db "@"

WannaTrade2Text: ; 71dad (1c:5dad)
	TX_FAR _WannaTrade2Text
	db "@"

NoTrade2Text: ; 71db2 (1c:5db2)
	TX_FAR _NoTrade2Text
	db "@"

WrongMon2Text: ; 71db7 (1c:5db7)
	TX_FAR _WrongMon2Text
	db "@"

Thanks2Text: ; 71dbc (1c:5dbc)
	TX_FAR _Thanks2Text
	db "@"

AfterTrade2Text: ; 71dc1 (1c:5dc1)
	TX_FAR _AfterTrade2Text
	db "@"

WannaTrade3Text: ; 71dc6 (1c:5dc6)
	TX_FAR _WannaTrade3Text
	db "@"

NoTrade3Text: ; 71dcb (1c:5dcb)
	TX_FAR _NoTrade3Text
	db "@"

WrongMon3Text: ; 71dd0 (1c:5dd0)
	TX_FAR _WrongMon3Text
	db "@"

Thanks3Text: ; 71dd5 (1c:5dd5)
	TX_FAR _Thanks3Text
	db "@"

AfterTrade3Text: ; 71dda (1c:5dda)
	TX_FAR _AfterTrade3Text
	db "@"
