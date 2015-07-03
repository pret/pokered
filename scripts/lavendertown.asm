LavenderTownScript: ; 4410b (11:410b)
	jp EnableAutoTextBoxDrawing

LavenderTownTextPointers: ; 4410e (11:410e)
	dw LavenderTownText1
	dw LavenderTownText2
	dw LavenderTownText3
	dw LavenderTownText4
	dw LavenderTownText5
	dw MartSignText
	dw PokeCenterSignText
	dw LavenderTownText8
	dw LavenderTownText9

LavenderTownText1: ; 44120 (11:4120)
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

LavenderTownText_4413c: ; 4413c (11:413c)
	TX_FAR _LavenderTownText_4413c
	db "@"

LavenderTownText_44141: ; 44141 (11:4141)
	TX_FAR _LavenderTownText_44141
	db "@"

LavenderTownText_44146: ; 44146 (11:4146)
	TX_FAR _LavenderTownText_44146
	db "@"

LavenderTownText2: ; 4414b (11:414b)
	TX_FAR _LavenderTownText2
	db "@"

LavenderTownText3: ; 44150 (11:4150)
	TX_FAR _LavenderTownText3
	db "@"

LavenderTownText4: ; 44155 (11:4155)
	TX_FAR _LavenderTownText4
	db "@"

LavenderTownText5: ; 4415a (11:415a)
	TX_FAR _LavenderTownText5
	db "@"

LavenderTownText8: ; 4415f (11:415f)
	TX_FAR _LavenderTownText8
	db "@"

LavenderTownText9: ; 44164 (11:4164)
	TX_FAR _LavenderTownText9
	db "@"
