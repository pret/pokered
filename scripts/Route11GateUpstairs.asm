Route11GateUpstairsScript: ; 49454 (12:5454)
	jp DisableAutoTextBoxDrawing

Route11GateUpstairsTextPointers: ; 49457 (12:5457)
	dw Route11GateUpstairsText1
	dw Route11GateUpstairsText2
	dw Route11GateUpstairsText3
	dw Route11GateUpstairsText4

Route11GateUpstairsText1: ; 4945f (12:545f)
	db $08 ; asm
	xor a
	ld [wWhichTrade], a
	ld a, $54
	call Predef
asm_49469: ; 49469 (12:5469)
	jp TextScriptEnd

Route11GateUpstairsText2: ; 4946c (12:546c)
	db $8
	ld a, [$d7d6]
	add a
	jr c, .asm_4949b ; 0x49471 $28
	ld a, $1e
	ld [$ff00+$db], a
	ld a, $47
	ld [$ff00+$dc], a
	ld [$d11e], a
	call GetItemName
	ld h, d
	ld l, e
	ld de, $cc5b
	ld bc, $000d
	call CopyData
	ld a, $62
	call Predef
	ld a, [$ff00+$db]
	dec a
	jr nz, .asm_494a1 ; 0x49494 $b
	ld hl, $d7d6
	set 7, [hl]
.asm_4949b
	ld hl, UnnamedText_494a3
	call PrintText
.asm_494a1
	jr asm_49469 ; 0x494a1 $c6

UnnamedText_494a3: ; 494a3 (12:54a3)
	TX_FAR _UnnamedText_494a3
	db "@"

Route11GateUpstairsText3: ; 494a8 (12:54a8)
	db $08 ; asm
	ld a, [$c109]
	cp $4
	jp nz, Func_55c9
	ld a, [$d7d8]
	bit 7, a
	ld hl, UnnamedText_494c4
	jr z, .asm_5ac80 ; 0x494b9
	ld hl, UnnamedText_494c9
.asm_5ac80 ; 0x494be
	call PrintText
	jp TextScriptEnd

UnnamedText_494c4: ; 494c4 (12:54c4)
	TX_FAR _UnnamedText_494c4
	db "@"

UnnamedText_494c9: ; 494c9 (12:54c9)
	TX_FAR _UnnamedText_494c9
	db "@"

Route11GateUpstairsText4: ; 494ce (12:54ce)
	db $8
	ld hl, UnnamedText_494d5 ; $54d5
	jp Func_55c9

UnnamedText_494d5: ; 494d5 (12:54d5)
	TX_FAR _UnnamedText_494d5
	db "@"
	

