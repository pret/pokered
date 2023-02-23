PewterMart_Script:
	call EnableAutoTextBoxDrawing
	ld a, TRUE
	ld [wAutoTextBoxDrawingControl], a
	ret

PewterMart_TextPointers:
	dw PewterCashierText
	dw PewterMartText2
	dw PewterMartText3
	dw PewterMartTMKid

PewterMartText2:
	text_asm
	ld hl, .Text
	rst PrintTextRST
	rst TextScriptEnd

.Text
	text_far _PewterMartText2
	text_end

PewterMartTMKid: ; PureRGBnote: ADDED: new NPC who will talk about selling TMs
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .afterMisty
	ld hl, .Text
	rst PrintTextRST
	jr .done
.afterMisty
	ld hl, .Text3
	rst PrintTextRST
	ld hl, .Text2
	rst PrintTextRST
.done
	rst TextScriptEnd

.Text
	text_far _PewterMartTMKid
	text_end

.Text2
	text_far _TMKidStockingUp
	text_end

.Text3
	text_far _TMKidGreet
	text_end

PewterMartText3:
	text_asm
	ld hl, .Text
	rst PrintTextRST
	rst TextScriptEnd

.Text
	text_far _PewterMartText3
	text_end

INCLUDE "data/items/marts/pewter.asm"