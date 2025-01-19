TryDoWildEncounter:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wMovementFlags]
	and a
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
	jr z, .lastRepelStep
	ld [wRepelRemainingSteps], a
.next
	; BUG: This coordinates set is inconsistent with
	; the one in the .gotEncounterSlot subroutine below.
	; It was changed from the Japanese versions and
	; reverted for the Western localizations of Yellow.
	; A (9, 9) coordinates set affects wild encounters as
	; they do not occur in tile $34 of the FOREST tileset.
	; The inconsistency causes wGrassRate, which is also
	; wLinkEnemyTrainerName, in both NPC trades and the
	; old man battle type to have random wild encounter data.
	; This localization issue is infamously responsible for
	; the discovery of MISSINGNO. in English Red and Blue
	; while surfing on the eastern shore of CINNABAR_ISLAND,
	; which is actually part of the ROUTE_20 map.
	hlcoord 9, 9 ; should be hlcoord 8, 9
	ld c, [hl]
	ld a, [wGrassTile]
	cp c
	ld a, [wGrassRate] ; same as [wLinkEnemyTrainerName]
	jr z, .CanEncounter
	ld a, $14 ; water tile
	cp c
	ld a, [wWaterRate]
	jr z, .CanEncounter
	ld a, [wCurMap]
	cp FIRST_INDOOR_MAP
	jr c, .CantEncounter2
	ld a, [wCurMapTileset]
	cp FOREST ; VIRIDIAN_FOREST, SAFARI_ZONE
	jr z, .CantEncounter2
	ld a, [wGrassRate] ; same as [wLinkEnemyTrainerName]
.CanEncounter
	ld b, a
	ldh a, [hRandomAdd]
	cp b
	jr nc, .CantEncounter2
	ldh a, [hRandomSub]
	ld b, a
	ld hl, WildMonEncounterSlotChances
.determineEncounterSlot
	ld a, [hli]
	cp b
	jr nc, .gotEncounterSlot
	inc hl
	jr .determineEncounterSlot
.gotEncounterSlot
	ld c, [hl]
	ld hl, wGrassMons
	lda_coord 8, 9
	cp $14 ; water tile
	jr nz, .gotWildEncounterType
	ld hl, wWaterMons
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
	jr c, .CantEncounter2
	jr .willEncounter
.lastRepelStep
	ld [wRepelRemainingSteps], a
	ld a, TEXT_REPEL_WORE_OFF
	ldh [hTextID], a
	call EnableAutoTextBoxDrawing
	call DisplayTextID
.CantEncounter2
	ld a, $1
	and a
	ret
.willEncounter
	xor a
	ret

INCLUDE "data/wild/probabilities.asm"
