; only used for setting BIT_STANDING_ON_WARP of wMovementFlags upon entering a new map
IsPlayerStandingOnWarp::
	ld a, [wNumberOfWarps]
	and a
	ret z
	ld c, a
	ld hl, wWarpEntries
.loop
	ld a, [wYCoord]
	cp [hl]
	jr nz, .nextWarp1
	inc hl
	ld a, [wXCoord]
	cp [hl]
	jr nz, .nextWarp2
	inc hl
	ld a, [hli] ; target warp
	ld [wDestinationWarpID], a
	ld a, [hl] ; target map
	ldh [hWarpDestinationMap], a
	ld hl, wMovementFlags
	set BIT_STANDING_ON_WARP, [hl]
	ret
.nextWarp1
	inc hl
.nextWarp2
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

CheckForceBikeOrSurf::
	ld hl, wStatusFlags6
	bit BIT_ALWAYS_ON_BIKE, [hl]
	ret nz
	ld hl, ForcedBikeOrSurfMaps
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld a, [wCurMap]
	ld d, a
.loop
	ld a, [hli]
	cp $ff
	ret z ; if we reach FF then it's not part of the list
	cp d ; compare to current map
	jr nz, .incorrectMap
	ld a, [hli]
	cp b ; compare y-coord
	jr nz, .incorrectY
	ld a, [hli]
	cp c ; compare x-coord
	jr nz, .loop ; incorrect x-coord, check next item
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B3F
	ld a, SCRIPT_SEAFOAMISLANDSB3F_MOVE_OBJECT
	ld [wSeafoamIslandsB3FCurScript], a
	jr z, .forceSurfing
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B4F
	ld a, SCRIPT_SEAFOAMISLANDSB4F_MOVE_OBJECT
	ld [wSeafoamIslandsB4FCurScript], a
	jr z, .forceSurfing
	ld hl, wStatusFlags6
	set BIT_ALWAYS_ON_BIKE, [hl]
	ld a, $1
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp ForceBikeOrSurf
.incorrectMap
	inc hl
.incorrectY
	inc hl
	jr .loop
.forceSurfing
	ld a, $2
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp ForceBikeOrSurf

INCLUDE "data/maps/force_bike_surf.asm"

IsPlayerFacingEdgeOfMap::
	push hl
	push de
	push bc
	ld a, [wSpritePlayerStateData1FacingDirection]
	srl a
	ld c, a
	ld b, $0
	ld hl, .functionPointerTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld de, .return
	push de
	jp hl
.return
	pop bc
	pop de
	pop hl
	ret

.functionPointerTable
	dw .facingDown
	dw .facingUp
	dw .facingLeft
	dw .facingRight

.facingDown
	ld a, [wCurMapHeight]
	add a
	dec a
	cp b
	jr z, .setCarry
	jr .resetCarry

.facingUp
	ld a, b
	and a
	jr z, .setCarry
	jr .resetCarry

.facingLeft
	ld a, c
	and a
	jr z, .setCarry
	jr .resetCarry

.facingRight
	ld a, [wCurMapWidth]
	add a
	dec a
	cp c
	jr z, .setCarry
	jr .resetCarry
.resetCarry
	and a
	ret
.setCarry
	scf
	ret

IsWarpTileInFrontOfPlayer::
	push hl
	push de
	push bc
	call _GetTileAndCoordsInFrontOfPlayer
	ld a, [wCurMap]
	cp SS_ANNE_BOW
	jr z, IsSSAnneBowWarpTileInFrontOfPlayer
	ld a, [wSpritePlayerStateData1FacingDirection]
	srl a
	ld c, a
	ld b, 0
	ld hl, WarpTileListPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wTileInFrontOfPlayer]
	ld de, $1
	call IsInArray
.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/tilesets/warp_carpet_tile_ids.asm"

IsSSAnneBowWarpTileInFrontOfPlayer:
	ld a, [wTileInFrontOfPlayer]
	cp $15
	jr nz, .notSSAnne5Warp
	scf
	jr IsWarpTileInFrontOfPlayer.done
.notSSAnne5Warp
	and a
	jr IsWarpTileInFrontOfPlayer.done

IsPlayerStandingOnDoorTileOrWarpTile::
	push hl
	push de
	push bc
	farcall IsPlayerStandingOnDoorTile
	jr c, .done
	ld a, [wCurMapTileset]
	add a
	ld c, a
	ld b, $0
	ld hl, WarpTileIDPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $1
	lda_coord 8, 9
	call IsInArray
	jr nc, .done
	ld hl, wMovementFlags
	res BIT_STANDING_ON_WARP, [hl]
.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/tilesets/warp_tile_ids.asm"

PrintSafariZoneSteps::
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	ret c
	cp CERULEAN_CAVE_2F
	ret nc
	hlcoord 0, 0
	ld b, 3
	ld c, 7
	call TextBoxBorder
	hlcoord 1, 1
	ld de, wSafariSteps
	lb bc, 2, 3
	call PrintNumber
	hlcoord 4, 1
	ld de, SafariSteps
	call PlaceString
	hlcoord 1, 3
	ld de, SafariBallText
	call PlaceString
	ld a, [wNumSafariBalls]
	cp 10
	jr nc, .tenOrMore
	hlcoord 5, 3
	ld a, ' '
	ld [hl], a
