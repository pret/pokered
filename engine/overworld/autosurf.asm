CheckForAutoSurf::
	ld a, [wd728]
	bit 2, a ; is surf active?
	scf
	ret z ; if not we dont need to check anything
	callfar IsNextTileShoreOrWater ; is the tile in front of us a water tile?
	ret c ; don't try to surf on it if not
	ld hl, TilePairCollisionsWater
	call CheckForTilePairCollisions ; is it a water tile, but on a different elevation from the player's current position?
	ret c ; if so, don't try to surf on it
	ld a, [wd732]
	bit 5, a
	scf
	ret nz ; forced to ride bike on cycling road, no surfing allowed
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B4F
	jr z, .seaFoamCheck ; check if we're in the spot in seafoam where we can't surf if the water is running too quickly
.surfAllowed
	; should autosurf
	ld a, 2
	ld [wWalkBikeSurfState], a ; change player state to surfing
	call PlayDefaultMusic ; play surfing music
	call LoadPlayerSpriteGraphics
	and a
	ret

.seaFoamCheck
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	jr z, .surfAllowed
	ld a, [wXCoord]
	cp 7
	jr nz, .surfAllowed
	ld a, [wYCoord]
	cp 11
	scf ; block surfing if all of these conditions are satisfied
	ret z
	jr .surfAllowed
