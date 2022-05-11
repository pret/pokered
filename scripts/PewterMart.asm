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
	call PrintText
	jp TextScriptEnd

.Text
	text_far _PewterMartText2
	text_end

PewterMartTMKid:
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .afterMisty
	ld hl, .Text
	call PrintText
	jr .done
.afterMisty
	ld hl, .Text3
	call PrintText
	ld hl, .Text2
	call PrintText
.done
	jp TextScriptEnd

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
	call PrintText
	jp TextScriptEnd

.Text
	text_far _PewterMartText3
	text_end

PewterCashierText::
	script_mart POKE_BALL, POTION, ESCAPE_ROPE, ANTIDOTE, BURN_HEAL, AWAKENING, PARLYZ_HEAL