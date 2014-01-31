CopycatsHouseF2Script: ; 5cc71 (17:4c71)
	jp EnableAutoTextBoxDrawing

CopycatsHouseF2TextPointers: ; 5cc74 (17:4c74)
	dw CopycatsHouseF2Text1
	dw CopycatsHouseF2Text2
	dw CopycatsHouseF2Text3
	dw CopycatsHouseF2Text4
	dw CopycatsHouseF2Text5
	dw CopycatsHouseF2Text6
	dw CopycatsHouseF2Text7

CopycatsHouseF2Text1: ; 5cc82 (17:4c82)
	db $08 ; asm
	ld a, [$d7af]
	bit 0, a
	jr nz, .asm_7ccf3 ; 0x5cc88
	ld a, $1
	ld [$cc3c], a
	ld hl, UnnamedText_5ccd4
	call PrintText
	ld b, POKE_DOLL
	call IsItemInBag
	jr z, .asm_62ecd ; 0x5cc9a
	ld hl, TM31PreReceiveText
	call PrintText
	ld bc, (TM_31 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM31Text
	call PrintText
	ld a, $33
	ldh [$db], a
	ld b, BANK(RemoveItemByID)
	ld hl, RemoveItemByID
	call Bankswitch
	ld hl, $d7af
	set 0, [hl]
	jr .asm_62ecd ; 0x5ccc1
.BagFull
	ld hl, TM31NoRoomText
	call PrintText
	jr .asm_62ecd ; 0x5ccc9
.asm_7ccf3 ; 0x5cccb
	ld hl, TM31ExplanationText2
	call PrintText
.asm_62ecd ; 0x5ccd1
	jp TextScriptEnd

UnnamedText_5ccd4: ; 5ccd4 (17:4cd4)
	TX_FAR _UnnamedText_5ccd4
	db "@"

TM31PreReceiveText: ; 5ccd9 (17:4cd9)
	TX_FAR _TM31PreReceiveText
	db "@"

ReceivedTM31Text: ; 5ccde (17:4cde)
	TX_FAR _ReceivedTM31Text ; 0xa1675
	db $0B
TM31ExplanationText1: ; 5cce3 (17:4ce3)
	TX_FAR _TM31ExplanationText1 ; 0xa1689
	db $d, "@"

TM31ExplanationText2: ; 5cce9 (17:4ce9)
	TX_FAR _TM31ExplanationText2 ; 0xa16c5
	db "@"

TM31NoRoomText: ; 5ccee (17:4cee)
	TX_FAR _TM31NoRoomText ; 0xa1733
	db $d, "@"

CopycatsHouseF2Text2: ; 5ccf4 (17:4cf4)
	TX_FAR _CopycatsHouseF2Text2
	db "@"

CopycatsHouseF2Text5: ; 5ccf9 (17:4cf9)
CopycatsHouseF2Text4: ; 5ccf9 (17:4cf9)
CopycatsHouseF2Text3: ; 5ccf9 (17:4cf9)
	TX_FAR _CopycatsHouseF2Text3
	db "@"

CopycatsHouseF2Text6: ; 5ccfe (17:4cfe)
	TX_FAR _CopycatsHouseF2Text6
	db "@"

CopycatsHouseF2Text7: ; 5cd03 (17:4d03)
	db $08 ; asm
	ld a, [$c109]
	cp $4
	ld hl, UnnamedText_5cd1c
	jr nz, .asm_399a4 ; 0x5cd0c
	ld hl, UnnamedText_5cd17
.asm_399a4 ; 0x5cd11
	call PrintText
	jp TextScriptEnd

UnnamedText_5cd17: ; 5cd17 (17:4d17)
	TX_FAR _UnnamedText_5cd17
	db "@"

UnnamedText_5cd1c: ; 5cd1c (17:4d1c)
	TX_FAR _UnnamedText_5cd1c
	db "@"
	
