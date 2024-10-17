; try to initiate a wild pokemon encounter
; returns success in Z
TryDoWildEncounter:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wMovementFlags]
	and a ; is player exiting a door, jumping over a ledge, or fishing?
	ret nz
	callfar IsPlayerStandingOnDoorTileOrWarpTile
	jr nc, .notStandingOnDoorOrWarpTile
.CantEncounter
	ld a, $1
	and a
	ret
.notStandingOnDoorOrWarpTile
	callfar IsPlayerJustOutsideMap
	jr z, .CantEncounter
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .next
	dec a
	jp z, .lastRepelStep
	ld [wRepelRemainingSteps], a
.next
; determine if wild pokemon can appear in the half-block we're standing in
; is the bottom right tile (9,9) of the half-block we're standing in a grass/water tile?
	hlcoord 9, 9
	ld c, [hl]
	call TestGrassTile ; PureRGBnote: FIXED: viridian forest and safari zone grass tiles are detected correctly
	ld a, [wGrassRate]
	jr z, .CanEncounter
	call TestWaterTile ; PureRGBnote: FIXED: Route 10 coast tiles will be treated as water encounter tiles instead of loading grass tiles
	ld a, [wWaterRate]
	jr z, .CanEncounter
; even if not in grass/water, standing anywhere we can encounter pokemon
; so long as the map is "indoor" and has wild pokemon defined.
; ...as long as it's not Viridian Forest or Safari Zone or Volcano.
	ld a, [wCurMap]
	cp FIRST_INDOOR_MAP ; is this an indoor map?
	jr c, .CantEncounter2
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .CantEncounter2
	cp FOREST ; Viridian Forest/Safari Zone
	jr z, .CantEncounter2
	ld a, [wGrassRate]
.CanEncounter
; compare encounter chance with a random number to determine if there will be an encounter
	ld b, a
	ldh a, [hRandomAdd]
	cp b
	jr nc, .CantEncounter2
	ldh a, [hRandomSub]
	ld b, a
	ld hl, WildMonEncounterSlotChances
	xor a
	ld c, a
.determineEncounterSlot
	ld a, [hli]
	cp b
	jr nc, .gotEncounterSlot
	inc c ; PureRGBnote: ADDED: c will store the current encounter slot index, used to help decide if that pokemon uses alternate palette
	inc hl
	jr .determineEncounterSlot
.gotEncounterSlot
	ld a, c
	ld [wIsAltPalettePkmn], a ; PureRGBnote: ADDED: store which encounter slot index (0-9) we ended up with into wIsAltPalettePokemon
	                          ;                     we still don't know if the pokemon is alt palette yet, just storing the index.
; determine which wild pokemon (grass or water) can appear in the half-block we're standing in
	ld c, [hl]
	ld hl, wGrassMons
	lda_coord 8, 9
	call TestWaterTile2 ; is the bottom left tile (8,9) of the half-block we're standing in a water tile?
	                    ; PureRGBnote: FIXED: Route 10 coast tiles will be treated as water encounter tiles instead of loading grass encounters
	jr nz, .gotWildEncounterType ; else, it's treated as a grass tile by default
	ld hl, wWaterMons
;;;;;;;;;; PureRGBnote: ADDED: for water encounters, need to modify the encounter slot index to account for water encounter alt palette flags starting at bit 10.
	ld a, [wIsAltPalettePkmn]
	add 10 ; water encounters start at bit 10
	ld [wIsAltPalettePkmn], a
;;;;;;;;;;
; since the bottom right tile of a "left shore" half-block is $14 but the bottom left tile is not,
; "left shore" half-blocks (such as the one in the east coast of Cinnabar) load grass encounters.
.gotWildEncounterType
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [wCurEnemyLevel], a
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld [wEnemyMonSpecies2], a
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .willEncounter
	ld a, [wPartyMon1Level]
	ld b, a
	ld a, [wCurEnemyLevel]
	cp b
	jr c, .CantEncounter2 ; repel prevents encounters if the leading party mon's level is higher than the wild mon
	jr .willEncounter
.lastRepelStep
	ld [wRepelRemainingSteps], a
	ld a, TEXT_REPEL_WORE_OFF
	ldh [hTextID], a
	call EnableAutoTextBoxDrawing
	call DisplayTextID
.CantEncounter2
	xor a
	ld [wIsAltPalettePkmn], a ; PureRGBnote: ADDED: if we end up not encountering a pokemon we need to clear this property as it may have been modified.
	ld a, $1
	and a
	ret
.willEncounter
	callfar CheckWildPokemonPalettes ; PureRGBnote: ADDED: checks if the pokemon should use an alt palette and if so stores 1 in wIsAltPalettePkmn
	xor a
	ret

TestGrassTile:
	ld a, [wGrassTile]
	cp c
	ret z
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .volcano
	cp FOREST
	ret nz
	ld a, $34	; check for the extra grass tile in the forest tileset
	cp c
	ret
;;;;; PureRGBnote: ADDED: In the volcano there are multiple encounter tiles and some are conditional.
.volcano
	; no encounters in first room
	ld a, [wXCoord]
	cp 6
	jr nc, .normal
	ld a, [wYCoord]
	cp 8
	ret c
.normal
	; volcano has a couple of encounter tiles
	ld a, $05
	cp c
	ret z
	ld a, $16
	cp c
	ret z
	ld a, $20
	cp c
	ret z
	; don't encounter on this specific tile in the lava flood room, but otherwise do
	CheckEvent EVENT_IN_LAVA_FLOOD_ROOM
	ret nz
	ld a, $27
	cp c
	ret
;;;;;

TestWaterTile:
;;;;;;;;;; PureRGBnote: ADDED: when in bills garden, if alt palettes are not turned on, don't encounter any pokemon at all
	ld a, [wCurMap]
	cp BILLS_GARDEN
	jr nz, .notBillsGarden
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a
	jr z, .cantEncounter ; skip encounters in bills garden if alt palettes are turned off
.notBillsGarden
;;;;;;;;;;
	ld a, $14 ; in all tilesets with a water tile, this is its id
	cp c
	ret z
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .volcano
	cp FOREST ; every map in FOREST tileset will treat the coast tile as a water encounter tile as well
	jr z, .forestCoastTileCheck 
	cp OVERWORLD
	ret nz ; maps not in FOREST or OVERWORLD tilesets dont have any other water tiles to consider
	ld a, [wCurMap]
	cp ROUTE_20	; every OVERWORLD map except route 20 will treat tile 32 as a water encounter tile as well 
	            ; (route 20 is an exception to preserve missingno behaviour)
	jr nz, .overworldCoastTileCheck
.cantEncounter
	ld a, 1
	and a ; clear z flag
	ret
.forestCoastTileCheck
	ld a, $48 ; left coast tile in FOREST tileset
	cp c
	ret
.overworldCoastTileCheck
	ld a, $32 ; left coast tile in OVERWORLD tileset
	cp c
	ret
;;;;; PureRGBnote: ADDED: volcano has two lava bubble tiles that generate encounters too
.volcano
	ld a, $21
	cp c
	ret z
	ld a, $06
	cp c
	ret
;;;;;

TestWaterTile2:
	push bc
	ld c, a
	call TestWaterTile
	pop bc
	ret

INCLUDE "data/wild/probabilities.asm"
