CeladonMansion5Script: ; 1dd3a (7:5d3a)
	jp EnableAutoTextBoxDrawing

CeladonMansion5TextPointers: ; 1dd3d (7:5d3d)
	dw CeladonMansion5Text1
	dw CeladonMansion5Text2

CeladonMansion5Text1: ; 1dd41 (7:5d41)
	TX_FAR _CeladonMansion5Text1
	db "@"

CeladonMansion5Text2: ; 1dd46 (7:5d46)
	db $08 ; asm
	ld bc,(EEVEE << 8) | 25
	call GivePokemon
	jr nc, .asm_24365 ; 0x1dd4d
	ld a, HS_CELADON_MANSION_5_GIFT
	ld [wcc4d], a
	predef HideObject
.asm_24365 ; 0x1dd59
	jp TextScriptEnd
