CeladonMansionRoofHouse_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansionRoofHouse_TextPointers:
	dw CeladonMansion5Text1
	dw CeladonMansion5Text2

CeladonMansion5Text1:
	text_far _CeladonMansion5Text1
	text_end

CeladonMansion5Text2:
	text_asm
	lb bc, EEVEE, 25
	call GivePokemon
	jr nc, .asm_24365
	ld a, HS_CELADON_MANSION_EEVEE_GIFT
	ld [wMissableObjectIndex], a
	predef HideObject
.asm_24365
	jp TextScriptEnd
