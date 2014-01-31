VermilionHouse2Script: ; 56070 (15:6070)
	jp EnableAutoTextBoxDrawing

VermilionHouse2TextPointers: ; 56073 (15:6073)
	dw VermilionHouse2Text1

VermilionHouse2Text1: ; 56075 (15:6075)
	db $08 ; asm
	ld a, [$d728]
	bit 3, a
	jr nz, asm_03ef5 ; 0x5607b
	ld hl, UnnamedText_560b1
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	and a
	jr nz, asm_eb1b7 ; 0x5608a
	ld bc, (OLD_ROD << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, $d728
	set 3, [hl]
	ld hl, UnnamedText_560b6
	jr asm_5dd95 ; 0x5609c
.BagFull
	ld hl, UnnamedText_560ca
	jr asm_5dd95 ; 0x560a1
asm_eb1b7 ; 0x560a3
	ld hl, UnnamedText_560c0
	jr asm_5dd95 ; 0x560a6
asm_03ef5 ; 0x560a8
	ld hl, UnnamedText_560c5
asm_5dd95 ; 0x560ab
	call PrintText
	jp TextScriptEnd

UnnamedText_560b1: ; 560b1 (15:60b1)
	TX_FAR _UnnamedText_560b1
	db "@"

UnnamedText_560b6: ; 560b6 (15:60b6)
	TX_FAR _UnnamedText_560b6 ; 0x9c554
	db $0B
	TX_FAR _UnnamedText_560bb ; 0x9c5a4
	db "@"

UnnamedText_560c0: ; 560c0 (15:60c0)
	TX_FAR _UnnamedText_560c0
	db "@"

UnnamedText_560c5: ; 560c5 (15:60c5)
	TX_FAR _UnnamedText_560c5
	db "@"

UnnamedText_560ca: ; 560ca (15:60ca)
	TX_FAR _UnnamedText_560ca
	db "@"
	
