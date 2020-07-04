VermilionTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionTradeHouse_TextPointers:
	dw VermilionHouse3Text1

VermilionHouse3Text1:
	text_asm
	ld a, $4
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
