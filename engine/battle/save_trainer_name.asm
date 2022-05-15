SaveTrainerName::
	ld hl, TrainerNamePointers
	ld a, [wTrainerClass]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcd6d
.copyCharacter
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copyCharacter
	ret

INCLUDE "data/trainers/name_pointers.asm"
