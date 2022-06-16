CeruleanRocketHouseB1F_Script:
	call EnableAutoTextBoxDrawing
	ret

CeruleanRocketHouseB1F_TextPointers:
	dw CeruleanRocketHouseB1FText1
	dw CeruleanRocketHouseB1FText2
	dw CeruleanRocketHouseB1FText3
	dw CeruleanRocketHouseB1FText4
	dw CeruleanRocketHouseB1FText5

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
	jp TextScriptEnd

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

