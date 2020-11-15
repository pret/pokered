LavenderCuboneHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

LavenderCuboneHouse_TextPointers:
	dw LavenderHouse2Text1
	dw LavenderHouse2Text2

LavenderHouse2Text1:
	text_far _LavenderHouse2Text1
	text_asm
	ld a, CUBONE
	call PlayCry
	jp TextScriptEnd

LavenderHouse2Text2:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .rescued_mr_fuji
	ld hl, LavenderHouse2Text_1d9dc
	call PrintText
	jr .done
.rescued_mr_fuji
	ld hl, LavenderHouse2Text_1d9e1
	call PrintText
.done
	jp TextScriptEnd

LavenderHouse2Text_1d9dc:
	text_far _LavenderHouse2Text_1d9dc
	text_end

LavenderHouse2Text_1d9e1:
	text_far _LavenderHouse2Text_1d9e1
	text_end
