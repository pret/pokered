CinnabarLabTradeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabTradeRoom_TextPointers:
	dw Lab2Text1
	dw Lab2Text2
	dw Lab2Text3

Lab2Text1:
	text_far _Lab2Text1
	text_end

Lab2Text2:
	text_asm
	ld a, TRADE_FOR_DORIS
	ld [wWhichTrade], a
	jr Lab2DoTrade

Lab2Text3:
	text_asm
	ld a, TRADE_FOR_CRINKLES
	ld [wWhichTrade], a
Lab2DoTrade:
	predef DoInGameTradeDialogue
	jp TextScriptEnd
