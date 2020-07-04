IndigoPlateauStatues::
	TX_ASM
	ld hl, IndigoPlateauStatuesText1
	call PrintText
	ld a, [wXCoord]
	bit 0, a
	ld hl, IndigoPlateauStatuesText2
	jr nz, .ok
	ld hl, IndigoPlateauStatuesText3
.ok
	call PrintText
	jp TextScriptEnd

IndigoPlateauStatuesText1:
	TX_FAR _IndigoPlateauStatuesText1
	db "@"

IndigoPlateauStatuesText2:
	TX_FAR _IndigoPlateauStatuesText2
	db "@"

IndigoPlateauStatuesText3:
	TX_FAR _IndigoPlateauStatuesText3
	db "@"
