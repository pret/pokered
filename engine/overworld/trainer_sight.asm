_GetSpritePosition1::
	ld hl, wSpriteStateData1
	ld de, SPRITESTATEDATA1_YPIXELS
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	call GetSpriteDataPointer
	ld a, [hli] ; x#SPRITESTATEDATA1_YPIXELS
	ldh [hSpriteScreenYCoord], a
	inc hl
	ld a, [hl] ; x#SPRITESTATEDATA1_XPIXELS
	ldh [hSpriteScreenXCoord], a
	ld de, wSpritePlayerStateData2MapY - wSpritePlayerStateData1XPixels
	add hl, de
	ld a, [hli] ; x#SPRITESTATEDATA2_MAPY
	ldh [hSpriteMapYCoord], a
	ld a, [hl] ; x#SPRITESTATEDATA2_MAPX
	ldh [hSpriteMapXCoord], a
	ret

_GetSpritePosition2::
	ld hl, wSpriteStateData1
	ld de, SPRITESTATEDATA1_YPIXELS
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	call GetSpriteDataPointer
	ld a, [hli] ; x#SPRITESTATEDATA1_YPIXELS
	ld [wSavedSpriteScreenY], a
	inc hl
	ld a, [hl] ; x#SPRITESTATEDATA1_XPIXELS
	ld [wSavedSpriteScreenX], a
	ld de, wSpritePlayerStateData2MapY - wSpritePlayerStateData1XPixels
	add hl, de
	ld a, [hli] ; x#SPRITESTATEDATA2_MAPY
	ld [wSavedSpriteMapY], a
	ld a, [hl] ; x#SPRITESTATEDATA2_MAPX
	ld [wSavedSpriteMapX], a
	ret

_SetSpritePosition1::
	ld hl, wSpriteStateData1
	ld de, SPRITESTATEDATA1_YPIXELS
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	call GetSpriteDataPointer
	ldh a, [hSpriteScreenYCoord] ; x#SPRITESTATEDATA1_YPIXELS
	ld [hli], a
	inc hl
	ldh a, [hSpriteScreenXCoord] ; x#SPRITESTATEDATA1_XPIXELS
	ld [hl], a
	ld de, wSpritePlayerStateData2MapY - wSpritePlayerStateData1XPixels
	add hl, de
	ldh a, [hSpriteMapYCoord] ; x#SPRITESTATEDATA2_MAPY
	ld [hli], a
	ldh a, [hSpriteMapXCoord] ; x#SPRITESTATEDATA2_MAPX
	ld [hl], a
	ret

_SetSpritePosition2::
	ld hl, wSpriteStateData1
	ld de, SPRITESTATEDATA1_YPIXELS
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	call GetSpriteDataPointer
	ld a, [wSavedSpriteScreenY]
	ld [hli], a ; x#SPRITESTATEDATA1_YPIXELS
	inc hl
	ld a, [wSavedSpriteScreenX]
	ld [hl], a ; x#SPRITESTATEDATA1_XPIXELS
	ld de, wSpritePlayerStateData2MapY - wSpritePlayerStateData1XPixels
	add hl, de
	ld a, [wSavedSpriteMapY]
	ld [hli], a ; x#SPRITESTATEDATA2_MAPY
	ld a, [wSavedSpriteMapX]
	ld [hl], a ; x#SPRITESTATEDATA2_MAPX
	ret

TrainerWalkUpToPlayer::
	ld a, [wSpriteIndex]
	swap a
	ld [wTrainerSpriteOffset], a
	call ReadTrainerScreenPosition
	ld a, [wTrainerFacingDirection]
	and a ; SPRITE_FACING_DOWN
	jr z, .facingDown
	cp SPRITE_FACING_UP
	jr z, .facingUp
	cp SPRITE_FACING_LEFT
	jr z, .facingLeft
	jr .facingRight
