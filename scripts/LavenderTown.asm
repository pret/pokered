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
	TX_ASM
	ld hl, LavenderTownText_4413c
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, LavenderTownText_44146
	jr nz, .asm_40831
	ld hl, LavenderTownText_44141
.asm_40831
	call PrintText
	jp TextScriptEnd

LavenderTownText_4413c:
	TX_FAR _LavenderTownText_4413c
	db "@"

LavenderTownText_44141:
	TX_FAR _LavenderTownText_44141
	db "@"

LavenderTownText_44146:
	TX_FAR _LavenderTownText_44146
	db "@"

LavenderTownText2:
	TX_FAR _LavenderTownText2
	db "@"

LavenderTownText3:
	TX_FAR _LavenderTownText3
	db "@"

LavenderTownText4:
	TX_FAR _LavenderTownText4
	db "@"

LavenderTownText5:
	TX_FAR _LavenderTownText5
	db "@"

LavenderTownText8:
	TX_FAR _LavenderTownText8
	db "@"

LavenderTownText9:
	TX_FAR _LavenderTownText9
	db "@"
