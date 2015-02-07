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
	predef DoInGameTradeDialogue
asm_49469: ; 49469 (12:5469)
	jp TextScriptEnd

Route11GateUpstairsText2: ; 4946c (12:546c)
	db $8
	ld a, [wd7d6]
	add a
	jr c, .asm_4949b ; 0x49471 $28
	ld a, 30 ; pokemon needed
	ld [$ffdb], a
	ld a, ITEMFINDER ; oak's aide reward
	ld [$ffdc], a
	ld [wd11e], a
	call GetItemName
	ld h, d
	ld l, e
	ld de, wcc5b
	ld bc, $000d
	call CopyData
	predef OaksAideScript ; call oak's aide script
	ld a, [$ffdb]
	dec a
	jr nz, .asm_494a1 ; 0x49494 $b
	ld hl, wd7d6
	set 7, [hl]
.asm_4949b
	ld hl, Route11GateUpstairsText_494a3
	call PrintText
.asm_494a1
	jr asm_49469 ; 0x494a1 $c6

Route11GateUpstairsText_494a3: ; 494a3 (12:54a3)
	TX_FAR _Route11GateUpstairsText_494a3
	db "@"

Route11GateUpstairsText3: ; 494a8 (12:54a8)
	db $08 ; asm
	ld a, [wSpriteStateData1 + 9]
	cp $4
	jp nz, Route12GateUpstairsScript_495c9
	ld a, [wd7d8]
	bit 7, a ; fought snorlax?
	ld hl, BinocularsSnorlaxText
	jr z, .print
	ld hl, BinocularsNoSnorlaxText
.print
	call PrintText
	jp TextScriptEnd

BinocularsSnorlaxText:
	TX_FAR _BinocularsSnorlaxText
	db "@"

BinocularsNoSnorlaxText:
	TX_FAR _BinocularsNoSnorlaxText
	db "@"

Route11GateUpstairsText4: ; 494ce (12:54ce)
	db $8
	ld hl, Route11GateUpstairsText_494d5 ; $54d5
	jp Route12GateUpstairsScript_495c9

Route11GateUpstairsText_494d5: ; 494d5 (12:54d5)
	TX_FAR _Route11GateUpstairsText_494d5
	db "@"
