LavenderMart_Script:
	jp EnableAutoTextBoxDrawing

LavenderMart_TextPointers:
	dw LavenderCashierText
	dw LavenderMartText2
	dw LavenderMartText3

LavenderMartText2:
	text_far _LavenderMartText2
	text_end

LavenderMartText3:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .Nugget
	ld hl, .ReviveText
	call PrintText
	jr .done
.Nugget
	ld hl, .NuggetText
	call PrintText
.done
	jp TextScriptEnd

.ReviveText
	text_far _LavenderMartReviveText
	text_end

.NuggetText
	text_far _LavenderMartNuggetText
	text_end
