OriginalTypings:
db BUTTERFREE, BUG, FLYING
db NINETALES, FIRE, FIRE
db GOLDUCK, WATER, WATER
db SEADRA, WATER, WATER
db MAGMAR, FIRE, FIRE
db KABUTO, ROCK, WATER
db KABUTOPS, ROCK, WATER
db DODUO, NORMAL, FLYING
db DODRIO, NORMAL, FLYING
db VOLTORB, ELECTRIC, ELECTRIC
db ELECTRODE, ELECTRIC, ELECTRIC
db FEAROW, NORMAL, FLYING
db KINGLER, WATER, WATER
db PINSIR, BUG, BUG
db VICTREEBEL, GRASS, POISON
db SANDSHREW, GROUND, GROUND
db SANDSLASH, GROUND, GROUND
db PONYTA, FIRE, FIRE
db RAPIDASH, FIRE, FIRE
db GOLDEEN, WATER, WATER
db SEAKING, WATER, WATER
db MR_MIME, PSYCHIC_TYPE, PSYCHIC_TYPE
db ELECTABUZZ, ELECTRIC, ELECTRIC
db MAROWAK, GROUND, GROUND
db -1

; input: de = address of original typings in wram to be remapped
; wd0b5: which pokemon species to check
; output: rewrites the typings in wram if necessary
TryRemapTyping:
	ld a, [wOptions2]
	bit BIT_PKMN_TYPINGS, a
	ret z
	push de
	ld hl, OriginalTypings
	ld de, 3
	ld a, [wd0b5]
	call IsInArray
	jr nc, .noRemap
	pop de
	inc hl
	ld a, [hli]
	ld [de], a ; remap type 1 in wram
	inc de
	ld a, [hl]
	ld [de], a ; remap type 2 in wram
	ret
.noRemap
	pop de
	ret