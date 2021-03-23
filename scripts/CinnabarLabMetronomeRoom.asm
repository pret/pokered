CinnabarLabMetronomeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabMetronomeRoom_TextPointers:
	dw Lab3Text1
	dw Lab3Text2
	dw Lab3Text3
	dw Lab3Text4
	dw Lab3Text5

Lab3Text1:
	text_asm
	CheckEvent EVENT_GOT_TM35
	jr nz, .got_item
	ld hl, TM35PreReceiveText
	call PrintText
	lb bc, TM_METRONOME, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM35Text
	call PrintText
	SetEvent EVENT_GOT_TM35
	jr .done
.bag_full
	ld hl, TM35NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM35ExplanationText
	call PrintText
.done
	jp TextScriptEnd

TM35PreReceiveText:
	text_far _TM35PreReceiveText
	text_end

ReceivedTM35Text:
	text_far _ReceivedTM35Text
	sound_get_item_1
	text_end

TM35ExplanationText:
	text_far _TM35ExplanationText
	text_end

TM35NoRoomText:
	text_far _TM35NoRoomText
	text_end

Lab3Text2:
	text_far _Lab3Text2
	text_end

Lab3Text4:
Lab3Text3:
	text_far _Lab3Text3
	text_end

Lab3Text5:
	text_far _Lab3Text5
	text_end
