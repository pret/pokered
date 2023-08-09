PewterNidoranHouse_Script:
	jp EnableAutoTextBoxDrawing

PewterNidoranHouse_TextPointers:
	def_text_pointers
	dw_const PewterNidoranHouseNidoranText,          TEXT_PEWTERNIDORANHOUSE_NIDORAN
	dw_const PewterNidoranHouseLittleBoyText,        TEXT_PEWTERNIDORANHOUSE_LITTLE_BOY
	dw_const PewterNidoranHouseMiddleAgedManText,    TEXT_PEWTERNIDORANHOUSE_MIDDLE_AGED_MAN
	dw_const PewterNidoranHouseMiddleAgedWomanText,  TEXT_PEWTERNIDORANHOUSE_MIDDLE_AGED_WOMAN

PewterNidoranHouseNidoranText:
	text_far _PewterNidoranHouseNidoranText
	text_asm
	ld a, NIDORAN_M
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd

PewterNidoranHouseLittleBoyText:
	text_far _PewterNidoranHouseLittleBoyText
	text_end

PewterNidoranHouseMiddleAgedManText:
	text_far _PewterNidoranHouseMiddleAgedManText
	text_end

; PureRGBnote: ADDED: new NPC who will talk about alternate color palettes if the feature is enabled.
PewterNidoranHouseMiddleAgedWomanText:
	text_asm
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr nz, .altPalettes
	ld hl, .Text
	jr .done
.altPalettes
	ld hl, .TextColor
.done
	rst _PrintText
	rst TextScriptEnd

.Text
	text_far _PewterHouse1Text4
	text_end

.TextColor::
	text_far _PewterHouse1Text4Color
	text_end