NameRatersHouse_Script:
	jp EnableAutoTextBoxDrawing

NameRatersHouseYesNoScript:
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

NameRatersHouseCheckMonOTScript:
; return carry if mon's OT name or OT ID do not match the player's
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wPlayerName
	ld c, NAME_LENGTH
	call .check_match_loop
	jr c, .no_match
	ld hl, wPartyMon1OTID
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wPlayerID
	ld c, $2
.check_match_loop
	ld a, [de]
	cp [hl]
	jr nz, .no_match
	inc hl
	inc de
	dec c
	jr nz, .check_match_loop
	and a
	ret
.no_match
	scf
	ret

NameRatersHouse_TextPointers:
	def_text_pointers
	dw_const NameRatersHouseNameRaterText, TEXT_NAMERATERSHOUSE_NAME_RATER

NameRatersHouseNameRaterText:
	text_asm
	call SaveScreenTilesToBuffer2
	ld hl, .WantMeToRateText
	call NameRatersHouseYesNoScript
	jr nz, .did_not_rename
	ld hl, .WhichPokemonText
	call PrintText
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jr c, .did_not_rename
	call GetPartyMonName2
	call NameRatersHouseCheckMonOTScript
	ld hl, .ATrulyImpeccableNameText
	jr c, .done
	ld hl, .GiveItANiceNameText
	call NameRatersHouseYesNoScript
	jr nz, .did_not_rename
	ld hl, .WhatShouldWeNameItText
	call PrintText
	farcall DisplayNameRaterScreen
	jr c, .did_not_rename
	ld hl, .PokemonHasBeenRenamedText
.done
	call PrintText
	jp TextScriptEnd
.did_not_rename
	ld hl, .ComeAnyTimeYouLikeText
	jr .done

.WantMeToRateText:
	text_far _NameRatersHouseNameRaterWantMeToRateText
	text_end

.WhichPokemonText:
	text_far _NameRatersHouseNameRaterWhichPokemonText
	text_end

.GiveItANiceNameText:
	text_far _NameRatersHouseNameRaterGiveItANiceNameText
	text_end

.WhatShouldWeNameItText:
	text_far _NameRatersHouseNameRaterWhatShouldWeNameItText
	text_end

.PokemonHasBeenRenamedText:
	text_far _NameRatersHouseNameRaterPokemonHasBeenRenamedText
	text_end

.ComeAnyTimeYouLikeText:
	text_far _NameRatersHouseNameRaterComeAnyTimeYouLikeText
	text_end

.ATrulyImpeccableNameText:
	text_far _NameRatersHouseNameRaterATrulyImpeccableNameText
	text_end
