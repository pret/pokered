PewterMart_Script:
	jp DisableAutoTextBoxDrawing

PewterMart_TextPointers:
	def_text_pointers
	dw_const PewterMartClerkText,     TEXT_PEWTERMART_CLERK
	dw_const PewterMartYoungsterText, TEXT_PEWTERMART_YOUNGSTER
	dw_const PewterMartSuperNerdText, TEXT_PEWTERMART_SUPER_NERD
	dw_const PewterMartTMKid,         TEXT_PEWTERMART_TM_KID

PewterMartYoungsterText:
	text_asm
	ld hl, .Text
	rst _PrintText
	rst TextScriptEnd

.Text:
	text_far _PewterMartYoungsterText
	text_end
	
PewterMartTMKid: ; PureRGBnote: ADDED: new NPC who will talk about selling TMs
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .afterMisty
	ld hl, .Text
	rst _PrintText
	jr .done
.afterMisty
	ld hl, .Text3
	rst _PrintText
	ld hl, .Text2
	rst _PrintText
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

PewterMartSuperNerdText:
	text_asm
	ld hl, .Text
	rst _PrintText
	rst TextScriptEnd

.Text:
	text_far _PewterMartSuperNerdText
	text_end

INCLUDE "data/items/marts/pewter.asm"