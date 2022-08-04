TextScriptEndingText::
	text_end

TextScriptEnd::
	ld hl, TextScriptEndingText
	ret

;ExclamationText:: ; unused
;	text_far _ExclamationText
;	text_end

;GroundRoseText:: ; unused
;	text_far _GroundRoseText
;	text_end

BoulderText::
	text_asm
	callfar CheckStrengthUsage
	jp TextScriptEnd

MartSignText::
	text_far _MartSignText
	text_end

PokeCenterSignText::
	text_far _PokeCenterSignText
	text_end

PickUpItemText::
	text_asm
	predef PickUpItem
	jp TextScriptEnd

;;;;;;;;;; PureRGBnote: ADDED: text used when picking up multiple items at once

PickUp2ItemText::
	text_asm
	ld c, 2
	jr DoMultiItemPickup

PickUp3ItemText::
	text_asm
	ld c, 3
	jr DoMultiItemPickup

PickUp5ItemText::
	text_asm
	ld c, 5
	jr DoMultiItemPickup

DoMultiItemPickup:
	predef PickUpItemQuantity
	jp TextScriptEnd

;;;;;;;;;;
