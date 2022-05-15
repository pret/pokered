MrPsychicsHouse_Script:
	jp EnableAutoTextBoxDrawing

MrPsychicsHouse_TextPointers:
	dw SaffronHouse2Text1

SaffronHouse2Text1:
	text_asm
	CheckEvent EVENT_GOT_TM29
	jr nz, .gotItem
	ld hl, TM29PreReceiveText
	call PrintText
	lb bc, TM_PSYCHIC_M, 1
	call GiveItem
	jr nc, .bagFull
	ld hl, ReceivedTM29Text
	call PrintText
	SetEvent EVENT_GOT_TM29
	jr .done
.bagFull
	ld hl, TM29NoRoomText
	call PrintText
	jr .done
.gotItem
	ld hl, TM29ExplanationText
	call PrintText
.done
	jp TextScriptEnd

TM29PreReceiveText:
	text_far _TM29PreReceiveText
	text_end

ReceivedTM29Text:
	text_far _ReceivedTM29Text
	sound_get_item_1
	text_end

TM29ExplanationText:
	text_far _TM29ExplanationText
	text_end

TM29NoRoomText:
	text_far _TM29NoRoomText
	text_end
