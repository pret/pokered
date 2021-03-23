PrintPredefTextID::
	ldh [hSpriteIndexOrTextID], a
	ld hl, TextPredefs
	call SetMapTextPointer
	ld hl, wTextPredefFlag
	set 0, [hl]
	call DisplayTextID

RestoreMapTextPointer::
	ld hl, wMapTextPtr
	ldh a, [hSavedMapTextPtr]
	ld [hli], a
	ldh a, [hSavedMapTextPtr + 1]
	ld [hl], a
	ret

SetMapTextPointer::
	ld a, [wMapTextPtr]
	ldh [hSavedMapTextPtr], a
	ld a, [wMapTextPtr + 1]
	ldh [hSavedMapTextPtr + 1], a
	ld a, l
	ld [wMapTextPtr], a
	ld a, h
	ld [wMapTextPtr + 1], a
	ret

INCLUDE "data/text_predef_pointers.asm"
