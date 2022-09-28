CeladonUniversityInside_Script:
	jp EnableAutoTextBoxDrawing

CeladonUniversityInside_TextPointers:
	dw CeladonUniversityInsideText1
	dw CeladonUniversityTrader
	dw CeladonUniversityInsideText2
	dw CeladonUniversityInsideText3
	dw CeladonUniversityInsideText4
	dw CeladonUniversityInsideText5
	dw CeladonUniversityInsideBookcaseText1
	dw CeladonUniversityInsideBookcaseText2
	dw CeladonUniversityInsideBookcaseText3

CeladonUniversityInsideText1:
	text_far _CeladonUniversityInsideText1
	text_end

CeladonUniversityTrader:
	text_asm
	ld a, TRADE_WITH_SELF
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

CeladonUniversityInsideText2:
	text_far _CeladonUniversityInsideText2
	text_end

CeladonUniversityInsideText3:
	text_far _CeladonUniversityInsideText3
	text_end

CeladonUniversityInsideText4:
	text_far _CeladonUniversityInsideText4
	text_end

CeladonUniversityInsideMagikarpText:
	text_far _CeladonUniversityInsideMagikarpText
	text_end

CeladonUniversityInsideText5:
	text_asm
	ld hl, CeladonUniversityInsideMagikarpText
	call PrintText
	ld a, MAGIKARP
	call DisplayPokedex
	jp TextScriptEnd

CeladonUniversityInsideBookcaseText1:
	text_far _BookcaseText1
	text_end

CeladonUniversityInsideBookcaseText2:
	text_far _BookcaseText2
	text_end

CeladonUniversityInsideBookcaseText3:
	text_far _BookcaseText3
	text_end

	text_end ; unused
