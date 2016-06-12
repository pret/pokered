SaffronHouse2Script:
	jp EnableAutoTextBoxDrawing

SaffronHouse2TextPointers:
	dw SaffronHouse2Text1

SaffronHouse2Text1:
	TX_ASM
	CheckEvent EVENT_GOT_TM29
	jr nz, .asm_9e72b
	ld hl, TM29PreReceiveText
	call PrintText
	lb bc, TM_29, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM29Text
	call PrintText
	SetEvent EVENT_GOT_TM29
	jr .asm_fe4e1
.BagFull
	ld hl, TM29NoRoomText
	call PrintText
	jr .asm_fe4e1
.asm_9e72b
	ld hl, TM29ExplanationText
	call PrintText
.asm_fe4e1
	jp TextScriptEnd

TM29PreReceiveText:
	TX_FAR _TM29PreReceiveText
	db "@"

ReceivedTM29Text:
	TX_FAR _ReceivedTM29Text
	db $0B, "@"

TM29ExplanationText:
	TX_FAR _TM29ExplanationText
	db "@"

TM29NoRoomText:
	TX_FAR _TM29NoRoomText
	db "@"
