CeladonUniversityInside_Script:
	jp EnableAutoTextBoxDrawing

CeladonUniversityInside_TextPointers:
	dw CeladonUniversityInsideText1
	dw CeladonUniversityTrader

CeladonUniversityInsideText1:
	text_far _CeladonUniversityInsideText1
	text_end

CeladonUniversityTrader:
	text_asm
	ld a, TRADE_WITH_SELF
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

	text_end ; unused
