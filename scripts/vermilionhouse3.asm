VermilionHouse3Script:
	jp EnableAutoTextBoxDrawing

VermilionHouse3TextPointers:
	dw VermilionHouse3Text1

VermilionHouse3Text1:
	TX_ASM
	ld a, $4
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
