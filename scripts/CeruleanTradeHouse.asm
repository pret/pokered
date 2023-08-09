CeruleanTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

CeruleanTradeHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanTradeHouseGrannyText,  TEXT_CERULEANTRADEHOUSE_GRANNY
	dw_const CeruleanTradeHouseTraderText,  TEXT_CERULEANTRADEHOUSE_TRADER

CeruleanTradeHouseGrannyText:
	text_far _CeruleanTradeHouseGrannyText
	text_end

CeruleanTradeHouseTraderText:
	text_asm
	ld a, TRADE_FOR_LOLA
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd
