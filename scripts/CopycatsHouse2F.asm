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
	jr nz, .asm_7ccf3
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CopycatsHouse2FText_5ccd4
	call PrintText
	ld b, POKE_DOLL
	call IsItemInBag
	jr z, .asm_62ecd
	ld hl, TM31PreReceiveText
	call PrintText
	lb bc, TM_31, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM31Text
	call PrintText
	ld a, POKE_DOLL
	ld [hItemToRemoveID], a
	callba RemoveItemByID
	SetEvent EVENT_GOT_TM31
	jr .asm_62ecd
.BagFull
	ld hl, TM31NoRoomText
	call PrintText
	jr .asm_62ecd
.asm_7ccf3
	ld hl, TM31ExplanationText2
	call PrintText
.asm_62ecd
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
	text_linkpromptbutton
	text_end

TM31ExplanationText2:
	text_far _TM31ExplanationText2
	text_end

TM31NoRoomText:
	text_far _TM31NoRoomText
	text_linkpromptbutton
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
	ld a, [wSpriteStateData1 + 9]
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
