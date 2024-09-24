PrintPredefTextID::
	ldh [hTextID], a
	ld hl, TextPredefs
	call SetMapTextPointer
	ld hl, wTextPredefFlag
	set BIT_TEXT_PREDEF, [hl]
	call DisplayTextID

RestoreMapTextPointer::
	ld hl, wCurMapTextPtr
	ldh a, [hSavedMapTextPtr]
	ld [hli], a
	ldh a, [hSavedMapTextPtr + 1]
	ld [hl], a
	ret

SetMapTextPointer::
	ld a, [wCurMapTextPtr]
	ldh [hSavedMapTextPtr], a
	ld a, [wCurMapTextPtr + 1]
	ldh [hSavedMapTextPtr + 1], a
	ld a, l
	ld [wCurMapTextPtr], a
	ld a, h
	ld [wCurMapTextPtr + 1], a
	ret

INCLUDE "data/text_predef_pointers.asm"
