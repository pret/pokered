; PureRGBnote: ADDED: code for remapping typings of pokenon to their original ones if desired.

OriginalTypings:
db BUTTERFREE, BUG, FLYING
db FEAROW, NORMAL, FLYING
db SANDSHREW, GROUND, GROUND
db SANDSLASH, GROUND, GROUND
db NINETALES, FIRE, FIRE
db GOLDUCK, WATER, WATER
db VICTREEBEL, GRASS, POISON
db PONYTA, FIRE, FIRE
db RAPIDASH, FIRE, FIRE
db DODUO, NORMAL, FLYING
db DODRIO, NORMAL, FLYING
db KINGLER, WATER, WATER
db VOLTORB, ELECTRIC, ELECTRIC
db ELECTRODE, ELECTRIC, ELECTRIC
db MAROWAK, GROUND, GROUND
db SEADRA, WATER, WATER
db GOLDEEN, WATER, WATER
db SEAKING, WATER, WATER
db MR_MIME, PSYCHIC_TYPE, PSYCHIC_TYPE
db ELECTABUZZ, ELECTRIC, ELECTRIC
db PINSIR, BUG, BUG
db KABUTO, ROCK, WATER
db KABUTOPS, ROCK, WATER
db -1

; input: de = address of original typings in wram to be remapped
; wCurSpecies: which pokemon species to check
; output: rewrites the typings in wram if necessary
TryRemapTyping:
	call IsMonTypeRemapped
	ret nc
	ld a, [hli]
	ld [de], a ; remap type 1 in wram
	inc de
	ld a, [hl]
	ld [de], a ; remap type 2 in wram
	ret

; input: d = type 1 e = type 2
; wCurSpecies: which pokemon species to check
; output: d = type 1 (may be remapped) e = type 2 (may be remapped)
TryRemapTypingNoWramChange::
	call IsMonTypeRemapped
	ret nc
	ld a, [hli]
	ld d, a ; return remapped type 1
	ld a, [hl]
	ld e, a ; return remapped type 2
	ret

IsMonTypeRemapped:
	push de
	ld hl, wPkmnTypeRemapFlags
	ld b, 3
	call CountSetBitsPreserveWRAM
	and a ; is the number of set bits non-zero
	jr z, .noRemap
	ld hl, OriginalTypings
	ld de, 3
	ld a, [wCurSpecies]
	call IsInArray
	jr nc, .noRemap
	push hl
	ld c, b ; b = which index in the flag array to check
	ld hl, wPkmnTypeRemapFlags
	ld b, FLAG_TEST
	predef FlagActionPredef
	pop hl
	ld a, c
	and a
	jr z, .noRemap
	pop de
	inc hl
	scf
	ret
.noRemap
	pop de
	and a ; clear carry flag
	ret
	
CountSetBitsPreserveWRAM::
	ld a, [wNumSetBits]
	push af
	call CountSetBits
	pop af
	ld [wNumSetBits], a
	ld a, c
	ret