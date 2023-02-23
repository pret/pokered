; PureRGBnote: ADDED: basement room in the new house in cerulean. A big room with lots of interesting text to read.
; contains a secret vending machine that requires a pokemon with pay day in their moves in slot 1 of the party to use.
; contains a rocket NPC who will trade you an alternate palette magneton
; contains a big machine that will summon missingno when checked with A button.
; this floor is only accessible after becoming champion.
CeruleanRocketHouseB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanRocketHouse_ScriptPointers
	ld a, [wCeruleanRocketHouseCurScript]
	jp CallFunctionInTable

CeruleanRocketHouse_ScriptPointers:
	dw CeruleanRocketHouseScript0
	dw CeruleanRocketHouseMissingnoScript	

CeruleanRocketHouseScript0:
	ret

CeruleanRocketHouseB1F_TextPointers:
	dw CeruleanRocketHouseB1FText1
	dw CeruleanRocketHouseB1FText2
	dw CeruleanRocketHouseB1FText3
	dw CeruleanRocketHouseB1FText4
	dw CeruleanRocketHouseB1FText5
	dw CeruleanRocketHouseB1FText6

CeruleanRocketHouseB1FText1:
	text_asm
	ld a, [wCompletedInGameTradeFlags]
	bit TRADE_FOR_CHIKUCHIKU, a
	jr nz, .doneTrade
	ld hl, CeruleanRocketHouseB1FBeforeTradeText
	call PrintText
	ld a, TRADE_FOR_CHIKUCHIKU
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	ld a, [wCompletedInGameTradeFlags]
	bit TRADE_FOR_CHIKUCHIKU, a
	jr nz, .doneTrade
	jr .done
.doneTrade
	ld hl, CeruleanRocketHouseB1FAfterTradeText
	call PrintText
.done
	rst TextScriptEnd

CeruleanRocketHouseMissingnoScript:
	ld a, $FF
	ld [wJoyIgnore], a
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld b, 100
.loop
	push bc
	ld c, BANK(SFX_SS_Anne_Horn_1)
	ld a, SFX_SS_ANNE_HORN
	call PlayMusic
	ld c, 2
	call DelayFrames
	pop bc
	dec b
	jr nz, .loop
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld c, BANK(SFX_Noise_Instrument05_1)
	ld a, SFX_NOISE_INSTRUMENT05
	call PlayMusic
	call GBFadeOutToBlack
	ld b, $FF
	call DelayFrames
	ld a, MISSINGNO
	call PlayCry
	ld a, 120
	ld [wCurEnemyLVL], a
	ld a, MISSINGNO
	ld [wCurOpponent], a
	xor a
	ld [wJoyIgnore], a
	call GBPalNormal
	predef InitOpponent
	xor a
	ld [wCeruleanRocketHouseCurScript], a
	jp BattleOccurred




CeruleanRocketHouseB1FBeforeTradeText:
	text_far _CeruleanRocketHouseB1FBeforeTradeText
	text_end

CeruleanRocketHouseB1FAfterTradeText:
	text_far _CeruleanRocketHouseB1FAfterTradeText
	text_end

CeruleanRocketHouseB1FText2:
	text_far _CeruleanRocketHouseBasementEntranceText
	text_end

CeruleanRocketHouseB1FText3:
	text_far _CeruleanRocketHouseBasementBottomDoorText
	text_end

CeruleanRocketHouseB1FText4:
	text_far _CeruleanRocketHouseBasementTopDoorText
	text_end

CeruleanRocketHouseB1FText5:
	text_far _CeruleanRocketHouseB1FMapText
	text_end

CeruleanRocketHouseB1FText6:
	text_asm
	ld hl, wPartyMon1Moves
	ld b, NUM_MOVES
.checkMoves
	ld a, [hl]
	cp PAY_DAY
	jr z, .codeBroken
	inc hl
	dec b
	jr nz, .checkMoves
	ld hl, CeruleanRocketHouseCodeText
	call PrintText
	jr .done
.codeBroken
	farcall VendingMachineMenu
.done
	rst TextScriptEnd

CeruleanRocketHouseCodeText:
	text_far _CeruleanRocketHouseB1FCodeText
	text_end