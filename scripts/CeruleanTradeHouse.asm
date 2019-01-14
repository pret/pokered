CeruleanTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

CeruleanTradeHouse_TextPointers:
	dw CeruleanHouse1Text1
	dw CeruleanHouse1Text2

CeruleanHouse1Text1:
	TX_FAR _CeruleanHouse1Text1
	db "@"

CeruleanHouse1Text2:
	TX_ASM
	ld a, $6
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
