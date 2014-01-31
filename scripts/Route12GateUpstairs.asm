Route12GateUpstairsScript: ; 49560 (12:5560)
	jp DisableAutoTextBoxDrawing

Route12GateUpstairsTextPointers: ; 49563 (12:5563)
	dw Route12GateUpstairsText1
	dw Route12GateUpstairsText2
	dw Route12GateUpstairsText3

Route12GateUpstairsText1: ; 49569 (12:5569)
	db $08 ; asm
	ld a, [$d7d7]
	rrca
	jr c, .asm_0ad3c ; 0x4956e
	ld hl, TM39PreReceiveText
	call PrintText
	ld bc, (TM_39 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM39Text
	call PrintText
	ld hl, $d7d7
	set 0, [hl]
	jr .asm_4ba56 ; 0x49589
.BagFull
	ld hl, TM39NoRoomText
	call PrintText
	jr .asm_4ba56 ; 0x49591
.asm_0ad3c ; 0x49593
	ld hl, TM39ExplanationText
	call PrintText
.asm_4ba56 ; 0x49599
	jp TextScriptEnd

TM39PreReceiveText: ; 4959c (12:559c)
	TX_FAR _TM39PreReceiveText
	db "@"

ReceivedTM39Text: ; 495a1 (12:55a1)
	TX_FAR _ReceivedTM39Text ; 0x8c8c6
	db $0B, "@"

TM39ExplanationText: ; 495a7 (12:55a7)
	TX_FAR _TM39ExplanationText
	db "@"

TM39NoRoomText: ; 495ac (12:55ac)
	TX_FAR _TM39NoRoomText
	db "@"

Route12GateUpstairsText2: ; 495b1 (12:55b1)
	db $08 ; asm
	ld hl, UnnamedText_495b8
	jp Func_55c9

UnnamedText_495b8: ; 495b8 (12:55b8)
	TX_FAR _UnnamedText_495b8 ; 0x8c95a
	db "@"

Route12GateUpstairsText3: ; 495bd (12:55bd)
	db $8
	ld hl, UnnamedText_495c4
	jp Func_55c9

UnnamedText_495c4: ; 495c4 (12:55c4)
	TX_FAR _UnnamedText_495c4
	db "@"

Func_55c9: ; 495c9 (12:55c9)
	ld a, [$c109]
	cp $4
	jr z, .asm_495d4 ; 0x495ce $4
	ld a, $1
	jr .asm_495d8 ; 0x495d2 $4
.asm_495d4
	call PrintText
	xor a
.asm_495d8
	ld [$cc3c], a
	jp TextScriptEnd
	

