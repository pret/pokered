PokemonFanClub_Script:
	jp EnableAutoTextBoxDrawing

FanClubBikeInBag:
; check if any bike paraphernalia in bag
	CheckEvent EVENT_GOT_BIKE_VOUCHER
	ret nz
	ld b, BICYCLE
	call IsItemInBag
	ret nz
	ld b, BIKE_VOUCHER
	jp IsItemInBag

PokemonFanClub_TextPointers:
	dw FanClubText1
	dw FanClubText2
	dw FanClubText3
	dw FanClubText4
	dw FanClubText5
	dw FanClubText6
	dw FanClubText7
	dw FanClubText8

FanClubText1:
; pikachu fan
	text_asm
	CheckEvent EVENT_PIKACHU_FAN_BOAST
	jr nz, .mineisbetter
	ld hl, .normaltext
	call PrintText
	SetEvent EVENT_SEEL_FAN_BOAST
	jr .done
.mineisbetter
	ld hl, .bettertext
	call PrintText
	ResetEvent EVENT_PIKACHU_FAN_BOAST
.done
	jp TextScriptEnd

.normaltext
	text_far PikachuFanText
	text_end

.bettertext
	text_far PikachuFanBetterText
	text_end

FanClubText2:
; seel fan
	text_asm
	CheckEvent EVENT_SEEL_FAN_BOAST
	jr nz, .mineisbetter
	ld hl, .normaltext
	call PrintText
	SetEvent EVENT_PIKACHU_FAN_BOAST
	jr .done
.mineisbetter
	ld hl, .bettertext
	call PrintText
	ResetEvent EVENT_SEEL_FAN_BOAST
.done
	jp TextScriptEnd

.normaltext
	text_far SeelFanText
	text_end

.bettertext
	text_far SeelFanBetterText
	text_end

FanClubText3:
; pikachu
	text_asm
	ld hl, .text
	call PrintText
	ld a, PIKACHU
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.text
	text_far FanClubPikachuText
	text_end

FanClubText4:
; seel
	text_asm
	ld hl, .text
	call PrintText
	ld a, SEEL
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.text
	text_far FanClubSeelText
	text_end

FanClubText5:
; chair
	text_asm
	call FanClubBikeInBag
	jr nz, .nothingleft

	ld hl, .meetchairtext
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .nothanks

	; tell the story
	ld hl, .storytext
	call PrintText
	lb bc, BIKE_VOUCHER, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .receivedvouchertext
	call PrintText
	SetEvent EVENT_GOT_BIKE_VOUCHER
	jr .done
.bag_full
	ld hl, .bagfulltext
	call PrintText
	jr .done
.nothanks
	ld hl, .nostorytext
	call PrintText
	jr .done
.nothingleft
	ld hl, .finaltext
	call PrintText
.done
	jp TextScriptEnd

.meetchairtext
	text_far FanClubMeetChairText
	text_end

.storytext
	text_far FanClubChairStoryText
	text_end

.receivedvouchertext
	text_far ReceivedBikeVoucherText
	sound_get_key_item
	text_far ExplainBikeVoucherText
	text_end

.nostorytext
	text_far FanClubNoStoryText
	text_end

.finaltext
	text_far FanClubChairFinalText
	text_end

.bagfulltext
	text_far FanClubBagFullText
	text_end

FanClubText6:
	text_far _FanClubText6
	text_end

FanClubText7:
	text_far _FanClubText7
	text_end

FanClubText8:
	text_far _FanClubText8
	text_end
