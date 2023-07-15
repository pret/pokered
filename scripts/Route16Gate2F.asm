Route16Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route16Gate2F_TextPointers:
	def_text_pointers
	dw_const Route16Gate2FLittleBoyText,       TEXT_ROUTE16GATE2F_LITTLE_BOY
	dw_const Route16Gate2FLittleGirlText,      TEXT_ROUTE16GATE2F_LITTLE_GIRL
	dw_const Route16Gate2FLeftBinocularsText,  TEXT_ROUTE16GATE2F_LEFT_BINOCULARS
	dw_const Route16Gate2FRightBinocularsText, TEXT_ROUTE16GATE2F_RIGHT_BINOCULARS

Route16Gate2FLittleBoyText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _Route16Gate2FLittleBoyText
	text_end

Route16Gate2FLittleGirlText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _Route16Gate2FLittleGirlText
	text_end

Route16Gate2FLeftBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route16Gate2FLeftBinocularsText
	text_end

Route16Gate2FRightBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route16Gate2FRightBinocularsText
	text_end
