FuchsiaCity_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaCity_TextPointers:
	def_text_pointers
	dw_const FuchsiaCityYoungster1Text,      TEXT_FUCHSIACITY_YOUNGSTER1
	dw_const FuchsiaCityGamblerText,         TEXT_FUCHSIACITY_GAMBLER
	dw_const FuchsiaCityErikText,            TEXT_FUCHSIACITY_ERIK
	dw_const FuchsiaCityYoungster2Text,      TEXT_FUCHSIACITY_YOUNGSTER2
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_CHANSEY
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_VOLTORB
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_KANGASKHAN
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_SLOWPOKE
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_LAPRAS
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_FOSSIL
	dw_const FuchsiaCitySignText,            TEXT_FUCHSIACITY_SIGN1
	dw_const FuchsiaCitySignText,            TEXT_FUCHSIACITY_SIGN2
	dw_const FuchsiaCitySafariGameSignText,  TEXT_FUCHSIACITY_SAFARI_GAME_SIGN
	dw_const MartSignText,                   TEXT_FUCHSIACITY_MART_SIGN
	dw_const PokeCenterSignText,             TEXT_FUCHSIACITY_POKECENTER_SIGN
	dw_const FuchsiaCityWardensHomeSignText, TEXT_FUCHSIACITY_WARDENS_HOME_SIGN
	dw_const FuchsiaCitySafariZoneSignText,  TEXT_FUCHSIACITY_SAFARI_ZONE_SIGN
	dw_const FuchsiaCityGymSignText,         TEXT_FUCHSIACITY_GYM_SIGN
	dw_const FuchsiaCityChanseySignText,     TEXT_FUCHSIACITY_CHANSEY_SIGN
	dw_const FuchsiaCityVoltorbSignText,     TEXT_FUCHSIACITY_VOLTORB_SIGN
	dw_const FuchsiaCityKangaskhanSignText,  TEXT_FUCHSIACITY_KANGASKHAN_SIGN
	dw_const FuchsiaCitySlowpokeSignText,    TEXT_FUCHSIACITY_SLOWPOKE_SIGN
	dw_const FuchsiaCityLaprasSignText,      TEXT_FUCHSIACITY_LAPRAS_SIGN
	dw_const FuchsiaCityFossilSignText,      TEXT_FUCHSIACITY_FOSSIL_SIGN

FuchsiaCityYoungster1Text:
	text_far _FuchsiaCityYoungster1Text
	text_end

FuchsiaCityGamblerText:
	text_far _FuchsiaCityGamblerText
	text_end

FuchsiaCityErikText:
	text_far _FuchsiaCityErikText
	text_end

FuchsiaCityYoungster2Text:
	text_far _FuchsiaCityYoungster2Text
	text_end

FuchsiaCityPokemonText:
	text_far _FuchsiaCityPokemonText
	text_end

FuchsiaCitySignText:
	text_far _FuchsiaCitySignText
	text_end

FuchsiaCitySafariGameSignText:
	text_far _FuchsiaCitySafariGameSignText
	text_end

FuchsiaCityWardensHomeSignText:
	text_far _FuchsiaCityWardensHomeSignText
	text_end

FuchsiaCitySafariZoneSignText:
	text_far _FuchsiaCitySafariZoneSignText
	text_end

FuchsiaCityGymSignText:
	text_far _FuchsiaCityGymSignText
	text_end

FuchsiaCityChanseySignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, CHANSEY
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCityChanseySignText
	text_end

FuchsiaCityVoltorbSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, VOLTORB
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCityVoltorbSignText
	text_end

FuchsiaCityKangaskhanSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, KANGASKHAN
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCityKangaskhanSignText
	text_end

FuchsiaCitySlowpokeSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, SLOWPOKE
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCitySlowpokeSignText
	text_end

FuchsiaCityLaprasSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, LAPRAS
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _FuchsiaCityLaprasSignText
	text_end

FuchsiaCityFossilSignText:
	text_asm
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .got_dome_fossil
	CheckEventReuseA EVENT_GOT_HELIX_FOSSIL
	jr nz, .got_helix_fossil
	ld hl, .UndeterminedText
	call PrintText
	jr .done
.got_dome_fossil
	ld hl, .OmanyteText
	call PrintText
	ld a, OMANYTE
	jr .display
.got_helix_fossil
	ld hl, .KabutoText
	call PrintText
	ld a, KABUTO
.display
	call DisplayPokedex
.done
	jp TextScriptEnd

.OmanyteText:
	text_far _FuchsiaCityFossilSignOmanyteText
	text_end

.KabutoText:
	text_far _FuchsiaCityFossilSignKabutoText
	text_end

.UndeterminedText:
	text_far _FuchsiaCityFossilSignUndeterminedText
	text_end
