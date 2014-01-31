Route12HouseScript: ; 5647f (15:647f)
	jp EnableAutoTextBoxDrawing

Route12HouseTextPointers: ; 56482 (15:6482)
	dw Route12HouseText1

Route12HouseText1: ; 56484 (15:6484)
	db $08 ; asm
	ld a, [$d728]
	bit 5, a
	jr nz, asm_b4cad ; 0x5648a
	ld hl, UnnamedText_564c0
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	and a
	jr nz, asm_a2d76 ; 0x56499
	ld bc, (SUPER_ROD << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, $d728
	set 5, [hl]
	ld hl, UnnamedText_564c5
	jr asm_df984 ; 0x564ab
.BagFull
	ld hl, UnnamedText_564d9
	jr asm_df984 ; 0x564b0
asm_a2d76 ; 0x564b2
	ld hl, UnnamedText_564cf
	jr asm_df984 ; 0x564b5
asm_b4cad ; 0x564b7
	ld hl, UnnamedText_564d4
asm_df984 ; 0x564ba
	call PrintText
	jp TextScriptEnd

UnnamedText_564c0: ; 564c0 (15:64c0)
	TX_FAR _UnnamedText_564c0
	db "@"

UnnamedText_564c5: ; 564c5 (15:64c5)
	TX_FAR _UnnamedText_564c5 ; 0x8ca00
	db $0B
	TX_FAR _UnnamedText_564ca ; 0x8ca4f
	db "@"

UnnamedText_564cf: ; 564cf (15:64cf)
	TX_FAR _UnnamedText_564cf
	db "@"

UnnamedText_564d4: ; 564d4 (15:64d4)
	TX_FAR _UnnamedText_564d4
	db "@"

UnnamedText_564d9: ; 564d9 (15:64d9)
	TX_FAR _UnnamedText_564d9
	db "@"
	
