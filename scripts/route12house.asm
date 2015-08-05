Route12HouseScript: ; 5647f (15:647f)
	jp EnableAutoTextBoxDrawing

Route12HouseTextPointers: ; 56482 (15:6482)
	dw Route12HouseText1

Route12HouseText1: ; 56484 (15:6484)
	TX_ASM
	ld a, [wd728]
	bit 5, a
	jr nz, .asm_b4cad
	ld hl, Route12HouseText_564c0
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_a2d76
	lb bc, SUPER_ROD, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, wd728
	set 5, [hl]
	ld hl, Route12HouseText_564c5
	jr .asm_df984
.BagFull
	ld hl, Route12HouseText_564d9
	jr .asm_df984
.asm_a2d76
	ld hl, Route12HouseText_564cf
	jr .asm_df984
.asm_b4cad
	ld hl, Route12HouseText_564d4
.asm_df984
	call PrintText
	jp TextScriptEnd

Route12HouseText_564c0: ; 564c0 (15:64c0)
	TX_FAR _Route12HouseText_564c0
	db "@"

Route12HouseText_564c5: ; 564c5 (15:64c5)
	TX_FAR _Route12HouseText_564c5
	db $0B
	TX_FAR _Route12HouseText_564ca
	db "@"

Route12HouseText_564cf: ; 564cf (15:64cf)
	TX_FAR _Route12HouseText_564cf
	db "@"

Route12HouseText_564d4: ; 564d4 (15:64d4)
	TX_FAR _Route12HouseText_564d4
	db "@"

Route12HouseText_564d9: ; 564d9 (15:64d9)
	TX_FAR _Route12HouseText_564d9
	db "@"
