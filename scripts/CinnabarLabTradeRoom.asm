CinnabarLabTradeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabTradeRoom_TextPointers:
	dw Lab2Text1
	dw Lab2Text2
	dw Lab2Text3
	dw CinnabarLabTrader

Lab2Text1:
	text_far _Lab2Text1
	text_end

Lab2Text2:
	text_asm
	ld a, TRADE_FOR_JENNY
	ld [wWhichTrade], a
	jr Lab2DoTrade

Lab2Text3:
	text_asm
	ld a, TRADE_FOR_CRINKLES
	ld [wWhichTrade], a
Lab2DoTrade:
	predef DoInGameTradeDialogue
	jp TextScriptEnd

CinnabarLabTrader:
	text_asm
	ld a, TRADE_WITH_SELF
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd