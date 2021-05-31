GetPredefPointer::
; Back up the contents of the registers (hl, de, bc).
; Then put the bank and address of predef
; wPredefID in [wPredefBank] and hl.

	ld a, h
	ld [wPredefHL], a
	ld a, l
	ld [wPredefHL + 1], a

	ld hl, wPredefDE
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a

	ASSERT wPredefDE + 2 == wPredefBC
	ld a, b
	ld [hli], a
	ld [hl], c

	ld hl, PredefPointers
	ld de, 0

	ld a, [wPredefID]
	ld e, a
	add a
	add e
	ld e, a
	jr nc, .nocarry
	inc d

.nocarry
	add hl, de
	ld d, h
	ld e, l

	; get bank of predef routine
	ld a, [de]
	ld [wPredefBank], a

	; get pointer
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a

	ret

INCLUDE "data/predef_pointers.asm"
