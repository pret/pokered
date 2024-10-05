LoadWildData::
	ld hl, WildDataPointers
	ld a, [wCurMap]

	; get wild data for current map
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a       ; hl now points to wild data for current map
	ld a, [hli]
	ld [wGrassRate], a
	and a
	jr z, .NoGrassData ; if no grass data, skip to surfing data
	push hl
	ld de, wGrassMons ; otherwise, load grass data
	ld bc, $14
	rst _CopyData
	pop hl
	ld bc, $14
	add hl, bc
.NoGrassData
	ld a, [hli]
	ld [wWaterRate], a
	and a
	jr z, .loadPaletteData   ; if no water data, no need to load it
	ld de, wWaterMons  ; otherwise, load surfing data
	ld bc, $14
	rst _CopyData
.loadPaletteData
	jp GetWildPokemonPalettes ; PureRGBnote: ADDED: we always need to load the palette flags for wild pokemon on loading a map.

FindWaterLocations:
	ld b, 1
	jr FindWildLocationsOfMon

FindGrassCaveLocations:
	ld b, 0
; PureRGBnote: MOVED: creates a list at wBuffer of maps where the mon in [wPokedexNum] can be found.
; this is used by the pokedex to display locations the mon can be found on the map.
; input b = grass or water (0 = grass, 1 = water)
; now it will only find either grass or water locations into wBuffer, not both.
FindWildLocationsOfMon:
	ld hl, WildDataPointers
	ld de, wBuffer
	ld c, 0
.loop
	inc hl
	ld a, [hld]
	inc a
	jr z, .done ; if at list terminator of jump table, end search
	push hl ; push list of maps
	ld a, [hli]
	ld h, [hl]
	ld l, a ; deref current map's list of pokemon into hl
	ld a, b
	and a
	jr nz, .water
	ld a, [hli]
	and a ; first byte is >0 if we have grass encounters in this map
	call nz, CheckMapForMon ; land
	jr .doneCheck
.water
	ld a, [hli]
	and a
	jr z, .noGrassMons ; this map has no grass encounters if the first byte is 0
	; skip past grass encounters to the water mons
	push bc
	ld a, NUM_WILDMONS
	add a
	ld b, 0
	ld c, a
	add hl, bc
	pop bc
.noGrassMons
	ld a, [hli]
	and a ; first byte is >0 if we have water encounters in this map
	call nz, CheckMapForMon ; water
.doneCheck
	pop hl ; get back list of maps
	inc hl
	inc hl ; go to the next one
	inc c
	jr .loop
.done
	ld a, $ff ; list terminator
	ld [de], a
	ret

CheckMapForMon:
	inc hl
	push bc
	ld b, NUM_WILDMONS
.loop
	ld a, [wPokedexNum]
	cp [hl]
	jr z, .match
	; no match, go to next entry
	inc hl
	inc hl
	dec b
	jr nz, .loop
	; no match and finished searching through map entries
	dec hl
	pop bc
	ret
.match
	ld a, c
	ld [de], a
	inc de
	pop bc
	ret ; if given pokemon is found, end the loop (no need for map duplicates)

CheckHasGrassCaveWater:
	ld hl, WildDataPointers
	ld c, $0
.loop
	inc hl
	ld a, [hld]
	inc a
	ret z ; if a = 0 then we reached the end of the list of maps
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	and a
	jr z, .noGrassMons
	push hl
	call CheckMapForMonMatch ; land
	call c, .setGrass
	pop hl
	; seek to the start of water mons
	push bc
	ld a, NUM_WILDMONS
	add a
	ld b, 0
	ld c, a
	add hl, bc
	pop bc
.noGrassMons
	ld a, [hli]
	and a
	call nz, CheckMapForMonMatch ; water
	call c, .setWater
	pop hl
	ld a, [wTownMapAreaTypeFlags]
	and %110000
	cp %110000
	ret z ; if we marked both flags we can exit this subroutine early
	inc hl
	inc hl
	inc c
	jr .loop
.setGrass
	ld a, [wTownMapAreaTypeFlags]
	set BIT_HAS_GRASS_CAVE_LOCATIONS, a
	ld [wTownMapAreaTypeFlags], a
	ret
.setWater
	ld a, [wTownMapAreaTypeFlags]
	set BIT_HAS_WATER_LOCATIONS, a
	ld [wTownMapAreaTypeFlags], a
	ret

CheckMapForMonMatch:
	inc hl
	ld b, NUM_WILDMONS
.loop
	ld a, [wPokedexNum]
	cp [hl]
	jr nz, .nextEntry
.seekloop
	inc hl
	scf
	ret
.nextEntry
	inc hl
	inc hl
	dec b
	jr nz, .loop
	dec hl
	and a
	ret

INCLUDE "data/wild/grass_water.asm"
