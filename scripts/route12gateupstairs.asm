Route12GateUpstairsScript: ; 49560 (12:5560)
	jp DisableAutoTextBoxDrawing

Route12GateUpstairsTextPointers: ; 49563 (12:5563)
	dw Route12GateUpstairsText1
	dw Route12GateUpstairsText2
	dw Route12GateUpstairsText3

Route12GateUpstairsText1: ; 49569 (12:5569)
	TX_ASM
	ld a, [wd7d7]
	rrca
	jr c, .asm_0ad3c
	ld hl, TM39PreReceiveText
	call PrintText
	ld bc, (TM_39 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM39Text
	call PrintText
	ld hl, wd7d7
	set 0, [hl]
	jr .asm_4ba56
.BagFull
	ld hl, TM39NoRoomText
	call PrintText
	jr .asm_4ba56
.asm_0ad3c
	ld hl, TM39ExplanationText
	call PrintText
.asm_4ba56
	jp TextScriptEnd

TM39PreReceiveText: ; 4959c (12:559c)
	TX_FAR _TM39PreReceiveText
	db "@"

ReceivedTM39Text: ; 495a1 (12:55a1)
	TX_FAR _ReceivedTM39Text
	db $0B, "@"

TM39ExplanationText: ; 495a7 (12:55a7)
	TX_FAR _TM39ExplanationText
	db "@"

TM39NoRoomText: ; 495ac (12:55ac)
	TX_FAR _TM39NoRoomText
	db "@"

Route12GateUpstairsText2: ; 495b1 (12:55b1)
	TX_ASM
	ld hl, Route12GateUpstairsText_495b8
	jp GateUpstairsScript_PrintIfFacingUp

Route12GateUpstairsText_495b8: ; 495b8 (12:55b8)
	TX_FAR _Route12GateUpstairsText_495b8
	db "@"

Route12GateUpstairsText3: ; 495bd (12:55bd)
	TX_ASM
	ld hl, Route12GateUpstairsText_495c4
	jp GateUpstairsScript_PrintIfFacingUp

Route12GateUpstairsText_495c4: ; 495c4 (12:55c4)
	TX_FAR _Route12GateUpstairsText_495c4
	db "@"

GateUpstairsScript_PrintIfFacingUp: ; 495c9 (12:55c9)
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	jr z, .up
	ld a, $1
	jr .done
.up
	call PrintText
	xor a
.done
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd
