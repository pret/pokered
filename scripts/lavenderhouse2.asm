LavenderHouse2Script: ; 1d9ae (7:59ae)
	call EnableAutoTextBoxDrawing
	ret

LavenderHouse2TextPointers: ; 1d9b2 (7:59b2)
	dw LavenderHouse2Text1
	dw LavenderHouse2Text2

LavenderHouse2Text1: ; 1d9b6 (7:59b6)
	TX_FAR _LavenderHouse2Text1
	TX_ASM
	ld a, CUBONE
	call PlayCry
	jp TextScriptEnd

LavenderHouse2Text2: ; 1d9c3 (7:59c3)
	TX_ASM
	ld a, [wd7e0]
	bit 7, a
	jr nz, .asm_65711
	ld hl, LavenderHouse2Text_1d9dc
	call PrintText
	jr .asm_64be1
.asm_65711
	ld hl, LavenderHouse2Text_1d9e1
	call PrintText
.asm_64be1
	jp TextScriptEnd

LavenderHouse2Text_1d9dc: ; 1d9dc (7:59dc)
	TX_FAR _LavenderHouse2Text_1d9dc
	db "@"

LavenderHouse2Text_1d9e1: ; 1d9e1 (7:59e1)
	TX_FAR _LavenderHouse2Text_1d9e1
	db "@"
