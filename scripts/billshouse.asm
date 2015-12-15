BillsHouseScript: ; 1e76a (7:676a)
	call EnableAutoTextBoxDrawing
	ld a, [wBillsHouseCurScript]
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
	and a ; cp SPRITE_FACING_DOWN
	ld de, MovementData_1e79c
	jr nz, .notDown
	ld de, MovementData_1e7a0
.notDown
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $2
	ld [wBillsHouseCurScript], a
	ret

MovementData_1e79c: ; 1e79c (7:679c)
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

; make Bill walk around the player
MovementData_1e7a0: ; 1e7a0 (7:67a0)
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db $FF

BillsHouseScript2: ; 1e7a6 (7:67a6)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_BILL_POKEMON
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_BILL_SAID_USE_CELL_SEPARATOR
	xor a
	ld [wJoyIgnore], a
	ld a, $3
	ld [wBillsHouseCurScript], a
	ret

BillsHouseScript3: ; 1e7c5 (7:67c5)
	CheckEvent EVENT_USED_CELL_SEPARATOR_ON_BILL
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
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld c, 8
	call DelayFrames
	ld a, $2
	ld [H_SPRITEINDEX], a
	ld de, MovementData_1e807
	call MoveSprite
	ld a, $4
	ld [wBillsHouseCurScript], a
	ret

MovementData_1e807: ; 1e807 (7:6807)
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db $FF

BillsHouseScript4: ; 1e80d (7:680d)
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	SetEvent EVENT_MET_BILL_2 ; this event seems redundant
	SetEvent EVENT_MET_BILL
	ld a, $0
	ld [wBillsHouseCurScript], a
	ret

BillsHouseScript5: ; 1e827 (7:6827)
	ld a, $4
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $0
	ld [wBillsHouseCurScript], a
	ret

BillsHouseTextPointers: ; 1e834 (7:6834)
	dw BillsHouseText1
	dw BillsHouseText2
	dw BillsHouseText3
	dw BillsHouseText4

BillsHouseText4: ; 1e83c (7:683c)
	db $fd

BillsHouseText1: ; 1e83d (7:683d)
	TX_ASM
	ld hl, BillsHouseText_1e865
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_1e85a
.asm_1e84d
	ld hl, BillsHouseText_1e86a
	call PrintText
	ld a, $1
	ld [wBillsHouseCurScript], a
	jr .asm_1e862
.asm_1e85a
	ld hl, BillsHouseText_1e86f
	call PrintText
	jr .asm_1e84d
.asm_1e862
	jp TextScriptEnd

BillsHouseText_1e865: ; 1e865 (7:6865)
	TX_FAR _BillsHouseText_1e865
	db "@"

BillsHouseText_1e86a: ; 1e86a (7:686a)
	TX_FAR _BillsHouseText_1e86a
	db "@"

BillsHouseText_1e86f: ; 1e86f (7:686f)
	TX_FAR _BillsHouseText_1e86f
	db "@"

BillsHouseText2: ; 1e874 (7:6874)
	TX_ASM
	CheckEvent EVENT_GOT_SS_TICKET
	jr nz, .asm_1e8a9
	ld hl, BillThankYouText
	call PrintText
	lb bc, S_S_TICKET, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, SSTicketReceivedText
	call PrintText
	SetEvent EVENT_GOT_SS_TICKET
	ld a, HS_CERULEAN_GUARD_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_CERULEAN_GUARD_2
	ld [wMissableObjectIndex], a
	predef HideObject
.asm_1e8a9
	ld hl, BillsHouseText_1e8cb
	call PrintText
	jr .asm_1e8b7
.BagFull
	ld hl, SSTicketNoRoomText
	call PrintText
.asm_1e8b7
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
	TX_ASM
	ld hl, BillsHouseText_1e8da
	call PrintText
	jp TextScriptEnd

BillsHouseText_1e8da: ; 1e8da (7:68da)
	TX_FAR _BillsHouseText_1e8da
	db "@"
