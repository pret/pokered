; only used for setting bit 2 of wd736 upon entering a new map
IsPlayerStandingOnWarp:
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
	ld [hWarpDestinationMap], a
	ld hl, wd736
	set 2, [hl] ; standing on warp flag
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

CheckForceBikeOrSurf:
	ld hl, wd732
	bit 5, [hl]
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
	ret z ;if we reach FF then it's not part of the list
	cp d ;compare to current map
	jr nz, .incorrectMap
	ld a, [hli]
	cp b ;compare y-coord
	jr nz, .incorrectY
	ld a, [hli]
	cp c ;compare x-coord
	jr nz, .loop ; incorrect x-coord, check next item
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B3F
	ld a, $2
	ld [wSeafoamIslandsB3FCurScript], a
	jr z, .forceSurfing
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B4F
	ld a, $2
	ld [wSeafoamIslandsB4FCurScript], a
	jr z, .forceSurfing
	;force bike riding
	ld hl, wd732
	set 5, [hl]
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

INCLUDE "data/force_bike_surf.asm"

IsPlayerFacingEdgeOfMap:
	push hl
	push de
	push bc
	ld a, [wSpriteStateData1 + 9] ; player sprite's facing direction
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
	ld de, .asm_c41e
	push de
	jp hl
.asm_c41e
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

IsWarpTileInFrontOfPlayer:
	push hl
	push de
	push bc
	call _GetTileAndCoordsInFrontOfPlayer
	ld a, [wCurMap]
	cp SS_ANNE_BOW
	jr z, .ssAnne5
	ld a, [wSpriteStateData1 + 9] ; player sprite's facing direction
	srl a
	ld c, a
	ld b, 0
	ld hl, .warpTileListPointers
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

.warpTileListPointers:
	dw .facingDownWarpTiles
	dw .facingUpWarpTiles
	dw .facingLeftWarpTiles
	dw .facingRightWarpTiles

.facingDownWarpTiles
	db $01,$12,$17,$3D,$04,$18,$33,$FF

.facingUpWarpTiles
	db $01,$5C,$FF

.facingLeftWarpTiles
	db $1A,$4B,$FF

.facingRightWarpTiles
	db $0F,$4E,$FF

.ssAnne5
	ld a, [wTileInFrontOfPlayer]
	cp $15
	jr nz, .notSSAnne5Warp
	scf
	jr .done
.notSSAnne5Warp
	and a
	jr .done

IsPlayerStandingOnDoorTileOrWarpTile:
	push hl
	push de
	push bc
	callba IsPlayerStandingOnDoorTile
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
	aCoord 8, 9
	call IsInArray
	jr nc, .done
	ld hl, wd736
	res 2, [hl]
.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/warp_tile_ids.asm"

PrintSafariZoneSteps:
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	ret c
	cp CERULEAN_CAVE_2F
	ret nc
	coord hl, 0, 0
	ld b, 3
	ld c, 7
	call TextBoxBorder
	coord hl, 1, 1
	ld de, wSafariSteps
	lb bc, 2, 3
	call PrintNumber
	coord hl, 4, 1
	ld de, SafariSteps
	call PlaceString
	coord hl, 1, 3
	ld de, SafariBallText
	call PlaceString
	ld a, [wNumSafariBalls]
	cp 10
	jr nc, .asm_c56d
	coord hl, 5, 3
	ld a, " "
	ld [hl], a
.asm_c56d
	coord hl, 6, 3
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
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	and a ; cp SPRITE_FACING_DOWN
	jr nz, .notFacingDown
; facing down
	aCoord 8, 11
	inc d
	jr .storeTile
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	aCoord 8, 7
	dec d
	jr .storeTile
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	aCoord 6, 9
	dec e
	jr .storeTile
.notFacingLeft
	cp SPRITE_FACING_RIGHT
	jr nz, .storeTile
; facing right
	aCoord 10, 9
	inc e
.storeTile
	ld c, a
	ld [wTileInFrontOfPlayer], a
	ret

GetTileTwoStepsInFrontOfPlayer:
	xor a
	ld [$ffdb], a
	ld hl, wYCoord
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	and a ; cp SPRITE_FACING_DOWN
	jr nz, .notFacingDown
; facing down
	ld hl, $ffdb
	set 0, [hl]
	aCoord 8, 13
	inc d
	jr .storeTile
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	ld hl, $ffdb
	set 1, [hl]
	aCoord 8, 5
	dec d
	jr .storeTile
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	ld hl, $ffdb
	set 2, [hl]
	aCoord 4, 9
	dec e
	jr .storeTile
.notFacingLeft
	cp SPRITE_FACING_RIGHT
	jr nz, .storeTile
; facing right
	ld hl, $ffdb
	set 3, [hl]
	aCoord 12, 9
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
	ld hl, wSpriteStateData2 + $14
	add hl, de
	ld a, [hli] ; map Y position
	ld [$ffdc], a
	ld a, [hl] ; map X position
	ld [$ffdd], a
	ld a, [wNumSprites]
	ld c, a
	ld de, $f
	ld hl, wSpriteStateData2 + $14
	ld a, [$ffdb]
	and $3 ; facing up or down?
	jr z, .pushingHorizontallyLoop
.pushingVerticallyLoop
	inc hl
	ld a, [$ffdd]
	cp [hl]
	jr nz, .nextSprite1 ; if X coordinates don't match
	dec hl
	ld a, [hli]
	ld b, a
	ld a, [$ffdb]
	rrca
	jr c, .pushingDown
; pushing up
	ld a, [$ffdc]
	dec a
	jr .compareYCoords
.pushingDown
	ld a, [$ffdc]
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
	ld a, [$ffdc]
	cp b
	jr nz, .nextSprite2
	ld b, [hl]
	ld a, [$ffdb]
	bit 2, a
	jr nz, .pushingLeft
; pushing right
	ld a, [$ffdd]
	inc a
	jr .compareXCoords
.pushingLeft
	ld a, [$ffdd]
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
