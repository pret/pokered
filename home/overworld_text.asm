TextScriptEndingText::
	text_end

TextScriptEnd::
	ld hl, TextScriptEndingText
	ret

ExclamationText::
	text_far _ExclamationText
	text_end

GroundRoseText::
	text_far _GroundRoseText
	text_end

BoulderText::
; Pressing A on a boulder now activates Strength automatically.
	text_asm
	ld hl, wStatusFlags1
	set BIT_STRENGTH_ACTIVE, [hl]
	ld hl, .CanMoveBouldersText
	call PrintText
	jp TextScriptEnd
.CanMoveBouldersText
	text_far _CanMoveBouldersText
	text_end

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
