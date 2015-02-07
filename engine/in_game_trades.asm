DoInGameTradeDialogue: ; 71ad9 (1c:5ad9)
; trigger the trade offer/action specified by wWhichTrade
	call SaveScreenTilesToBuffer2
	ld hl,TradeMons
	ld a,[wWhichTrade]
	ld b,a
	swap a
	sub b
	sub b
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hli]
	ld [wInGameTradeGiveMonSpecies],a
	ld a,[hli]
	ld [wInGameTradeReceiveMonSpecies],a
	ld a,[hli]
	push af
	ld de,wInGameTradeMonNick
	ld bc,$000b
	call CopyData
	pop af
	ld l,a
	ld h,$0
	ld de,InGameTradeTextPointers ; $5d64
	add hl,hl
	add hl,de
	ld a,[hli]
	ld [wInGameTradeTextPointerTablePointer],a
	ld a,[hl]
	ld [wInGameTradeTextPointerTablePointer + 1],a
	ld a,[wInGameTradeGiveMonSpecies]
	ld de,wInGameTradeGiveMonName
	call InGameTrade_GetMonName
	ld a,[wInGameTradeReceiveMonSpecies]
	ld de,wInGameTradeReceiveMonName
	call InGameTrade_GetMonName
	ld hl,wCompletedInGameTradeFlags
	ld a,[wWhichTrade]
	ld c,a
	ld b,$2
	predef FlagActionPredef
	ld a,c
	and a
	ld a,$4
	ld [wInGameTradeTextPointerTableIndex],a
	jr nz,.printText
; if the trade hasn't been done yet
	xor a
	ld [wInGameTradeTextPointerTableIndex],a
	call .printText
	ld a,$1
	ld [wInGameTradeTextPointerTableIndex],a
	call YesNoChoice
	ld a,[wCurrentMenuItem]
	and a
	jr nz,.printText
	call InGameTrade_DoTrade
	jr c,.printText
	ld hl, TradedForText
	call PrintText
.printText
	ld hl,wInGameTradeTextPointerTableIndex
	ld a,[hld] ; wInGameTradeTextPointerTableIndex
	ld e,a
	ld d,0
	ld a,[hld] ; wInGameTradeTextPointerTablePointer + 1
	ld l,[hl] ; wInGameTradeTextPointerTablePointer
	ld h,a
	add hl,de
	add hl,de
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp PrintText

; copies name of species a to hl
InGameTrade_GetMonName: ; 71b6a (1c:5b6a)
	push de
	ld [wd11e],a
	call GetMonName
	ld hl,wcd6d
	pop de
	ld bc,$b
	jp CopyData

INCLUDE "data/trades.asm"

InGameTrade_DoTrade: ; 71c07 (1c:5c07)
	xor a
	ld [wd07d],a
	dec a
	ld [wUpdateSpritesEnabled],a
	call DisplayPartyMenu
	push af
	call InGameTrade_RestoreScreen
	pop af
	ld a,$1
	jp c,.tradeFailed ; jump if the player didn't select a pokemon
	ld a,[wInGameTradeGiveMonSpecies]
	ld b,a
	ld a,[wcf91]
	cp b
	ld a,$2
	jr nz,.tradeFailed ; jump if the selected mon's species is not the required one
	ld a,[wWhichPokemon]
	ld hl,wPartyMon1Level
	ld bc,$002c
	call AddNTimes
	ld a,[hl]
	ld [W_CURENEMYLVL],a
	ld hl,wCompletedInGameTradeFlags
	ld a,[wWhichTrade]
	ld c,a
	ld b,$1
	predef FlagActionPredef
	ld hl, ConnectCableText
	call PrintText
	ld a,[wWhichPokemon]
	push af
	ld a,[W_CURENEMYLVL]
	push af
	call LoadHpBarAndStatusTilePatterns
	call InGameTrade_PrepareTradeData
	predef Func_410e2
	pop af
	ld [W_CURENEMYLVL],a
	pop af
	ld [wWhichPokemon],a
	ld a,[wInGameTradeReceiveMonSpecies]
	ld [wcf91],a
	xor a
	ld [wcc49],a
	ld [wcf95],a
	call RemovePokemon
	ld a,$80
	ld [wcc49],a
	call AddPartyMon
	call InGameTrade_CopyDataToReceivedMon
	callab EvolveTradeMon
	call ClearScreen
	call InGameTrade_RestoreScreen
	callba RedrawMapView
	and a
	ld a,$3
	jr .tradeSucceeded
.tradeFailed
	scf
.tradeSucceeded
	ld [wInGameTradeTextPointerTableIndex],a
	ret

InGameTrade_RestoreScreen: ; 71ca2 (1c:5ca2)
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call ReloadTilesetTilePatterns
	call LoadScreenTilesFromBuffer2
	call Delay3
	call LoadGBPal
	ld c, 10
	call DelayFrames
	ld b, BANK(LoadWildData)
	ld hl, LoadWildData
	jp Bankswitch

InGameTrade_PrepareTradeData: ; 71cc1 (1c:5cc1)
	ld hl, wTradedPlayerMonSpecies
	ld a, [wInGameTradeGiveMonSpecies]
	ld [hli], a ; wTradedPlayerMonSpecies
	ld a, [wInGameTradeReceiveMonSpecies]
	ld [hl], a ; wTradedEnemyMonSpecies
	ld hl, wPartyMonOT
	ld bc, $b
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wTradedPlayerMonOT
	ld bc, $b
	call InGameTrade_CopyData
	ld hl, InGameTrade_TrainerString
	ld de, wcd4e
	call InGameTrade_CopyData
	ld de, W_GRASSRATE
	call InGameTrade_CopyData
	ld hl, wPartyMon1OTID
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wTradedPlayerMonOTID
	ld bc, $2
	call InGameTrade_CopyData
	call Random
	ld hl, hRandomAdd
	ld de, wTradedEnemyMonOTID
	jp CopyData

InGameTrade_CopyData: ; 71d11 (1c:5d11)
	push hl
	push bc
	call CopyData
	pop bc
	pop hl
	ret

InGameTrade_CopyDataToReceivedMon: ; 71d19 (1c:5d19)
	ld hl, wPartyMonNicks
	ld bc, $b
	call InGameTrade_GetReceivedMonPointer
	ld hl, wInGameTradeMonNick
	ld bc, $b
	call CopyData
	ld hl, wPartyMonOT
	ld bc, $b
	call InGameTrade_GetReceivedMonPointer
	ld hl, InGameTrade_TrainerString
	ld bc, $b
	call CopyData
	ld hl, wPartyMon1OTID
	ld bc, wPartyMon2 - wPartyMon1
	call InGameTrade_GetReceivedMonPointer
	ld hl, wTradedEnemyMonOTID
	ld bc, $2
	jp CopyData

; the received mon's index is (partyCount - 1),
; so this adds bc to hl (partyCount - 1) times and moves the result to de
InGameTrade_GetReceivedMonPointer: ; 71d4f (1c:5d4f)
	ld a, [wPartyCount]
	dec a
	call AddNTimes
	ld e, l
	ld d, h
	ret

InGameTrade_TrainerString: ; 71d59 (1c:5d59)
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
