CopycatsHouse2F_Script:
	jp EnableAutoTextBoxDrawing

CopycatsHouse2F_TextPointers:
	dw CopycatsHouse2FText1
	dw CopycatsHouse2FText2
	dw CopycatsHouse2FText3
	dw CopycatsHouse2FText4
	dw CopycatsHouse2FText5
	dw CopycatsHouse2FText6
	dw CopycatsHouse2FText7

CopycatsHouse2FText1:
	text_asm
	CheckEvent EVENT_GOT_TM31
	jr nz, .got_item
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CopycatsHouse2FText_5ccd4
	call PrintText
	ld b, POKE_DOLL
	call IsItemInBag
	jr z, .done
	ld hl, TM31PreReceiveText
	call PrintText
	lb bc, TM_MIMIC, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM31Text
	call PrintText
	ld a, POKE_DOLL
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GOT_TM31
	jr .done
.bag_full
	ld hl, TM31NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM31ExplanationText2
	call PrintText
.done
	jp TextScriptEnd

CopycatsHouse2FText_5ccd4:
	text_far _CopycatsHouse2FText_5ccd4
	text_end

TM31PreReceiveText:
	text_far _TM31PreReceiveText
	text_end

ReceivedTM31Text:
	text_far _ReceivedTM31Text
	sound_get_item_1
TM31ExplanationText1:
	text_far _TM31ExplanationText1
	text_waitbutton
	text_end

TM31ExplanationText2:
	text_far _TM31ExplanationText2
	text_end

TM31NoRoomText:
	text_far _TM31NoRoomText
	text_waitbutton
	text_end

CopycatsHouse2FText2:
	text_far _CopycatsHouse2FText2
	text_end

CopycatsHouse2FText5:
CopycatsHouse2FText4:
CopycatsHouse2FText3:
	text_far _CopycatsHouse2FText3
	text_end

CopycatsHouse2FText6:
	text_far _CopycatsHouse2FText6
	text_end

CopycatsHouse2FText7:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, CopycatsHouse2FText_5cd1c
	jr nz, .notUp
	ld hl, CopycatsHouse2FText_5cd17
.notUp
	call PrintText
	jp TextScriptEnd

CopycatsHouse2FText_5cd17:
	text_far _CopycatsHouse2FText_5cd17
	text_end

CopycatsHouse2FText_5cd1c:
	text_far _CopycatsHouse2FText_5cd1c
	text_end
