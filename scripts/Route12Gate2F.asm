Route12Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route12Gate2F_TextPointers:
	dw Route12GateUpstairsText1
	dw Route12GateUpstairsText2
	dw Route12GateUpstairsText3

Route12GateUpstairsText1:
	text_asm
	CheckEvent EVENT_GOT_TM39, 1
	jr c, .got_item
	ld hl, TM39PreReceiveText
	call PrintText
	lb bc, TM_SWIFT, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM39Text
	call PrintText
	SetEvent EVENT_GOT_TM39
	jr .done
.bag_full
	ld hl, TM39NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM39ExplanationText
	call PrintText
.done
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
	ld a, TRUE
	jr .done
.up
	call PrintText
	xor a
.done
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd
