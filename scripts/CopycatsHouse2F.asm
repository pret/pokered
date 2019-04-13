CopycatsHouse2F_Script:
	jp EnableAutoTextBoxDrawing

CopycatsHouse2F_TextPointers:
	dw CopycatsHouse2FText1
	dw CopycatsHouse2FText2
	dw CopycatsHouse2FText3
	dw CopycatsHouse2FText4
	dw CopycatsHouse2FText5
	dw CopycatsHouse2FText6
	dw CopycatsHouse2FText7

CopycatsHouse2FText1:
	TX_ASM
	CheckEvent EVENT_GOT_TM31
	jr nz, .asm_7ccf3
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CopycatsHouse2FText_5ccd4
	call PrintText
	ld b, POKE_DOLL
	call IsItemInBag
	jr z, .asm_62ecd
	ld hl, TM31PreReceiveText
	call PrintText
	lb bc, TM_31, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM31Text
	call PrintText
	ld a, POKE_DOLL
	ld [$ffdb], a
	callba RemoveItemByID
	SetEvent EVENT_GOT_TM31
	jr .asm_62ecd
.BagFull
	ld hl, TM31NoRoomText
	call PrintText
	jr .asm_62ecd
.asm_7ccf3
	ld hl, TM31ExplanationText2
	call PrintText
.asm_62ecd
	jp TextScriptEnd

CopycatsHouse2FText_5ccd4:
	TX_FAR _CopycatsHouse2FText_5ccd4
	db "@"

TM31PreReceiveText:
	TX_FAR _TM31PreReceiveText
	db "@"

ReceivedTM31Text:
	TX_FAR _ReceivedTM31Text
	TX_SFX_ITEM_1
TM31ExplanationText1:
	TX_FAR _TM31ExplanationText1
	TX_WAIT
	db "@"

TM31ExplanationText2:
	TX_FAR _TM31ExplanationText2
	db "@"

TM31NoRoomText:
	TX_FAR _TM31NoRoomText
	TX_WAIT
	db "@"

CopycatsHouse2FText2:
	TX_FAR _CopycatsHouse2FText2
	db "@"

CopycatsHouse2FText5:
CopycatsHouse2FText4:
CopycatsHouse2FText3:
	TX_FAR _CopycatsHouse2FText3
	db "@"

CopycatsHouse2FText6:
	TX_FAR _CopycatsHouse2FText6
	db "@"

CopycatsHouse2FText7:
	TX_ASM
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ld hl, CopycatsHouse2FText_5cd1c
	jr nz, .notUp
	ld hl, CopycatsHouse2FText_5cd17
.notUp
	call PrintText
	jp TextScriptEnd

CopycatsHouse2FText_5cd17:
	TX_FAR _CopycatsHouse2FText_5cd17
	db "@"

CopycatsHouse2FText_5cd1c:
	TX_FAR _CopycatsHouse2FText_5cd1c
	db "@"
