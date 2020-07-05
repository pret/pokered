Route12Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route12Gate2F_TextPointers:
	dw Route12GateUpstairsText1
	dw Route12GateUpstairsText2
	dw Route12GateUpstairsText3

Route12GateUpstairsText1:
	text_asm
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
	text_far _TM39PreReceiveText
	text_end

ReceivedTM39Text:
	text_far _ReceivedTM39Text
	sound_get_item_1
	text_end

TM39ExplanationText:
	text_far _TM39ExplanationText
	text_end

TM39NoRoomText:
	text_far _TM39NoRoomText
	text_end

Route12GateUpstairsText2:
	text_asm
	ld hl, Route12GateUpstairsText_495b8
	jp GateUpstairsScript_PrintIfFacingUp

Route12GateUpstairsText_495b8:
	text_far _Route12GateUpstairsText_495b8
	text_end

Route12GateUpstairsText3:
	text_asm
	ld hl, Route12GateUpstairsText_495c4
	jp GateUpstairsScript_PrintIfFacingUp

Route12GateUpstairsText_495c4:
	text_far _Route12GateUpstairsText_495c4
	text_end

GateUpstairsScript_PrintIfFacingUp:
	ld a, [wSpritePlayerStateData1FacingDirection]
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
