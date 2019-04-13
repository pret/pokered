CinnabarLabMetronomeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabMetronomeRoom_TextPointers:
	dw Lab3Text1
	dw Lab3Text2
	dw Lab3Text3
	dw Lab3Text4
	dw Lab3Text5

Lab3Text1:
	TX_ASM
	CheckEvent EVENT_GOT_TM35
	jr nz, .asm_e551a
	ld hl, TM35PreReceiveText
	call PrintText
	lb bc, TM_35, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM35Text
	call PrintText
	SetEvent EVENT_GOT_TM35
	jr .asm_eb896
.BagFull
	ld hl, TM35NoRoomText
	call PrintText
	jr .asm_eb896
.asm_e551a
	ld hl, TM35ExplanationText
	call PrintText
.asm_eb896
	jp TextScriptEnd

TM35PreReceiveText:
	TX_FAR _TM35PreReceiveText
	db "@"

ReceivedTM35Text:
	TX_FAR _ReceivedTM35Text
	TX_SFX_ITEM_1
	db "@"

TM35ExplanationText:
	TX_FAR _TM35ExplanationText
	db "@"

TM35NoRoomText:
	TX_FAR _TM35NoRoomText
	db "@"

Lab3Text2:
	TX_FAR _Lab3Text2
	db "@"

Lab3Text4:
Lab3Text3:
	TX_FAR _Lab3Text3
	db "@"

Lab3Text5:
	TX_FAR _Lab3Text5
	db "@"
