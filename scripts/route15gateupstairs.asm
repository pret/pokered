Route15GateUpstairsScript: ; 4964a (12:564a)
	jp DisableAutoTextBoxDrawing

Route15GateUpstairsTextPointers: ; 4964d (12:564d)
	dw Route15GateUpstairsText1
	dw Route15GateUpstairsText2

Route15GateUpstairsText1: ; 49651 (12:5651)
	db $8
	ld a, [$d7dd]
	bit 0, a
	jr nz, .asm_49683 ; 0x49657 $2a
	ld a, $32
	ld [$ffdb], a
	ld a, EXP__ALL
	ld [$ffdc], a
	ld [$d11e], a
	call GetItemName
	ld hl, $cd6d
	ld de, $cc5b
	ld bc, $000d
	call CopyData
	ld a, $62
	call Predef
	ld a, [$ffdb]
	cp $1
	jr nz, .asm_49689 ; 0x4967c $b
	ld hl, $d7dd
	set 0, [hl]
.asm_49683
	ld hl, Route15GateUpstairsText_4968c
	call PrintText
.asm_49689
	jp TextScriptEnd

Route15GateUpstairsText_4968c: ; 4968c (12:568c)
	TX_FAR _Route15GateUpstairsText_4968c
	db "@"

Route15GateUpstairsText2: ; 49691 (12:5691)
	db $8
	ld hl, Route15GateUpstairsText_49698
	jp Route12GateUpstairsScript_495c9

Route15GateUpstairsText_49698: ; 49698 (12:5698)
	TX_FAR _Route15GateUpstairsText_49698
	db "@"
