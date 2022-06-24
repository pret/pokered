UndergroundPathRoute5_Script:
	ld a, ROUTE_5
	ld [wLastMap], a
	ret

UndergroundPathEntranceRoute5_TextScriptEndingText:
	text_end

UndergroundPathRoute5_TextPointers:
	def_text_pointers
	dw_const UndergroundPathRoute5LittleGirlText, TEXT_UNDERGROUNDPATHROUTE5_LITTLE_GIRL

UndergroundPathRoute5LittleGirlText:
	text_asm
	ld a, TRADE_FOR_SPOT
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	ld hl, UndergroundPathEntranceRoute5_TextScriptEndingText
	ret
