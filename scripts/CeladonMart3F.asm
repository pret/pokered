CeladonMart3F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart3F_TextPointers:
	dw CeladonMart3Text1
	dw CeladonMart3Text2
	dw CeladonMart3Text3
	dw CeladonMart3Text4
	dw CeladonMart3Text5
	dw CeladonMart3Text6
	dw CeladonMart3Text7
	dw CeladonMart3Text8
	dw CeladonMart3Text9
	dw CeladonMart3Text10
	dw CeladonMart3Text11
	dw CeladonMart3Text12
	dw CeladonMart3Text13
	dw CeladonMart3Text14
	dw CeladonMart3Text15
	dw CeladonMart3Text16
	dw CeladonMart3Text17

CeladonMart3Text1:
	TX_ASM
	CheckEvent EVENT_GOT_TM18
	jr nz, .asm_a5463
	ld hl, TM18PreReceiveText
	call PrintText
	lb bc, TM_18, 1
	call GiveItem
	jr nc, .BagFull
	SetEvent EVENT_GOT_TM18
	ld hl, ReceivedTM18Text
	jr .asm_81359
.BagFull
	ld hl, TM18NoRoomText
	jr .asm_81359
.asm_a5463
	ld hl, TM18ExplanationText
.asm_81359
	call PrintText
	jp TextScriptEnd

TM18PreReceiveText:
	TX_FAR _TM18PreReceiveText
	db "@"

ReceivedTM18Text:
	TX_FAR _ReceivedTM18Text
	TX_SFX_ITEM_1
	db "@"

TM18ExplanationText:
	TX_FAR _TM18ExplanationText
	db "@"

TM18NoRoomText:
	TX_FAR _TM18NoRoomText
	db "@"

CeladonMart3Text2:
	TX_FAR _CeladonMart3Text2
	db "@"

CeladonMart3Text3:
	TX_FAR _CeladonMart3Text3
	db "@"

CeladonMart3Text4:
	TX_FAR _CeladonMart3Text4
	db "@"

CeladonMart3Text5:
	TX_FAR _CeladonMart3Text5
	db "@"

CeladonMart3Text12
CeladonMart3Text10:
CeladonMart3Text8:
CeladonMart3Text6:
	TX_FAR _CeladonMart3Text6
	db "@"

CeladonMart3Text7:
	TX_FAR _CeladonMart3Text7
	db "@"

CeladonMart3Text9:
	TX_FAR _CeladonMart3Text9
	db "@"

CeladonMart3Text11:
	TX_FAR _CeladonMart3Text11
	db "@"

CeladonMart3Text13:
	TX_FAR _CeladonMart3Text13
	db "@"

CeladonMart3Text14:
	TX_FAR _CeladonMart3Text14
	db "@"

CeladonMart3Text17:
CeladonMart3Text16:
CeladonMart3Text15:
	TX_FAR _CeladonMart3Text15
	db "@"
