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
	TX_ASM
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
	TX_FAR PikachuFanText
	db "@"

.bettertext
	TX_FAR PikachuFanBetterText
	db "@"

FanClubText2:
; seel fan
	TX_ASM
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
	TX_FAR SeelFanText
	db "@"

.bettertext
	TX_FAR SeelFanBetterText
	db "@"

FanClubText3:
; pikachu
	TX_ASM
	ld hl, .text
	call PrintText
	ld a, PIKACHU
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.text
	TX_FAR FanClubPikachuText
	db "@"

FanClubText4:
; seel
	TX_ASM
	ld hl, .text
	call PrintText
	ld a, SEEL
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.text
	TX_FAR FanClubSeelText
	db "@"

FanClubText5:
; chair
	TX_ASM
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
	jr nc, .BagFull
	ld hl, .receivedvouchertext
	call PrintText
	SetEvent EVENT_GOT_BIKE_VOUCHER
	jr .done
.BagFull
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
	TX_FAR FanClubMeetChairText
	db "@"

.storytext
	TX_FAR FanClubChairStoryText
	db "@"

.receivedvouchertext
	TX_FAR ReceivedBikeVoucherText
	TX_SFX_KEY_ITEM
	TX_FAR ExplainBikeVoucherText
	db "@"

.nostorytext
	TX_FAR FanClubNoStoryText
	db "@"

.finaltext
	TX_FAR FanClubChairFinalText
	db "@"

.bagfulltext
	TX_FAR FanClubBagFullText
	db "@"

FanClubText6:
	TX_FAR _FanClubText6
	db "@"

FanClubText7:
	TX_FAR _FanClubText7
	db "@"

FanClubText8:
	TX_FAR _FanClubText8
	db "@"
