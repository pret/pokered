IndigoPlateauStatues::
	text_asm
	ld hl, IndigoPlateauStatuesText1
	rst _PrintText
	ld a, [wXCoord]
	bit 0, a
	ld hl, IndigoPlateauStatuesText2
	jr nz, .ok
	ld hl, IndigoPlateauStatuesText3
.ok
	rst _PrintText
	rst TextScriptEnd

IndigoPlateauStatuesText1:
	text_far _IndigoPlateauStatuesText1
	text_end

IndigoPlateauStatuesText2:
	text_far _IndigoPlateauStatuesText2
	text_end

IndigoPlateauStatuesText3:
	text_far _IndigoPlateauStatuesText3
	text_end
