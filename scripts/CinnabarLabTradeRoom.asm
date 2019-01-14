CinnabarLabTradeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabTradeRoom_TextPointers:
	dw Lab2Text1
	dw Lab2Text2
	dw Lab2Text3

Lab2Text1:
	TX_FAR _Lab2Text1
	db "@"

Lab2Text2:
	TX_ASM
	ld a, $7
	ld [wWhichTrade], a
	jr Lab2DoTrade

Lab2Text3:
	TX_ASM
	ld a, $8
	ld [wWhichTrade], a
Lab2DoTrade:
	predef DoInGameTradeDialogue
	jp TextScriptEnd