.tenOrMore
	hlcoord 6, 3
	ld de, wNumSafariBalls
	lb bc, 1, 2
	jp PrintNumber

SafariSteps:
	db "/500@"

SafariBallText:
	db "BALL×× @"

GetTileAndCoordsInFrontOfPlayer:
	call GetPredefRegisters

_GetTileAndCoordsInFrontOfPlayer:
	ld a, [wYCoord]
	ld d, a
	ld a, [wXCoord]
	ld e, a
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; cp SPRITE_FACING_DOWN
	jr nz, .notFacingDown
; facing down
	lda_coord 8, 11
	inc d
	jr .storeTile
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	lda_coord 8, 7
	dec d
	jr .storeTile
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	lda_coord 6, 9
	dec e
	jr .storeTile
.notFacingLeft
	cp SPRITE_FACING_RIGHT
	jr nz, .storeTile
; facing right
	lda_coord 10, 9
	inc e
.storeTile
	ld c, a
	ld [wTileInFrontOfPlayer], a
	ret

; hPlayerFacing
	bit_const_def
	const BIT_FACING_DOWN  ; 0
	const BIT_FACING_UP    ; 1
	const BIT_FACING_LEFT  ; 2
	const BIT_FACING_RIGHT ; 3

GetTileTwoStepsInFrontOfPlayer:
	xor a
	ldh [hPlayerFacing], a
	ld hl, wYCoord
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; cp SPRITE_FACING_DOWN
	jr nz, .notFacingDown
; facing down
	ld hl, hPlayerFacing
	set BIT_FACING_DOWN, [hl]
	lda_coord 8, 13
	inc d
	jr .storeTile
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	ld hl, hPlayerFacing
	set BIT_FACING_UP, [hl]
	lda_coord 8, 5
	dec d
	jr .storeTile
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	ld hl, hPlayerFacing
	set BIT_FACING_LEFT, [hl]
	lda_coord 4, 9
	dec e
	jr .storeTile
.notFacingLeft
	cp SPRITE_FACING_RIGHT
	jr nz, .storeTile
; facing right
	ld hl, hPlayerFacing
	set BIT_FACING_RIGHT, [hl]
	lda_coord 12, 9
	inc e
.storeTile
	ld c, a
	ld [wTileInFrontOfBoulderAndBoulderCollisionResult], a
	ld [wTileInFrontOfPlayer], a
	ret

CheckForCollisionWhenPushingBoulder:
	call GetTileTwoStepsInFrontOfPlayer
	ld hl, wTilesetCollisionPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	ld a, [hli]
	cp $ff
	jr z, .done ; if the tile two steps ahead is not passable
	cp c
	jr nz, .loop
	ld hl, TilePairCollisionsLand
	call CheckForTilePairCollisions2
	ld a, $ff
	jr c, .done ; if there is an elevation difference between the current tile and the one two steps ahead
	ld a, [wTileInFrontOfBoulderAndBoulderCollisionResult]
	cp $15 ; stairs tile
	ld a, $ff
	jr z, .done ; if the tile two steps ahead is stairs
	call CheckForBoulderCollisionWithSprites
.done
	ld [wTileInFrontOfBoulderAndBoulderCollisionResult], a
	ret

; sets a to $ff if there is a collision and $00 if there is no collision
CheckForBoulderCollisionWithSprites:
	ld a, [wBoulderSpriteIndex]
	dec a
	swap a
	ld d, 0
	ld e, a
	ld hl, wSprite01StateData2MapY
	add hl, de
	ld a, [hli] ; map Y position
	ldh [hPlayerYCoord], a
	ld a, [hl] ; map X position
	ldh [hPlayerXCoord], a
	ld a, [wNumSprites]
	ld c, a
	ld de, $f
	ld hl, wSprite01StateData2MapY
	ldh a, [hPlayerFacing]
	and (1 << BIT_FACING_UP) | (1 << BIT_FACING_DOWN)
	jr z, .pushingHorizontallyLoop
.pushingVerticallyLoop
	inc hl
	ldh a, [hPlayerXCoord]
	cp [hl]
	jr nz, .nextSprite1 ; if X coordinates don't match
	dec hl
	ld a, [hli]
	ld b, a
	ldh a, [hPlayerFacing]
	ASSERT BIT_FACING_DOWN == 0
	rrca
	jr c, .pushingDown
; pushing up
	ldh a, [hPlayerYCoord]
	dec a
	jr .compareYCoords
.pushingDown
	ldh a, [hPlayerYCoord]
	inc a
.compareYCoords
	cp b
	jr z, .failure
.nextSprite1
	dec c
	jr z, .success
	add hl, de
	jr .pushingVerticallyLoop
.pushingHorizontallyLoop
	ld a, [hli]
	ld b, a
	ldh a, [hPlayerYCoord]
	cp b
	jr nz, .nextSprite2
	ld b, [hl]
	ldh a, [hPlayerFacing]
	bit BIT_FACING_LEFT, a
	jr nz, .pushingLeft
; pushing right
	ldh a, [hPlayerXCoord]
	inc a
	jr .compareXCoords
.pushingLeft
	ldh a, [hPlayerXCoord]
	dec a
.compareXCoords
	cp b
	jr z, .failure
.nextSprite2
	dec c
	jr z, .success
	add hl, de
	jr .pushingHorizontallyLoop
.failure
	ld a, $ff
	ret
.success
	xor a
	ret