.facingDown
	ld a, [wTrainerScreenY]
	ld b, a
	ld a, $3c           ; (fixed) player screen Y pos
	call CalcDifference
	cp $10              ; trainer is right above player
	ret z
	swap a
	dec a
	ld c, a             ; bc = steps yet to go to reach player
	xor a
	ld b, a           ; a = direction to go to
	jr .writeWalkScript
.facingUp
	ld a, [wTrainerScreenY]
	ld b, a
	ld a, $3c           ; (fixed) player screen Y pos
	call CalcDifference
	cp $10              ; trainer is right below player
	ret z
	swap a
	dec a
	ld c, a             ; bc = steps yet to go to reach player
	ld b, $0
	ld a, $40           ; a = direction to go to
	jr .writeWalkScript
.facingRight
	ld a, [wTrainerScreenX]
	ld b, a
	ld a, $40           ; (fixed) player screen X pos
	call CalcDifference
	cp $10              ; trainer is directly left of player
	ret z
	swap a
	dec a
	ld c, a             ; bc = steps yet to go to reach player
	ld b, $0
	ld a, $c0           ; a = direction to go to
	jr .writeWalkScript
.facingLeft
	ld a, [wTrainerScreenX]
	ld b, a
	ld a, $40           ; (fixed) player screen X pos
	call CalcDifference
	cp $10              ; trainer is directly right of player
	ret z
	swap a
	dec a
	ld c, a             ; bc = steps yet to go to reach player
	ld b, $0
	ld a, $80           ; a = direction to go to
.writeWalkScript
	ld hl, wNPCMovementDirections2
	ld de, wNPCMovementDirections2
	call FillMemory     ; write the necessary steps to reach player
	ld [hl], $ff        ; write end of list sentinel
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	jp MoveSprite_

; input: de = offset within sprite entry
; output: hl = pointer to sprite data
GetSpriteDataPointer:
	push de
	add hl, de
	ldh a, [hSpriteIndex]
	swap a
	ld d, $0
	ld e, a
	add hl, de
	pop de
	ret

; tests if this trainer is in the right position to engage the player and do so if she is.
TrainerEngage:
	push hl
	push de
	ld a, [wTrainerSpriteOffset]
	add SPRITESTATEDATA1_IMAGEINDEX
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]             ; x#SPRITESTATEDATA1_IMAGEINDEX
	sub $ff
	jr nz, .spriteOnScreen ; test if sprite is on screen
	jp .noEngage
.spriteOnScreen
	ld a, [wTrainerSpriteOffset]
	add SPRITESTATEDATA1_FACINGDIRECTION
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]             ; x#SPRITESTATEDATA1_FACINGDIRECTION
	ld [wTrainerFacingDirection], a
	call ReadTrainerScreenPosition
	ld a, [wTrainerScreenY]          ; sprite screen Y pos
	ld b, a
	ld a, $3c
	cp b
	jr z, .linedUpY
	ld a, [wTrainerScreenX]          ; sprite screen X pos
	ld b, a
	ld a, $40
	cp b
	jr z, .linedUpX
	xor a
	jp .noEngage
.linedUpY
	ld a, [wTrainerScreenX]        ; sprite screen X pos
	ld b, a
	ld a, $40            ; (fixed) player X position
	call CalcDifference  ; calc distance
	jr z, .noEngage      ; exact same position as player
	call CheckSpriteCanSeePlayer
	jr c, .engage
	xor a
	jr .noEngage
.linedUpX
	ld a, [wTrainerScreenY]        ; sprite screen Y pos
	ld b, a
	ld a, $3c            ; (fixed) player Y position
	call CalcDifference  ; calc distance
	jr z, .noEngage      ; exact same position as player
	call CheckSpriteCanSeePlayer
	jr c, .engage
	xor a
	jp .noEngage
.engage
	call CheckPlayerIsInFrontOfSprite
	ld a, [wTrainerSpriteOffset]
	and a
	jr z, .noEngage
	ld hl, wFlags_0xcd60
	set 0, [hl]
	call EngageMapTrainer
	ld a, $ff
