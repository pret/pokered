BillsHouse_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wBillsHouseCurScript]
	ld hl, BillsHouse_ScriptPointers
	jp CallFunctionInTable

BillsHouse_ScriptPointers:
	dw BillsHouseScript0
	dw BillsHouseScript1
	dw BillsHouseScript2
	dw BillsHouseScript3
	dw BillsHouseScript4
	dw BillsHouseScript5

BillsHouseScript0:
	ret

BillsHouseScript1:
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

MovementData_1e79c:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

; make Bill walk around the player
MovementData_1e7a0:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db $FF

BillsHouseScript2:
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

BillsHouseScript3:
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

MovementData_1e807:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db $FF

BillsHouseScript4:
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

BillsHouseScript5:
	ld a, $4
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $0
	ld [wBillsHouseCurScript], a
	ret

BillsHouse_TextPointers:
	dw BillsHouseText1
	dw BillsHouseText2
	dw BillsHouseText3
	dw BillsHouseText4

BillsHouseText4:
	TX_BILLS_PC

BillsHouseText1:
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

BillsHouseText_1e865:
	TX_FAR _BillsHouseText_1e865
	db "@"

BillsHouseText_1e86a:
	TX_FAR _BillsHouseText_1e86a
	db "@"

BillsHouseText_1e86f:
	TX_FAR _BillsHouseText_1e86f
	db "@"

BillsHouseText2:
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

BillThankYouText:
	TX_FAR _BillThankYouText
	db "@"

SSTicketReceivedText:
	TX_FAR _SSTicketReceivedText
	TX_SFX_KEY_ITEM
	TX_BLINK
	db "@"

SSTicketNoRoomText:
	TX_FAR _SSTicketNoRoomText
	db "@"

BillsHouseText_1e8cb:
	TX_FAR _BillsHouseText_1e8cb
	db "@"

BillsHouseText3:
	TX_ASM
	ld hl, BillsHouseText_1e8da
	call PrintText
	jp TextScriptEnd

BillsHouseText_1e8da:
	TX_FAR _BillsHouseText_1e8da
	db "@"
