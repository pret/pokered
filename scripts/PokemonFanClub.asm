PokemonFanClub_Script:
	jp EnableAutoTextBoxDrawing

PokemonFanClub_CheckBikeInBag:
; check if any bike paraphernalia in bag
	CheckEvent EVENT_GOT_BIKE_VOUCHER
	ret nz
	ld b, BICYCLE
	call IsItemInBag
	ret nz
	ld b, BIKE_VOUCHER
	jp IsItemInBag

PokemonFanClub_TextPointers:
	def_text_pointers
	dw_const PokemonFanClubPikachuFanText,   TEXT_POKEMONFANCLUB_PIKACHU_FAN
	dw_const PokemonFanClubSeelFanText,      TEXT_POKEMONFANCLUB_SEEL_FAN
	dw_const PokemonFanClubPikachuText,      TEXT_POKEMONFANCLUB_PIKACHU
	dw_const PokemonFanClubSeelText,         TEXT_POKEMONFANCLUB_SEEL
	dw_const PokemonFanClubChairmanText,     TEXT_POKEMONFANCLUB_CHAIRMAN
	dw_const PokemonFanClubReceptionistText, TEXT_POKEMONFANCLUB_RECEPTIONIST
	dw_const PokemonFanClubSign1Text,        TEXT_POKEMONFANCLUB_SIGN_1
	dw_const PokemonFanClubSign2Text,        TEXT_POKEMONFANCLUB_SIGN_2

PokemonFanClubPikachuFanText:
	text_asm
	CheckEvent EVENT_PIKACHU_FAN_BOAST
	jr nz, .mineisbetter
	ld hl, .NormalText
	rst _PrintText
	SetEvent EVENT_SEEL_FAN_BOAST
	jr .done
.mineisbetter
	ld hl, .BetterText
	rst _PrintText
	ResetEvent EVENT_PIKACHU_FAN_BOAST
.done
	rst TextScriptEnd

.NormalText:
	text_far _PokemonFanClubPikachuFanNormalText
	text_end

.BetterText:
	text_far _PokemonFanClubPikachuFanBetterText
	text_end

PokemonFanClubSeelFanText:
	text_asm
	CheckEvent EVENT_SEEL_FAN_BOAST
	jr nz, .mineisbetter
	ld hl, .NormalText
	rst _PrintText
	SetEvent EVENT_PIKACHU_FAN_BOAST
	jr .done
.mineisbetter
	ld hl, .BetterText
	rst _PrintText
	ResetEvent EVENT_SEEL_FAN_BOAST
.done
	rst TextScriptEnd

.NormalText:
	text_far _PokemonFanClubSeelFanNormalText
	text_end

.BetterText:
	text_far _PokemonFanClubSeelFanBetterText
	text_end

PokemonFanClubPikachuText:
	text_asm
	ld hl, .Text
	rst _PrintText
	ld a, PIKACHU
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd

.Text
	text_far _PokemonFanClubPikachuText
	text_end

PokemonFanClubSeelText:
	text_asm
	ld hl, .Text
	rst _PrintText
	ld a, SEEL
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd

.Text:
	text_far _PokemonFanClubSeelText
	text_end

PokemonFanClubChairmanText:
	text_asm
	call PokemonFanClub_CheckBikeInBag
	jr nz, .nothingleft
	ld hl, .IntroText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .nothanks

	; tell the story
	ld hl, .StoryText
	rst _PrintText
	lb bc, BIKE_VOUCHER, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .BikeVoucherText
	rst _PrintText
	SetEvent EVENT_GOT_BIKE_VOUCHER
	jr .done
.bag_full
	ld hl, .BagFullText
	rst _PrintText
	jr .done
.nothanks
	ld hl, .NoStoryText
	rst _PrintText
	jr .done
.nothingleft
	ld hl, .FinalText
	rst _PrintText
.done
	rst TextScriptEnd

.IntroText:
	text_far _PokemonFanClubChairmanIntroText
	text_end

.StoryText:
	text_far _PokemonFanClubChairmanStoryText
	text_end

.BikeVoucherText:
	text_far _PokemonFanClubReceivedBikeVoucherText
	sound_get_key_item
	text_far _PokemonFanClubExplainBikeVoucherText
	text_end

.NoStoryText:
	text_far _PokemonFanClubNoStoryText
	text_end

.FinalText:
	text_far _PokemonFanClubChairFinalText
	text_end

.BagFullText:
	text_far _PokemonFanClubBagFullText
	text_end

PokemonFanClubReceptionistText:
	text_far _PokemonFanClubReceptionistText
	text_end

PokemonFanClubSign1Text:
	text_far _PokemonFanClubSign1Text
	text_end

PokemonFanClubSign2Text:
	text_far _PokemonFanClubSign2Text
	text_end
