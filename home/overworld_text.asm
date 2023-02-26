TextScriptEndingText::
	text_end

TextScriptPromptButton::
	text_promptbutton
	text_end

;ExclamationText:: ; unused
;	text_far _ExclamationText
;	text_end

;GroundRoseText:: ; unused
;	text_far _GroundRoseText
;	text_end

BoulderText::
	text_asm
	callfar CheckStrengthUsage
	rst TextScriptEnd

PickUpItemText::
	text_asm
	predef PickUpItem
	rst TextScriptEnd

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
	; fall through

DoMultiItemPickup:
	predef PickUpItemQuantity
	rst TextScriptEnd

;;;;;;;;;;
