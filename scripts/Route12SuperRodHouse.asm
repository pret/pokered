Route12SuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12SuperRodHouse_TextPointers:
	dw Route12HouseText1

Route12HouseText1:
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

Route12HouseText_564c0:
	TX_FAR _Route12HouseText_564c0
	db "@"

Route12HouseText_564c5:
	TX_FAR _Route12HouseText_564c5
	TX_SFX_ITEM_1
	TX_FAR _Route12HouseText_564ca
	db "@"

Route12HouseText_564cf:
	TX_FAR _Route12HouseText_564cf
	db "@"

Route12HouseText_564d4:
	TX_FAR _Route12HouseText_564d4
	db "@"

Route12HouseText_564d9:
	TX_FAR _Route12HouseText_564d9
	db "@"
