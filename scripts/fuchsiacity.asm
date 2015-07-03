FuchsiaCityScript: ; 19a2b (6:5a2b)
	jp EnableAutoTextBoxDrawing

FuchsiaCityTextPointers: ; 19a2e (6:5a2e)
	dw FuchsiaCityText1
	dw FuchsiaCityText2
	dw FuchsiaCityText3
	dw FuchsiaCityText4
	dw FuchsiaCityText5
	dw FuchsiaCityText6
	dw FuchsiaCityText7
	dw FuchsiaCityText8
	dw FuchsiaCityText9
	dw FuchsiaCityText10
	dw FuchsiaCityText11
	dw FuchsiaCityText12
	dw FuchsiaCityText13
	dw MartSignText
	dw PokeCenterSignText
	dw FuchsiaCityText16
	dw FuchsiaCityText17
	dw FuchsiaCityText18
	dw FuchsiaCityText19
	dw FuchsiaCityText20
	dw FuchsiaCityText21
	dw FuchsiaCityText22
	dw FuchsiaCityText23
	dw FuchsiaCityText24

FuchsiaCityText1: ; 19a5e (6:5a5e)
	TX_FAR _FuchsiaCityText1
	db "@"

FuchsiaCityText2: ; 19a63 (6:5a63)
	TX_FAR _FuchsiaCityText2
	db "@"

FuchsiaCityText3: ; 19a68 (6:5a68)
	TX_FAR _FuchsiaCityText3
	db "@"

FuchsiaCityText4: ; 19a6d (6:5a6d)
	TX_FAR _FuchsiaCityText4
	db "@"

FuchsiaCityText5: ; 19a72 (6:5a72)
FuchsiaCityText6: ; 19a72 (6:5a72)
FuchsiaCityText7: ; 19a72 (6:5a72)
FuchsiaCityText8: ; 19a72 (6:5a72)
FuchsiaCityText9: ; 19a72 (6:5a72)
FuchsiaCityText10: ; 19a72 (6:5a72)
	TX_FAR _FuchsiaCityText5
	db "@"

FuchsiaCityText12: ; 19a77 (6:5a77)
FuchsiaCityText11: ; 19a77 (6:5a77)
	TX_FAR _FuchsiaCityText11
	db "@"

FuchsiaCityText13: ; 19a7c (6:5a7c)
	TX_FAR _FuchsiaCityText13
	db "@"

FuchsiaCityText16: ; 19a81 (6:5a81)
	TX_FAR _FuchsiaCityText16
	db "@"

FuchsiaCityText17: ; 19a86 (6:5a86)
	TX_FAR _FuchsiaCityText17
	db "@"

FuchsiaCityText18: ; 19a8b (6:5a8b)
	TX_FAR _FuchsiaCityText18
	db "@"

FuchsiaCityText19: ; 19a90 (6:5a90)
	TX_ASM
	ld hl, FuchsiaCityChanseyText
	call PrintText
	ld a, CHANSEY
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCityChanseyText: ; 19a9f (6:5a9f)
	TX_FAR _FuchsiaCityChanseyText
	db "@"

FuchsiaCityText20: ; 19aa4 (6:5aa4)
	TX_ASM
	ld hl, FuchsiaCityVoltorbText
	call PrintText
	ld a, VOLTORB
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCityVoltorbText: ; 19ab3 (6:5ab3)
	TX_FAR _FuchsiaCityVoltorbText
	db "@"

FuchsiaCityText21: ; 19ab8 (6:5ab8)
	TX_ASM
	ld hl, FuchsiaCityKangaskhanText
	call PrintText
	ld a, KANGASKHAN
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCityKangaskhanText: ; 19ac7 (6:5ac7)
	TX_FAR _FuchsiaCityKangaskhanText
	db "@"

FuchsiaCityText22: ; 19acc (6:5acc)
	TX_ASM
	ld hl, FuchsiaCitySlowpokeText
	call PrintText
	ld a, SLOWPOKE
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCitySlowpokeText: ; 19adb (6:5adb)
	TX_FAR _FuchsiaCitySlowpokeText
	db "@"

FuchsiaCityText23: ; 19ae0 (6:5ae0)
	TX_ASM
	ld hl, FuchsiaCityLaprasText
	call PrintText
	ld a, LAPRAS
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCityLaprasText: ; 19aef (6:5aef)
	TX_FAR _FuchsiaCityLaprasText
	db "@"

FuchsiaCityText24: ; 19af4 (6:5af4)
	TX_ASM
	ld a, [wd7f6]
	bit 6, a
	jr nz, .asm_3b4e8
	bit 7, a
	jr nz, .asm_667d5
	ld hl, FuchsiaCityText_19b2a
	call PrintText
	jr .asm_4343f
.asm_3b4e8
	ld hl, FuchsiaCityOmanyteText
	call PrintText
	ld a, OMANYTE
	jr .asm_81556
.asm_667d5
	ld hl, FuchsiaCityKabutoText
	call PrintText
	ld a, KABUTO
.asm_81556
	call DisplayPokedex
.asm_4343f
	jp TextScriptEnd

FuchsiaCityOmanyteText: ; 19b20 (6:5b20)
	TX_FAR _FuchsiaCityOmanyteText
	db "@"

FuchsiaCityKabutoText: ; 19b25 (6:5b25)
	TX_FAR _FuchsiaCityKabutoText
	db "@"

FuchsiaCityText_19b2a: ; 19b2a (6:5b2a)
	TX_FAR _FuchsiaCityText_19b2a
	db "@"
