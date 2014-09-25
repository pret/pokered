BillsHouseScript: ; 1e76a (7:676a)
	call EnableAutoTextBoxDrawing
	ld a, [W_BILLSHOUSECURSCRIPT]
	ld hl, BillsHouseScriptPointers
	jp CallFunctionInTable

BillsHouseScriptPointers: ; 1e776 (7:6776)
	dw BillsHouseScript0
	dw BillsHouseScript1
	dw BillsHouseScript2
	dw BillsHouseScript3
	dw BillsHouseScript4
	dw BillsHouseScript5

BillsHouseScript0: ; 1e782 (7:6782)
	ret

BillsHouseScript1: ; 1e783 (7:6783)
	ld a, [wSpriteStateData1 + 9]
	and a
	ld de, MovementData_1e79c
	jr nz, .asm_1e78f ; 0x1e78a $3
	ld de, MovementData_1e7a0
.asm_1e78f
	ld a, $1
	ld [$ff8c], a
	call MoveSprite
	ld a, $2
	ld [W_BILLSHOUSECURSCRIPT], a
	ret

MovementData_1e79c: ; 1e79c (7:679c)
	db $40,$40,$40,$FF

MovementData_1e7a0: ; 1e7a0 (7:67a0)
	db $C0,$40,$40,$80,$40,$FF

BillsHouseScript2: ; 1e7a6 (7:67a6)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_BILL_POKEMON
	ld [wcc4d], a
	predef HideObject
	ld hl, wd7f2
	set 6, [hl]
	xor a
	ld [wJoyIgnore], a
	ld a, $3
	ld [W_BILLSHOUSECURSCRIPT], a
	ret

BillsHouseScript3: ; 1e7c5 (7:67c5)
	ld a, [wd7f2]
	bit 3, a
	ret z
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $2
	ld [wSpriteIndex], a
	ld a, $c
	ld [$ffeb], a
	ld a, $40
	ld [$ffec], a
	ld a, $6
	ld [$ffed], a
	ld a, $5
	ld [$ffee], a
	call SetSpritePosition1
	ld a, HS_BILL_1
	ld [wcc4d], a
	predef ShowObject
	ld c, $8
	call DelayFrames
	ld a, $2
	ld [$ff8c], a
	ld de, MovementData_1e807
	call MoveSprite
	ld a, $4
	ld [W_BILLSHOUSECURSCRIPT], a
	ret

MovementData_1e807: ; 1e807 (7:6807)
	db $00,$C0,$C0,$C0,$00,$FF

BillsHouseScript4: ; 1e80d (7:680d)
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wd7f2
	set 5, [hl]
	ld hl, wd7f1
	set 0, [hl]
	ld a, $0
	ld [W_BILLSHOUSECURSCRIPT], a
	ret

BillsHouseScript5: ; 1e827 (7:6827)
	ld a, $4
	ld [$ff8c], a
	call DisplayTextID
	ld a, $0
	ld [W_BILLSHOUSECURSCRIPT], a
	ret

BillsHouseTextPointers: ; 1e834 (7:6834)
	dw BillsHouseText1
	dw BillsHouseText2
	dw BillsHouseText3
	dw BillsHouseText4

BillsHouseText4: ; 1e83c (7:683c)
	db $fd

BillsHouseText1: ; 1e83d (7:683d)
	db $8
	ld hl, BillsHouseText_1e865
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, asm_6b196 ; 0x1e84b $d
asm_4d03c: ; 1e84d (7:684d)
	ld hl, BillsHouseText_1e86a
	call PrintText
	ld a, $1
	ld [W_BILLSHOUSECURSCRIPT], a
	jr asm_fd4e2 ; 0x1e858 $8
asm_6b196: ; 1e85a (7:685a)
	ld hl, BillsHouseText_1e86f
	call PrintText
	jr asm_4d03c ; 0x1e860 $eb
asm_fd4e2 ; 0x1e862
	jp TextScriptEnd

BillsHouseText_1e865: ; 1e865 (7:6865)
	TX_FAR _BillsHouseText_1e865 ; 0x8d267
	db "@"

BillsHouseText_1e86a: ; 1e86a (7:686a)
	TX_FAR _BillsHouseText_1e86a ; 0x8d345
	db "@"

BillsHouseText_1e86f: ; 1e86f (7:686f)
	TX_FAR _BillsHouseText_1e86f ; 0x8d391
	db "@"

BillsHouseText2: ; 1e874 (7:6874)
	db $08 ; asm
	ld a, [wd7f2]
	bit 4, a
	jr nz, .asm_5491f ; 0x1e87a
	ld hl, BillThankYouText
	call PrintText
	ld bc, (S_S__TICKET << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, SSTicketReceivedText
	call PrintText
	ld hl, wd7f2
	set 4, [hl]
	ld a, HS_CERULEAN_GUARD_1
	ld [wcc4d], a
	predef ShowObject
	ld a, HS_CERULEAN_GUARD_2
	ld [wcc4d], a
	predef HideObject
.asm_5491f ; 0x1e8a9
	ld hl, BillsHouseText_1e8cb
	call PrintText
	jr .asm_bd408 ; 0x1e8af
.BagFull
	ld hl, SSTicketNoRoomText
	call PrintText
.asm_bd408 ; 0x1e8b7
	jp TextScriptEnd

BillThankYouText: ; 1e8ba (7:68ba)
	TX_FAR _BillThankYouText
	db "@"

SSTicketReceivedText: ; 1e8bf (7:68bf)
	TX_FAR _SSTicketReceivedText
	db $11, $6, "@"

SSTicketNoRoomText: ; 1e8c6 (7:68c6)
	TX_FAR _SSTicketNoRoomText
	db "@"

BillsHouseText_1e8cb: ; 1e8cb (7:68cb)
	TX_FAR _BillsHouseText_1e8cb
	db "@"

BillsHouseText3: ; 1e8d0 (7:68d0)
	db $08 ; asm
	ld hl, BillsHouseText_1e8da
	call PrintText
	jp TextScriptEnd

BillsHouseText_1e8da: ; 1e8da (7:68da)
	TX_FAR _BillsHouseText_1e8da
	db "@"