.noEngage
	ld [wTrainerSpriteOffset], a
	pop de
	pop hl
	ret

; reads trainer's Y position to wTrainerScreenY and X position to wTrainerScreenX
ReadTrainerScreenPosition:
	ld a, [wTrainerSpriteOffset]
	add SPRITESTATEDATA1_YPIXELS
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl] ; x#SPRITESTATEDATA1_YPIXELS
	ld [wTrainerScreenY], a
	ld a, [wTrainerSpriteOffset]
	add SPRITESTATEDATA1_XPIXELS
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl] ; x#SPRITESTATEDATA1_XPIXELS
	ld [wTrainerScreenX], a
	ret

; checks if the sprite is properly lined up with the player with respect to the direction it's looking. Also checks the distance between player and sprite
; note that this does not necessarily mean the sprite is seeing the player, he could be behind it's back
; a: distance player to sprite
CheckSpriteCanSeePlayer:
	ld b, a
	ld a, [wTrainerEngageDistance] ; how far the trainer can see
	cp b
	jr nc, .checkIfLinedUp
	jr .notInLine         ; player too far away
.checkIfLinedUp
	ld a, [wTrainerFacingDirection]         ; sprite facing direction
	cp SPRITE_FACING_DOWN
	jr z, .checkXCoord
	cp SPRITE_FACING_UP
	jr z, .checkXCoord
	cp SPRITE_FACING_LEFT
	jr z, .checkYCoord
	cp SPRITE_FACING_RIGHT
	jr z, .checkYCoord
	jr .notInLine
.checkXCoord
	ld a, [wTrainerScreenX]         ; sprite screen X position
	ld b, a
	cp $40
	jr z, .inLine
	jr .notInLine
.checkYCoord
	ld a, [wTrainerScreenY]         ; sprite screen Y position
	ld b, a
	cp $3c
	jr nz, .notInLine
.inLine
	scf
	ret
.notInLine
	and a
	ret

; tests if the player is in front of the sprite (rather than behind it)
CheckPlayerIsInFrontOfSprite:
	ld a, [wCurMap]
	cp POWER_PLANT
	jp z, .engage       ; bypass this for power plant to get voltorb fake items to work
	ld a, [wTrainerSpriteOffset]
	add SPRITESTATEDATA1_YPIXELS
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]          ; x#SPRITESTATEDATA1_YPIXELS
	cp $fc
	jr nz, .notOnTopmostTile ; special case if sprite is on topmost tile (Y = $fc (-4)), make it come down a block
	ld a, $c
.notOnTopmostTile
	ld [wTrainerScreenY], a
	ld a, [wTrainerSpriteOffset]
	add SPRITESTATEDATA1_XPIXELS
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]          ; x#SPRITESTATEDATA1_XPIXELS
	ld [wTrainerScreenX], a
	ld a, [wTrainerFacingDirection]       ; facing direction
	cp SPRITE_FACING_DOWN
	jr nz, .notFacingDown
	ld a, [wTrainerScreenY]       ; sprite screen Y pos
	cp $3c
	jr c, .engage       ; sprite above player
	jr .noEngage        ; sprite below player
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
	ld a, [wTrainerScreenY]       ; sprite screen Y pos
	cp $3c
	jr nc, .engage      ; sprite below player
	jr .noEngage        ; sprite above player
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
	ld a, [wTrainerScreenX]       ; sprite screen X pos
	cp $40
	jr nc, .engage      ; sprite right of player
	jr .noEngage        ; sprite left of player
.notFacingLeft
	ld a, [wTrainerScreenX]       ; sprite screen X pos
	cp $40
	jr nc, .noEngage    ; sprite right of player
.engage
	ld a, $ff
	jr .done
.noEngage
	xor a
.done
	ld [wTrainerSpriteOffset], a
	ret
