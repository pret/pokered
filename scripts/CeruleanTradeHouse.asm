CeruleanTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

CeruleanTradeHouse_TextPointers:
	dw CeruleanHouse1Text1
	dw CeruleanHouse1Text2

CeruleanHouse1Text1:
	text_far _CeruleanHouse1Text1
	text_end

CeruleanHouse1Text2:
	text_asm
	ld a, TRADE_FOR_LOLA
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
