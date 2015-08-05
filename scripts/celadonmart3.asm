CeladonMart3Script: ; 48225 (12:4225)
	jp EnableAutoTextBoxDrawing

CeladonMart3TextPointers: ; 48228 (12:4228)
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

CeladonMart3Text1: ; 4824a (12:424a)
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

TM18PreReceiveText: ; 48278 (12:4278)
	TX_FAR _TM18PreReceiveText
	db "@"

ReceivedTM18Text: ; 4827d (12:427d)
	TX_FAR _ReceivedTM18Text
	db $0B, "@"

TM18ExplanationText: ; 48283 (12:4283)
	TX_FAR _TM18ExplanationText
	db "@"

TM18NoRoomText: ; 48288 (12:4288)
	TX_FAR _TM18NoRoomText
	db "@"

CeladonMart3Text2: ; 4828d (12:428d)
	TX_FAR _CeladonMart3Text2
	db "@"

CeladonMart3Text3: ; 48292 (12:4292)
	TX_FAR _CeladonMart3Text3
	db "@"

CeladonMart3Text4: ; 48297 (12:4297)
	TX_FAR _CeladonMart3Text4
	db "@"

CeladonMart3Text5: ; 4829c (12:429c)
	TX_FAR _CeladonMart3Text5
	db "@"

CeladonMart3Text12
CeladonMart3Text10: ; 482a1 (12:42a1)
CeladonMart3Text8: ; 482a1 (12:42a1)
CeladonMart3Text6: ; 482a1 (12:42a1)
	TX_FAR _CeladonMart3Text6
	db "@"

CeladonMart3Text7: ; 482a6 (12:42a6)
	TX_FAR _CeladonMart3Text7
	db "@"

CeladonMart3Text9: ; 482ab (12:42ab)
	TX_FAR _CeladonMart3Text9
	db "@"

CeladonMart3Text11: ; 482b0 (12:42b0)
	TX_FAR _CeladonMart3Text11
	db "@"

CeladonMart3Text13: ; 482b5 (12:42b5)
	TX_FAR _CeladonMart3Text13
	db "@"

CeladonMart3Text14: ; 482ba (12:42ba)
	TX_FAR _CeladonMart3Text14
	db "@"

CeladonMart3Text17: ; 482bf (12:42bf)
CeladonMart3Text16: ; 482bf (12:42bf)
CeladonMart3Text15: ; 482bf (12:42bf)
	TX_FAR _CeladonMart3Text15
	db "@"
