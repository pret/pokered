LavenderTown_Script:
	jp EnableAutoTextBoxDrawing

LavenderTown_TextPointers:
	dw LavenderTownText1
	dw LavenderTownText2
	dw LavenderTownText3
	dw LavenderTownText4
	dw LavenderTownText5
	dw MartSignText
	dw PokeCenterSignText
	dw LavenderTownText8
	dw LavenderTownText9

LavenderTownText1:
	text_asm
	ld hl, LavenderTownText_4413c
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, LavenderTownText_44146
	jr nz, .got_text
	ld hl, LavenderTownText_44141
.got_text
	call PrintText
	jp TextScriptEnd

LavenderTownText_4413c:
	text_far _LavenderTownText_4413c
	text_end

LavenderTownText_44141:
	text_far _LavenderTownText_44141
	text_end

LavenderTownText_44146:
	text_far _LavenderTownText_44146
	text_end

LavenderTownText2:
	text_far _LavenderTownText2
	text_end

LavenderTownText3:
	text_far _LavenderTownText3
	text_end

LavenderTownText4:
	text_far _LavenderTownText4
	text_end

LavenderTownText5:
	text_far _LavenderTownText5
	text_end

LavenderTownText8:
	text_far _LavenderTownText8
	text_end

LavenderTownText9:
	text_far _LavenderTownText9
	text_end
