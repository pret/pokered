TryPushingBoulder:
	ld a, [wd728]
	bit 0, a ; using Strength?
	ret z
	ld a, [wFlags_0xcd60]
	bit 1, a ; has boulder dust animation from previous push played yet?
	ret nz
	xor a
	ld [hSpriteIndexOrTextID], a
	call IsSpriteInFrontOfPlayer
	ld a, [hSpriteIndexOrTextID]
	ld [wBoulderSpriteIndex], a
	and a
	jp z, ResetBoulderPushFlags
	ld hl, wSpriteStateData1 + 1
	ld d, $0
	ld a, [hSpriteIndexOrTextID]
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
	ld a, [hJoyHeld]
	and D_RIGHT | D_LEFT | D_UP | D_DOWN
	ret z
	predef CheckForCollisionWhenPushingBoulder
	ld a, [wTileInFrontOfBoulderAndBoulderCollisionResult]
	and a ; was there a collision?
	jp nz, ResetBoulderPushFlags
	ld a, [hJoyHeld]
	ld b, a
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
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
	call PlaySound
	ld hl, wFlags_0xcd60
	set 1, [hl]
	ret

PushBoulderUpMovementData:
	db NPC_MOVEMENT_UP,$FF

PushBoulderDownMovementData:
	db NPC_MOVEMENT_DOWN,$FF

PushBoulderLeftMovementData:
	db NPC_MOVEMENT_LEFT,$FF

PushBoulderRightMovementData:
	db NPC_MOVEMENT_RIGHT,$FF

DoBoulderDustAnimation:
	ld a, [wd730]
	bit 0, a
	ret nz
	callab AnimateBoulderDust
	call DiscardButtonPresses
	ld [wJoyIgnore], a
	call ResetBoulderPushFlags
	set 7, [hl]
	ld a, [wBoulderSpriteIndex]
	ld [H_SPRITEINDEX], a
	call GetSpriteMovementByte2Pointer
	ld [hl], $10
	ld a, SFX_CUT
	jp PlaySound

ResetBoulderPushFlags:
	ld hl, wFlags_0xcd60
	res 1, [hl]
	res 6, [hl]
	ret
