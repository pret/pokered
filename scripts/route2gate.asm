Route2GateScript: ; 5d5d4 (17:55d4)
	jp EnableAutoTextBoxDrawing

Route2GateTextPointers: ; 5d5d7 (17:55d7)
	dw Route2GateText1
	dw Route2GateText2

Route2GateText1: ; 5d5db (17:55db)
	TX_ASM
	ld a, [wd7c2]
	bit 0, a
	jr nz, .asm_5d60d
	ld a, 10 ; pokemon needed
	ld [$ffdb], a
	ld a, HM_05 ; oak's aide reward
	ld [$ffdc], a
	ld [wd11e], a
	call GetItemName
	ld hl, wcd6d
	ld de, wcc5b
	ld bc, $000d
	call CopyData
	predef OaksAideScript ; call oak's aide script
	ld a, [$ffdb]
	cp $1
	jr nz, .asm_5d613
	ld hl, wd7c2
	set 0, [hl]
.asm_5d60d
	ld hl, Route2GateText_5d616
	call PrintText
.asm_5d613
	jp TextScriptEnd

Route2GateText_5d616: ; 5d616 (17:5616)
	TX_FAR _Route2GateText_5d616
	db "@"

Route2GateText2: ; 5d61b (17:561b)
	TX_FAR _Route2GateText2
	db "@"
