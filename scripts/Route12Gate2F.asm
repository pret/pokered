Route12Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route12Gate2F_TextPointers:
	dw Route12GateUpstairsText1
	dw Route12GateUpstairsText2
	dw Route12GateUpstairsText3

Route12GateUpstairsText1:
	TX_ASM
	CheckEvent EVENT_GOT_TM39, 1
	jr c, .asm_0ad3c
	ld hl, TM39PreReceiveText
	call PrintText
	lb bc, TM_39, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM39Text
	call PrintText
	SetEvent EVENT_GOT_TM39
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

TM39PreReceiveText:
	TX_FAR _TM39PreReceiveText
	db "@"

ReceivedTM39Text:
	TX_FAR _ReceivedTM39Text
	TX_SFX_ITEM_1
	db "@"

TM39ExplanationText:
	TX_FAR _TM39ExplanationText
	db "@"

TM39NoRoomText:
	TX_FAR _TM39NoRoomText
	db "@"

Route12GateUpstairsText2:
	TX_ASM
	ld hl, Route12GateUpstairsText_495b8
	jp GateUpstairsScript_PrintIfFacingUp

Route12GateUpstairsText_495b8:
	TX_FAR _Route12GateUpstairsText_495b8
	db "@"

Route12GateUpstairsText3:
	TX_ASM
	ld hl, Route12GateUpstairsText_495c4
	jp GateUpstairsScript_PrintIfFacingUp

Route12GateUpstairsText_495c4:
	TX_FAR _Route12GateUpstairsText_495c4
	db "@"

GateUpstairsScript_PrintIfFacingUp:
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
