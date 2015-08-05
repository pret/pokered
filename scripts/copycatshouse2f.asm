CopycatsHouse2FScript: ; 5cc71 (17:4c71)
	jp EnableAutoTextBoxDrawing

CopycatsHouse2FTextPointers: ; 5cc74 (17:4c74)
	dw CopycatsHouse2FText1
	dw CopycatsHouse2FText2
	dw CopycatsHouse2FText3
	dw CopycatsHouse2FText4
	dw CopycatsHouse2FText5
	dw CopycatsHouse2FText6
	dw CopycatsHouse2FText7

CopycatsHouse2FText1: ; 5cc82 (17:4c82)
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

CopycatsHouse2FText_5ccd4: ; 5ccd4 (17:4cd4)
	TX_FAR _CopycatsHouse2FText_5ccd4
	db "@"

TM31PreReceiveText: ; 5ccd9 (17:4cd9)
	TX_FAR _TM31PreReceiveText
	db "@"

ReceivedTM31Text: ; 5ccde (17:4cde)
	TX_FAR _ReceivedTM31Text
	db $0B
TM31ExplanationText1: ; 5cce3 (17:4ce3)
	TX_FAR _TM31ExplanationText1
	db $d, "@"

TM31ExplanationText2: ; 5cce9 (17:4ce9)
	TX_FAR _TM31ExplanationText2
	db "@"

TM31NoRoomText: ; 5ccee (17:4cee)
	TX_FAR _TM31NoRoomText
	db $d, "@"

CopycatsHouse2FText2: ; 5ccf4 (17:4cf4)
	TX_FAR _CopycatsHouse2FText2
	db "@"

CopycatsHouse2FText5: ; 5ccf9 (17:4cf9)
CopycatsHouse2FText4: ; 5ccf9 (17:4cf9)
CopycatsHouse2FText3: ; 5ccf9 (17:4cf9)
	TX_FAR _CopycatsHouse2FText3
	db "@"

CopycatsHouse2FText6: ; 5ccfe (17:4cfe)
	TX_FAR _CopycatsHouse2FText6
	db "@"

CopycatsHouse2FText7: ; 5cd03 (17:4d03)
	TX_ASM
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ld hl, CopycatsHouse2FText_5cd1c
	jr nz, .notUp
	ld hl, CopycatsHouse2FText_5cd17
.notUp
	call PrintText
	jp TextScriptEnd

CopycatsHouse2FText_5cd17: ; 5cd17 (17:4d17)
	TX_FAR _CopycatsHouse2FText_5cd17
	db "@"

CopycatsHouse2FText_5cd1c: ; 5cd1c (17:4d1c)
	TX_FAR _CopycatsHouse2FText_5cd1c
	db "@"
