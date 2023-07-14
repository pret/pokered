Route18Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route18Gate2F_TextPointers:
	def_text_pointers
	dw_const Route18Gate2FYoungsterText,       TEXT_ROUTE18GATE2F_YOUNGSTER
	dw_const Route18Gate2FLeftBinocularsText,  TEXT_ROUTE18GATE2F_LEFT_BINOCULARS
	dw_const Route18Gate2FRightBinocularsText, TEXT_ROUTE18GATE2F_RIGHT_BINOCULARS

Route18Gate2FYoungsterText:
	text_asm
	ld a, TRADE_FOR_MARC
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

Route18Gate2FLeftBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route18Gate2FLeftBinocularsText
	text_end

Route18Gate2FRightBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route18Gate2FRightBinocularsText
	text_end
