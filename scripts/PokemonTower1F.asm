; PureRGBnote: ADDED: a stairway downstairs was added, but it is blocked by a new ROCKET who tells you to go away until you save mr fuji.

PokemonTower1F_Script:
	jp EnableAutoTextBoxDrawing

PokemonTower1F_TextPointers:
	def_text_pointers
	dw_const PokemonTower1FReceptionistText,    TEXT_POKEMONTOWER1F_RECEPTIONIST
	dw_const PokemonTower1FMiddleAgedWomanText, TEXT_POKEMONTOWER1F_MIDDLE_AGED_WOMAN
	dw_const PokemonTower1FBaldingGuyText,      TEXT_POKEMONTOWER1F_BALDING_GUY
	dw_const PokemonTower1FGirlText,            TEXT_POKEMONTOWER1F_GIRL
	dw_const PokemonTower1FChannelerText,       TEXT_POKEMONTOWER1F_CHANNELER
	dw_const PokemonTower1FRocketText,          TEXT_POKEMONTOWER1F_ROCKET

PokemonTower1FReceptionistText:
	text_far _PokemonTower1FReceptionistText
	text_end

PokemonTower1FMiddleAgedWomanText:
	text_far _PokemonTower1FMiddleAgedWomanText
	text_end

PokemonTower1FBaldingGuyText:
	text_far _PokemonTower1FBaldingGuyText
	text_end

PokemonTower1FGirlText:
	text_far _PokemonTower1FGirlText
	text_end

PokemonTower1FChannelerText:
	text_far _PokemonTower1FChannelerText
	text_end

PokemonTower1FRocketText:
	text_asm
	ld hl, PokemonTower1FRocketText1
	rst _PrintText
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	ld hl, PokemonTower1FRocketText2
	jr z, .done
	ld hl, PokemonTower1FRocketText3
.done
	rst _PrintText
	rst TextScriptEnd

PokemonTower1FRocketText1:
	text_far _PokemonTower1FRocketText
	text_end

PokemonTower1FRocketText2:
	text_far _PokemonTower1FRocketText2
	text_end

PokemonTower1FRocketText3:
	text_far _PokemonTower1FRocketText3
	text_end

