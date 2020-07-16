UndergroundPathRoute5_Script:
	ld a, ROUTE_5
	ld [wLastMap], a
	ret

UndergroundPathEntranceRoute5_TextScriptEndingText:
	text_end

UndergroundPathRoute5_TextPointers:
	dw UndergroundPathEntranceRoute5Text1

UndergroundPathEntranceRoute5Text1:
	text_asm
	ld a, TRADE_FOR_SPOT
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	ld hl, UndergroundPathEntranceRoute5_TextScriptEndingText
	ret
