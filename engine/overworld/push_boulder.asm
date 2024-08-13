TryPushingBoulder::
	ld a, [wd728]
	bit 0, a ; using Strength?
	ret z
	ld a, [wFlags_0xcd60]
	bit 1, a ; has boulder dust animation from previous push played yet?
	ret nz
	xor a
	ldh [hSpriteIndexOrTextID], a
	call IsSpriteInFrontOfPlayer
	ldh a, [hSpriteIndexOrTextID]
	and a
	jr z, .loadThenReset
	;;;; PureRGBnote: FIXED: there was a bug where if you're facing a different boulder and walk towards another, 
	;;;; you'll instantly push it.
	;;;; this only really can happen in b3f of seafoam islands but it's really annoying when it does happen.
	ld h, a
	ld a, [wBoulderSpriteIndex]
	cp h ; check if the boulder in front is the same one as before
	ldh a, [hSpriteIndexOrTextID]
	ld [wBoulderSpriteIndex], a
	jr nz, .loadThenReset ; if not, reset the boulder push flags
	;;;;
	ld hl, wSpritePlayerStateData1MovementStatus
	ld d, $0
	ldh a, [hSpriteIndexOrTextID]
	swap a
	ld e, a
	add hl, de
	res 7, [hl]
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp BOULDER_MOVEMENT_BYTE_2
	jp nz, ResetBoulderPushFlags
	ld hl, wFlags_0xcd60
	bit 6, [hl]
	set 6, [hl] ; indicate that the player has tried pushing
	ret z ; the player must try pushing twice before the boulder will move
	ldh a, [hJoyHeld]
	and D_RIGHT | D_LEFT | D_UP | D_DOWN
	ret z
	predef CheckForCollisionWhenPushingBoulder
	ld a, [wTileInFrontOfBoulderAndBoulderCollisionResult]
	and a ; was there a collision?
	jp nz, ResetBoulderPushFlags
	ldh a, [hJoyHeld]
	ld b, a
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr z, .pushBoulderUp
	cp SPRITE_FACING_LEFT
	jr z, .pushBoulderLeft
	cp SPRITE_FACING_RIGHT
	jr z, .pushBoulderRight
.pushBoulderDown
	bit 7, b
	ret z
	ld de, PushBoulderDownMovementData
	jr .done
.pushBoulderUp
	bit 6, b
	ret z
	ld de, PushBoulderUpMovementData
	jr .done
.pushBoulderLeft
	bit 5, b
	ret z
	ld de, PushBoulderLeftMovementData
	jr .done
.pushBoulderRight
	bit 4, b
	ret z
	ld de, PushBoulderRightMovementData
.done
	call MoveSprite
	ld a, SFX_PUSH_BOULDER
	rst _PlaySound
	ld hl, wFlags_0xcd60
	set 1, [hl]
	ret
.loadThenReset
	ld [wBoulderSpriteIndex], a
	jp ResetBoulderPushFlags

PushBoulderUpMovementData:
	db NPC_MOVEMENT_UP
	db -1 ; end

PushBoulderDownMovementData:
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PushBoulderLeftMovementData:
	db NPC_MOVEMENT_LEFT
	db -1 ; end

PushBoulderRightMovementData:
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

DoBoulderDustAnimation::
	ld a, [wd730]
	bit 0, a
	ret nz
	callfar AnimateBoulderDust
	call DiscardButtonPresses
	ld [wJoyIgnore], a
	call ResetBoulderPushFlags
	set 7, [hl] ; [wFlags_0xcd60]
	ld a, [wBoulderSpriteIndex]
	ldh [hSpriteIndex], a
	call GetSpriteMovementByte2Pointer
	ld [hl], $10
	ld a, SFX_CUT
	jp PlaySound

ResetBoulderPushFlags:
	ld hl, wFlags_0xcd60
	res 1, [hl]
	res 6, [hl]
	ret