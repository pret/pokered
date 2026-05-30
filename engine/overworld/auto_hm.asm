; Called via farcall from the overworld A-button handler when the player
; presses A and there is no NPC or sign in front. Triggers Cut on a cuttable
; tree/grass or starts Surf on a water tile, if applicable.

TryAutoHMUse::
	predef GetTileAndCoordsInFrontOfPlayer
; --- Cut on a cuttable tile ---
	ld a, [wCurMapTileset]
	and a ; OVERWORLD == 0
	jr nz, .checkGymCut
	ld a, [wTileInFrontOfPlayer]
	cp $3d ; overworld cut tree
	jp z, UsedCut
	cp $52 ; tall grass (also cuttable)
	jp z, UsedCut
	jr .checkSurf
.checkGymCut
	cp GYM
	jr nz, .checkSurf
	ld a, [wTileInFrontOfPlayer]
	cp $50 ; gym cut tree
	jp z, UsedCut
; --- Surf on water ---
.checkSurf
	ld a, [wWalkBikeSurfState]
	cp 2 ; already surfing
	ret z
	call IsNextTileShoreOrWater
	ret c ; tile in front is not water/shore
	call IsSurfingAllowed
	ld hl, wStatusFlags1
	bit BIT_SURF_ALLOWED, [hl]
	res BIT_SURF_ALLOWED, [hl]
	ret z
	ld a, SURFBOARD
	ld [wCurItem], a
	ld [wPseudoItemID], a
	jp UseItem
