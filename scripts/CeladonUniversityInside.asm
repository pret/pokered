CeladonUniversityInside_Script:
	jp EnableAutoTextBoxDrawing

CeladonUniversityInside_TextPointers:
	dw CeladonUniversityInsideText1
	dw CeladonUniversityInsideText2
	dw CeladonUniversityInsideText3
	dw CeladonUniversityInsideText4
	dw CeladonUniversityInsideBookcaseText1
	dw CeladonUniversityInsideBookcaseText2
	dw CeladonUniversityInsideBookcaseText3
	dw SlowbroCry
	dw MoveDeleterText1
	dw MoveRelearnerText1
	dw CeladonUniversityInsideText5
	dw CeladonUniversityPCScreen

CeladonUniversityInsideText1:
	text_far _CeladonUniversityInsideText1
	text_end

CeladonUniversityInsideText2:
	text_far _CeladonUniversityInsideText2
	text_end

CeladonUniversityInsideText3:
	text_far _CeladonUniversityInsideText3
	text_end

CeladonUniversityInsideText4:
	text_asm
	CheckEvent EVENT_GOT_TM23
	jr nz, .got_item
	ld hl, KHRP
	call PrintText
	lb bc, TM_DRAGON_RAGE, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM23Text
	call PrintText
	SetEvent EVENT_GOT_TM23
	jr .done
.bag_full
	ld hl, TM23NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM23ExplanationText
	call PrintText
.done
	jp TextScriptEnd
	
	text_end

CeladonUniversityInsideBookcaseText1:
	text_far _BookcaseText1
	text_end

CeladonUniversityInsideBookcaseText2:
	text_far _BookcaseText2
	text_end

CeladonUniversityInsideBookcaseText3:
	text_far _BookcaseText3
	text_end

SlowbroCry:
	text_far _SlowbroCry
	text_asm
	ld a, SLOWBRO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

CeladonUniversityInsideMagikarpText:
	text_far _CeladonUniversityInsideMagikarpText
	text_end

CeladonUniversityInsideText5:
	text_asm
	ld hl, CeladonUniversityInsideMagikarpText
	call PrintText
	ld a, MAGIKARP
	call DisplayPokedex
	jp TextScriptEnd

CeladonUniversityPCScreen:
	text_far _ComputerScreen
	text_end

KHRP:
	text_far _KHRP
	text_end

ReceivedTM23Text:
	text_far _ReceivedTM23Text
	sound_get_item_1
	text_end

TM23ExplanationText:
	text_far _TM23ExplanationText
	text_end

TM23NoRoomText:
	text_far _TM23NoRoomText
	text_end

	text_end ; unused
