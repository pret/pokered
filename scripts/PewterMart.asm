PewterMart_Script:
	call EnableAutoTextBoxDrawing
	ld a, TRUE
	ld [wAutoTextBoxDrawingControl], a
	ret

PewterMart_TextPointers:
	dw PewterCashierText
	dw PewterMartText2
	dw PewterMartText3

PewterMartText2:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text
	text_far _PewterMartText2
	text_end

PewterMartText3:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text
	text_far _PewterMartText3
	text_end
