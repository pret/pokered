LavenderTown_Script:
	jp EnableAutoTextBoxDrawing

LavenderTown_TextPointers:
	def_text_pointers
	dw_const LavenderTownLittleGirlText,       TEXT_LAVENDERTOWN_LITTLE_GIRL
	dw_const LavenderTownCooltrainerMText,     TEXT_LAVENDERTOWN_COOLTRAINER_M
	dw_const LavenderTownSuperNerdText,        TEXT_LAVENDERTOWN_SUPER_NERD
	dw_const LavenderTownSignText,             TEXT_LAVENDERTOWN_SIGN
	dw_const LavenderTownSilphScopeSignText,   TEXT_LAVENDERTOWN_SILPH_SCOPE_SIGN
	dw_const MartSignText,                     TEXT_LAVENDERTOWN_MART_SIGN
	dw_const PokeCenterSignText,               TEXT_LAVENDERTOWN_POKECENTER_SIGN
	dw_const LavenderTownPokemonHouseSignText, TEXT_LAVENDERTOWN_POKEMON_HOUSE_SIGN
	dw_const LavenderTownPokemonTowerSignText, TEXT_LAVENDERTOWN_POKEMON_TOWER_SIGN

LavenderTownLittleGirlText:
	text_asm
	ld hl, .DoYouBelieveInGhostsText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .HaHaGuessNotText
	jr nz, .got_text
	ld hl, .SoThereAreBelieversText
.got_text
	call PrintText
	jp TextScriptEnd

.DoYouBelieveInGhostsText:
	text_far _LavenderTownLittleGirlDoYouBelieveInGhostsText
	text_end

.SoThereAreBelieversText:
	text_far _LavenderTownLittleGirlSoThereAreBelieversText
	text_end

.HaHaGuessNotText:
	text_far _LavenderTownLittleGirlHaHaGuessNotText
	text_end

LavenderTownCooltrainerMText:
	text_far _LavenderTownCooltrainerMText
	text_end

LavenderTownSuperNerdText:
	text_far _LavenderTownSuperNerdText
	text_end

LavenderTownSignText:
	text_far _LavenderTownSignText
	text_end

LavenderTownSilphScopeSignText:
	text_far _LavenderTownSilphScopeSignText
	text_end

LavenderTownPokemonHouseSignText:
	text_far _LavenderTownPokemonHouseSignText
	text_end

LavenderTownPokemonTowerSignText:
	text_far _LavenderTownPokemonTowerSignText
	text_end
