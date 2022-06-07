GetWildPokemonPalettes::
	;loads the palette flag array for the current map into wWildMonPalettes, which is 3 bytes long.
	ld hl, WildPalettePointers
	ld a, [wCurMap]

	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a       ; hl now points to wild pokemon palette flags for current map

	ld de, wWildMonPalettes
	ld bc, 3 ; 3 bytes long
	call CopyData
	ret

;[wIsAltPalettePkmn] = which encounter slot 0-9 for grass encounters, 10-19 for water encounters, 20-23 for super rod encounters 
;[wWildMonPalettes] = 24-bit flag-array that indicates which pokemon have alternate palettes for the current area
CheckWildPokemonPalettes::
	ld a, [wIsAltPalettePkmn]
	ld hl, wWildMonPalettes
	cp 8
	jr nc, .secondByte
	jr .getBit
.secondByte
	inc hl
	cp 16
	jr nc, .thirdByte
	sub 8
	jr .getBit
.thirdByte
	inc hl
	sub 16
.getBit
	and a
	ld b, a ; b = which bit to test from 0-7
	ld a, [hl] ; current byte of the palette flags array
	jr z, .clearAndTestBit
.loopShiftRight ; keep shifting until the bit we want to test is bit 0
	srl a
	dec b
	jr nz, .loopShiftRight
.clearAndTestBit
	and 1 ; zero every other bit than bit 0
	ld [wIsAltPalettePkmnData], a ; a now contains the flag value for whether the palette is alt or original.
	xor a
	ld [wIsAltPalettePkmn], a
	ret

INCLUDE "data/wild/palettes/wild_palettes.asm"