TextScriptEndingChar::
	db "@"

TextScriptEnd::
	ld hl, TextScriptEndingChar
	ret

ExclamationText::
	TX_FAR _ExclamationText
	db "@"

GroundRoseText::
	TX_FAR _GroundRoseText
	db "@"

BoulderText::
	TX_FAR _BoulderText
	db "@"

MartSignText::
	TX_FAR _MartSignText
	db "@"

PokeCenterSignText::
	TX_FAR _PokeCenterSignText
	db "@"

PickUpItemText::
	TX_ASM
	predef PickUpItem
	jp TextScriptEnd
