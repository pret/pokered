Route12Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route12Gate2F_TextPointers:
	def_text_pointers
	dw_const Route12Gate2FBrunetteGirlText,    TEXT_ROUTE12GATE2F_BRUNETTE_GIRL
	dw_const Route12Gate2FLeftBinocularsText,  TEXT_ROUTE12GATE2F_LEFT_BINOCULARS
	dw_const Route12Gate2FRightBinocularsText, TEXT_ROUTE12GATE2F_RIGHT_BINOCULARS

Route12Gate2FBrunetteGirlText:
	text_asm
	CheckEvent EVENT_GOT_TM39, 1
	jr c, .got_item
	ld hl, .YouCanHaveThisText
	rst _PrintText
	lb bc, TM_ROUTE_12_GATE_2F_MOURNING_GIRL, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM39Text
	rst _PrintText
	SetEvent EVENT_GOT_TM39
	jr .done
.bag_full
	ld hl, .TM39NoRoomText
	rst _PrintText
	jr .done
.got_item
	ld hl, .TM39ExplanationText
	rst _PrintText
.done
	rst TextScriptEnd

.YouCanHaveThisText:
	text_far _Route12Gate2FBrunetteGirlYouCanHaveThisText
	text_end

.ReceivedTM39Text:
	text_far _Route12Gate2FBrunetteGirlReceivedTM39Text
	sound_get_item_1
	text_end

.TM39ExplanationText:
	text_far _Route12Gate2FBrunetteGirlTM39ExplanationText
	text_end

.TM39NoRoomText:
	text_far _Route12Gate2FBrunetteGirlTM39NoRoomText
	text_end

Route12Gate2FLeftBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route12Gate2FLeftBinocularsText
	text_end

Route12Gate2FRightBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route12Gate2FRightBinocularsText
	text_end

GateUpstairsScript_PrintIfFacingUp:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr z, .up
	ld a, TRUE
	jr .done
.up
	rst _PrintText
	xor a
.done
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	rst TextScriptEnd
