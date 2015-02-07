CeruleanHouse1Script: ; 1d6f6 (7:56f6)
	jp EnableAutoTextBoxDrawing

CeruleanHouse1TextPointers: ; 1d6f9 (7:56f9)
	dw CeruleanHouse1Text1
	dw CeruleanHouse1Text2

CeruleanHouse1Text1: ; 1d6fd (7:56fd)
	TX_FAR _CeruleanHouse1Text1
	db "@"

CeruleanHouse1Text2: ; 1d702 (7:5702)
	db $08 ; asm
	ld a, $6
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
