PewterNidoranHouse_Script:
	jp EnableAutoTextBoxDrawing

PewterNidoranHouse_TextPointers:
	dw PewterHouse1Text1
	dw PewterHouse1Text2
	dw PewterHouse1Text3
	dw PewterHouse1Text4

PewterHouse1Text1:
	text_far _PewterHouse1Text1
	text_asm
	ld a, NIDORAN_M
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd

PewterHouse1Text2:
	text_far _PewterHouse1Text2
	text_end

PewterHouse1Text3:
	text_far _PewterHouse1Text3
	text_end

; PureRGBnote: ADDED: new NPC who will talk about alternate color palettes if the feature is enabled.
PewterHouse1Text4:
	text_asm
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr nz, .altPalettes
	ld hl, PewterHouse1Text4Default
	jr .done
.altPalettes
	ld hl, PewterHouse1Text4Color
.done
	rst PrintTextRST
	rst TextScriptEnd

PewterHouse1Text4Default::
	text_far _PewterHouse1Text4
	text_end

PewterHouse1Text4Color::
	text_far _PewterHouse1Text4Color
	text_end