DEF MAP_TILESET_SIZE EQU $60

UpdatePlayerSprite:
	ld a, [wSpritePlayerStateData2WalkAnimationCounter]
	and a
	jr z, .checkIfTextBoxInFrontOfSprite
	cp $ff
	jr z, .disableSprite
	dec a
	ld [wSpritePlayerStateData2WalkAnimationCounter], a
	jr .disableSprite
; check if a text box is in front of the sprite by checking if the lower left
; background tile the sprite is standing on is greater than $5F, which is
; the maximum number for map tiles
.checkIfTextBoxInFrontOfSprite
	lda_coord 8, 9
	ldh [hTilePlayerStandingOn], a
	cp MAP_TILESET_SIZE
	jr c, .lowerLeftTileIsMapTile
.disableSprite
	ld a, $ff
	ld [wSpritePlayerStateData1ImageIndex], a
	ret
.lowerLeftTileIsMapTile
	call DetectCollisionBetweenSprites
	ld h, HIGH(wSpriteStateData1)
	ld a, [wWalkCounter]
	and a
	jr nz, .moving
	ld a, [wPlayerMovingDirection]
; check if down
	bit PLAYER_DIR_BIT_DOWN, a
	jr z, .checkIfUp
	xor a ; ld a, SPRITE_FACING_DOWN
	jr .next
.checkIfUp
	bit PLAYER_DIR_BIT_UP, a
	jr z, .checkIfLeft
	ld a, SPRITE_FACING_UP
	jr .next
.checkIfLeft
	bit PLAYER_DIR_BIT_LEFT, a
	jr z, .checkIfRight
	ld a, SPRITE_FACING_LEFT
	jr .next
.checkIfRight
	bit PLAYER_DIR_BIT_RIGHT, a
	jr z, .notMoving
	ld a, SPRITE_FACING_RIGHT
	jr .next
.notMoving
; zero the animation counters
	xor a
	ld [wSpritePlayerStateData1IntraAnimFrameCounter], a
	ld [wSpritePlayerStateData1AnimFrameCounter], a
	jr .calcImageIndex
.next
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, [wFontLoaded]
	bit BIT_FONT_LOADED, a
	jr nz, .notMoving
.moving
	ld a, [wMovementFlags]
	bit BIT_SPINNING, a
	jr nz, .skipSpriteAnim
	ldh a, [hCurrentSpriteOffset]
	add $7
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp 4
	jr nz, .calcImageIndex
	xor a
	ld [hl], a
	inc hl
	ld a, [hl]
	inc a
	and $3
	ld [hl], a
.calcImageIndex
	ld a, [wSpritePlayerStateData1AnimFrameCounter]
	ld b, a
	ld a, [wSpritePlayerStateData1FacingDirection]
	add b
	ld [wSpritePlayerStateData1ImageIndex], a
.skipSpriteAnim
; If the player is standing on a grass tile, make the player's sprite have
; lower priority than the background so that it's partially obscured by the
; grass. Only the lower half of the sprite is permitted to have the priority
; bit set by later logic.
	ldh a, [hTilePlayerStandingOn]
	ld c, a
	ld a, [wGrassTile]
	cp c
	ld a, 0
	jr nz, .next2
	ld a, OAM_PRIO
.next2
	ld [wSpritePlayerStateData2GrassPriority], a
	ret

UnusedReadSpriteDataFunction:
	push bc
	push af
	ldh a, [hCurrentSpriteOffset]
	ld c, a
	pop af
	add c
	ld l, a
	pop bc
	ret

UpdateNPCSprite:
	ldh a, [hCurrentSpriteOffset]
	swap a
	dec a
	add a
	ld hl, wMapSpriteData
	add l
	ld l, a
	ld a, [hl]        ; read movement byte 2
	ld [wCurSpriteMovement2], a
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	ld l, a
	inc l
	ld a, [hl]        ; x#SPRITESTATEDATA1_MOVEMENTSTATUS
	and a
	jp z, InitializeSpriteStatus
	call CheckSpriteAvailability
	ret c             ; don't do anything if sprite is invisible
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	ld l, a
	inc l
	ld a, [hl]        ; x#SPRITESTATEDATA1_MOVEMENTSTATUS
	bit BIT_FACE_PLAYER, a
	jp nz, MakeNPCFacePlayer
	ld b, a
	ld a, [wFontLoaded]
	bit BIT_FONT_LOADED, a
	jp nz, notYetMoving
	ld a, b
	cp $2
	jp z, UpdateSpriteMovementDelay  ; [x#SPRITESTATEDATA1_MOVEMENTSTATUS] == 2
	cp $3
	jp z, UpdateSpriteInWalkingAnimation  ; [x#SPRITESTATEDATA1_MOVEMENTSTATUS] == 3
	ld a, [wWalkCounter]
	and a
	ret nz           ; don't do anything yet if player is currently moving
	call InitializeSpriteScreenPosition
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add $6
	ld l, a
	ld a, [hl]       ; x#SPRITESTATEDATA2_MOVEMENTBYTE1
	inc a
	jr z, .randomMovement  ; value STAY
	inc a
	jr z, .randomMovement  ; value WALK
; scripted movement
	dec a
	ld [hl], a       ; increment movement byte 1 (movement data index)
	dec a
	push hl
	ld hl, wNPCNumScriptedSteps
	dec [hl]         ; decrement wNPCNumScriptedSteps
	pop hl
	ld de, wNPCMovementDirections
	call LoadDEPlusA ; a = [wNPCMovementDirections + movement byte 1]
	cp NPC_CHANGE_FACING
	jp z, ChangeFacingDirection
	cp STAY
	jr nz, .next
; reached end of wNPCMovementDirections list
	ld [hl], a ; store $ff in movement byte 1, disabling scripted movement
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_NPC_MOVEMENT, [hl]
	xor a
	ld [wSimulatedJoypadStatesIndex], a
	ld [wUnusedOverrideSimulatedJoypadStatesIndex], a
	ret
.next
	cp WALK
	jr nz, .determineDirection
; current NPC movement data is WALK ($fe). this seems buggy
	ld [hl], $1     ; set movement byte 1 to $1
	ld de, wNPCMovementDirections
	call LoadDEPlusA ; a = [wNPCMovementDirections + $fe] (?)
	jr .determineDirection
.randomMovement
	call GetTileSpriteStandsOn
	call Random
.determineDirection
	ld b, a
	ld a, [wCurSpriteMovement2]
	cp DOWN
	jr z, .moveDown
	cp UP
	jr z, .moveUp
	cp LEFT
	jr z, .moveLeft
	cp RIGHT
	jr z, .moveRight
	ld a, b
	cp NPC_MOVEMENT_UP ; NPC_MOVEMENT_DOWN <= a < NPC_MOVEMENT_UP: down (or left)
	jr nc, .notDown
	ld a, [wCurSpriteMovement2]
	cp LEFT_RIGHT
	jr z, .moveLeft
.moveDown
	ld de, 2*SCREEN_WIDTH
	add hl, de         ; move tile pointer two rows down
	lb de, 1, 0
	lb bc, 4, SPRITE_FACING_DOWN
	jr TryWalking
.notDown
	cp NPC_MOVEMENT_LEFT ; NPC_MOVEMENT_UP <= a < NPC_MOVEMENT_LEFT: up (or right)
	jr nc, .notUp
	ld a, [wCurSpriteMovement2]
	cp LEFT_RIGHT
	jr z, .moveRight
.moveUp
	ld de, -2*SCREEN_WIDTH
	add hl, de         ; move tile pointer two rows up
	lb de, -1, 0
	lb bc, 8, SPRITE_FACING_UP
	jr TryWalking
.notUp
	cp NPC_MOVEMENT_RIGHT ; NPC_MOVEMENT_LEFT <= a < NPC_MOVEMENT_RIGHT: left (or up)
	jr nc, .notLeft
	ld a, [wCurSpriteMovement2]
	cp UP_DOWN
	jr z, .moveUp
.moveLeft
	dec hl
	dec hl             ; move tile pointer two columns left
	lb de, 0, -1
	lb bc, 2, SPRITE_FACING_LEFT
	jr TryWalking
.notLeft               ; NPC_MOVEMENT_RIGHT <= a: right (or down)
	ld a, [wCurSpriteMovement2]
	cp UP_DOWN
	jr z, .moveDown
.moveRight
	inc hl
	inc hl             ; move tile pointer two columns right
	lb de, 0, 1
	lb bc, 1, SPRITE_FACING_RIGHT
	jr TryWalking

; changes facing direction by zeroing the movement delta and calling TryWalking
ChangeFacingDirection:
	ld de, $0
	; fall through

; b: direction (1,2,4 or 8)
; c: new facing direction (0,4,8 or $c)
; d: Y movement delta (-1, 0 or 1)
; e: X movement delta (-1, 0 or 1)
; hl: pointer to tile the sprite would walk onto
; set carry on failure, clears carry on success
TryWalking:
	push hl
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add $9
	ld l, a
	ld [hl], c          ; x#SPRITESTATEDATA1_FACINGDIRECTION
	ldh a, [hCurrentSpriteOffset]
	add $3
	ld l, a
	ld [hl], d          ; x#SPRITESTATEDATA1_YSTEPVECTOR
	inc l
	inc l
	ld [hl], e          ; x#SPRITESTATEDATA1_XSTEPVECTOR
	pop hl
	push de
	ld c, [hl]          ; read tile to walk onto
	call CanWalkOntoTile
	pop de
	ret c               ; cannot walk there (reinitialization of delay values already done)
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add $4
	ld l, a
	ld a, [hl]          ; x#SPRITESTATEDATA2_MAPY
	add d
	ld [hli], a         ; update Y position
	ld a, [hl]          ; x#SPRITESTATEDATA2_MAPX
	add e
	ld [hl], a          ; update X position
	ldh a, [hCurrentSpriteOffset]
	ld l, a
	ld [hl], $10        ; [x#SPRITESTATEDATA2_WALKANIMATIONCOUNTER] = 16
	dec h
	inc l
	ld [hl], $3         ; x#SPRITESTATEDATA1_MOVEMENTSTATUS
	jp UpdateSpriteImage

; update the walking animation parameters for a sprite that is currently walking
UpdateSpriteInWalkingAnimation:
	ldh a, [hCurrentSpriteOffset]
	add $7
	ld l, a
	ld a, [hl]                       ; x#SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER
	inc a
	ld [hl], a                       ; [x#SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER]++
	cp $4
	jr nz, .noNextAnimationFrame
	xor a
	ld [hl], a                       ; [x#SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER] = 0
	inc l
	ld a, [hl]                       ; x#SPRITESTATEDATA1_ANIMFRAMECOUNTER
	inc a
	and $3
	ld [hl], a                       ; advance to next animation frame every 4 ticks (16 ticks total for one step)
.noNextAnimationFrame
	ldh a, [hCurrentSpriteOffset]
	add $3
	ld l, a
	ld a, [hli]                      ; x#SPRITESTATEDATA1_YSTEPVECTOR
	ld b, a
	ld a, [hl]                       ; x#SPRITESTATEDATA1_YPIXELS
	add b
	ld [hli], a                      ; update [x#SPRITESTATEDATA1_YPIXELS]
	ld a, [hli]                      ; x#SPRITESTATEDATA1_XSTEPVECTOR
	ld b, a
	ld a, [hl]                       ; x#SPRITESTATEDATA1_XPIXELS
	add b
	ld [hl], a                       ; update [x#SPRITESTATEDATA1_XPIXELS]
	ldh a, [hCurrentSpriteOffset]
	ld l, a
	inc h
	ld a, [hl]                       ; x#SPRITESTATEDATA2_WALKANIMATIONCOUNTER
	dec a
	ld [hl], a                       ; update walk animation counter
	ret nz
	ld a, $6                         ; walking finished, update state
	add l
	ld l, a
	ld a, [hl]                       ; x#SPRITESTATEDATA2_MOVEMENTBYTE1
	cp WALK
	jr nc, .initNextMovementCounter  ; values WALK or STAY
	ldh a, [hCurrentSpriteOffset]
	inc a
	ld l, a
	dec h
	ld [hl], $1                      ; [x#SPRITESTATEDATA1_MOVEMENTSTATUS] = 1 (movement status ready)
	ret
.initNextMovementCounter
	call Random
	ldh a, [hCurrentSpriteOffset]
	add $8
	ld l, a
	ldh a, [hRandomAdd]
	and $7f
	ld [hl], a                       ; x#SPRITESTATEDATA2_MOVEMENTDELAY:
	                                 ; set next movement delay to a random value in [0,$7f]
	                                 ; note that value 0 actually makes the delay $100 (bug?)
	dec h ; HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	inc a
	ld l, a
	ld [hl], $2                      ; [x#SPRITESTATEDATA1_MOVEMENTSTATUS] = 2 (movement status)
	inc l
	inc l
	xor a
	ld b, [hl]                       ; x#SPRITESTATEDATA1_YSTEPVECTOR
	ld [hli], a                      ; [x#SPRITESTATEDATA1_YSTEPVECTOR] = 0
	inc l
	ld c, [hl]                       ; x#SPRITESTATEDATA1_XSTEPVECTOR
	ld [hl], a                       ; [x#SPRITESTATEDATA1_XSTEPVECTOR] = 0
	ret

; update [x#SPRITESTATEDATA2_MOVEMENTDELAY] for sprites in the delayed state (x#SPRITESTATEDATA1_MOVEMENTSTATUS)
UpdateSpriteMovementDelay:
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add $6
	ld l, a
	ld a, [hl]              ; x#SPRITESTATEDATA2_MOVEMENTBYTE1
	inc l
	inc l
	cp WALK
	jr nc, .tickMoveCounter ; values WALK or STAY
	ld [hl], $0
	jr .moving
.tickMoveCounter
	dec [hl]                ; x#SPRITESTATEDATA2_MOVEMENTDELAY
	jr nz, notYetMoving
.moving
	dec h
	ldh a, [hCurrentSpriteOffset]
	inc a
	ld l, a
	ld [hl], $1             ; [x#SPRITESTATEDATA1_MOVEMENTSTATUS] = 1 (mark as ready to move)
notYetMoving:
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA1_ANIMFRAMECOUNTER
	ld l, a
	ld [hl], $0             ; [x#SPRITESTATEDATA1_ANIMFRAMECOUNTER] = 0 (walk animation frame)
	jp UpdateSpriteImage

MakeNPCFacePlayer:
; Make an NPC face the player if the player has spoken to him or her.

; Check if the behaviour of the NPC facing the player when spoken to is
; disabled. This is only done when rubbing the S.S. Anne captain's back.
	ld a, [wStatusFlags3]
	bit BIT_NO_NPC_FACE_PLAYER, a
	jr nz, notYetMoving
	res BIT_FACE_PLAYER, [hl]
	ld a, [wPlayerDirection]
	bit PLAYER_DIR_BIT_UP, a
	jr z, .notFacingDown
	ld c, SPRITE_FACING_DOWN
	jr .facingDirectionDetermined
.notFacingDown
	bit PLAYER_DIR_BIT_DOWN, a
	jr z, .notFacingUp
	ld c, SPRITE_FACING_UP
	jr .facingDirectionDetermined
.notFacingUp
	bit PLAYER_DIR_BIT_LEFT, a
	jr z, .notFacingRight
	ld c, SPRITE_FACING_RIGHT
	jr .facingDirectionDetermined
.notFacingRight
	ld c, SPRITE_FACING_LEFT
.facingDirectionDetermined
	ldh a, [hCurrentSpriteOffset]
	add $9
	ld l, a
	ld [hl], c              ; [x#SPRITESTATEDATA1_FACINGDIRECTION]: set facing direction
	jr notYetMoving

InitializeSpriteStatus:
	ld [hl], $1   ; [x#SPRITESTATEDATA1_MOVEMENTSTATUS] = ready
	inc l
	ld [hl], $ff  ; [x#SPRITESTATEDATA1_IMAGEINDEX] = invisible/off screen
	inc h ; HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add $2
	ld l, a
	ld a, $8
	ld [hli], a   ; [x#SPRITESTATEDATA2_YDISPLACEMENT] = 8
	ld [hl], a    ; [x#SPRITESTATEDATA2_XDISPLACEMENT] = 8
	ret

; calculates the sprite's screen position from its map position and the player position
InitializeSpriteScreenPosition:
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA2_MAPY
	ld l, a
	ld a, [wYCoord]
	ld b, a
	ld a, [hl]      ; x#SPRITESTATEDATA2_MAPY
	sub b           ; relative to player position
	swap a          ; * 16
	sub $4          ; - 4
	dec h
	ld [hli], a     ; [x#SPRITESTATEDATA1_YPIXELS]
	inc h
	ld a, [wXCoord]
	ld b, a
	ld a, [hli]     ; x#SPRITESTATEDATA2_MAPX
	sub b           ; relative to player position
	swap a          ; * 16
	dec h
	ld [hl], a      ; [x#SPRITESTATEDATA1_XPIXELS]
	ret

; tests if sprite is off screen or otherwise unable to do anything
CheckSpriteAvailability:
	predef IsObjectHidden
	ldh a, [hIsHiddenMissableObject]
	and a
	jp nz, .spriteInvisible
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA2_MOVEMENTBYTE1
	ld l, a
	ld a, [hl]      ; x#SPRITESTATEDATA2_MOVEMENTBYTE1
	cp WALK
	jr c, .skipXVisibilityTest ; movement byte 1 < WALK (i.e. the sprite's movement is scripted)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA2_MAPY
	ld l, a
	ld b, [hl]      ; x#SPRITESTATEDATA2_MAPY
	ld a, [wYCoord]
	cp b
	jr z, .skipYVisibilityTest
	jr nc, .spriteInvisible ; above screen region
	add SCREEN_HEIGHT / 2 - 1
	cp b
	jr c, .spriteInvisible  ; below screen region
.skipYVisibilityTest
	inc l
	ld b, [hl]      ; x#SPRITESTATEDATA2_MAPX
	ld a, [wXCoord]
	cp b
	jr z, .skipXVisibilityTest
	jr nc, .spriteInvisible ; left of screen region
	add SCREEN_WIDTH / 2 - 1
	cp b
	jr c, .spriteInvisible  ; right of screen region
.skipXVisibilityTest
; make the sprite invisible if a text box is in front of it
; $5F is the maximum number for map tiles
	call GetTileSpriteStandsOn
	ld d, MAP_TILESET_SIZE
	ld a, [hli]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=MAP_TILESET_SIZE (bottom left tile)
	ld a, [hld]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=MAP_TILESET_SIZE (bottom right tile)
	ld bc, -SCREEN_WIDTH
	add hl, bc              ; go back one row of tiles
	ld a, [hli]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=MAP_TILESET_SIZE (top left tile)
	ld a, [hl]
	cp d
	jr c, .spriteVisible    ; standing on tile with ID >=MAP_TILESET_SIZE (top right tile)
.spriteInvisible
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA1_IMAGEINDEX
	ld l, a
	ld [hl], $ff       ; x#SPRITESTATEDATA1_IMAGEINDEX
	scf
	jr .done
.spriteVisible
	ld c, a
	ld a, [wWalkCounter]
	and a
	jr nz, .done           ; if player is currently walking, we're done
	call UpdateSpriteImage
	inc h
	ldh a, [hCurrentSpriteOffset]
	add $7
	ld l, a
	ld a, [wGrassTile]
	cp c
	ld a, 0
	jr nz, .notInGrass
	ld a, OAM_PRIO
.notInGrass
	ld [hl], a       ; x#SPRITESTATEDATA2_GRASSPRIORITY
	and a
.done
	ret

UpdateSpriteImage:
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add $8
	ld l, a
	ld a, [hli]        ; x#SPRITESTATEDATA1_ANIMFRAMECOUNTER
	ld b, a
	ld a, [hl]         ; x#SPRITESTATEDATA1_FACINGDIRECTION
	add b
	ld b, a
	ldh a, [hTilePlayerStandingOn]
	add b
	ld b, a
	ldh a, [hCurrentSpriteOffset]
	add $2
	ld l, a
	ld [hl], b         ; x#SPRITESTATEDATA1_IMAGEINDEX
	ret

; tests if sprite can walk the specified direction
; b: direction (1,2,4 or 8)
; c: ID of tile the sprite would walk onto
; d: Y movement delta (-1, 0 or 1)
; e: X movement delta (-1, 0 or 1)
; set carry on failure, clears carry on success
CanWalkOntoTile:
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA2_MOVEMENTBYTE1
	ld l, a
	ld a, [hl]         ; x#SPRITESTATEDATA2_MOVEMENTBYTE1
	cp WALK
	jr nc, .notScripted    ; values WALK or STAY
; always allow walking if the movement is scripted
	and a
	ret
.notScripted
	ld a, [wTilesetCollisionPtr]
	ld l, a
	ld a, [wTilesetCollisionPtr+1]
	ld h, a
.tilePassableLoop
	ld a, [hli]
	cp $ff
	jr z, .impassable
	cp c
	jr nz, .tilePassableLoop
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add $6
	ld l, a
	ld a, [hl]         ; x#SPRITESTATEDATA2_MOVEMENTBYTE1
	inc a
	jr z, .impassable  ; if $ff, no movement allowed (however, changing direction is)
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA1_YPIXELS
	ld l, a
	ld a, [hli]        ; x#SPRITESTATEDATA1_YPIXELS
	add $4             ; align to blocks (Y pos is always 4 pixels off)
	add d              ; add Y delta
	cp $80             ; if value is >$80, the destination is off screen (either $81 or $FF underflow)
	jr nc, .impassable ; don't walk off screen
	inc l
	ld a, [hl]         ; x#SPRITESTATEDATA1_XPIXELS
	add e              ; add X delta
	cp $90             ; if value is >$90, the destination is off screen (either $91 or $FF underflow)
	jr nc, .impassable ; don't walk off screen
	push de
	push bc
	call DetectCollisionBetweenSprites
	pop bc
	pop de
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add $c
	ld l, a
	ld a, [hl]         ; x#SPRITESTATEDATA1_COLLISIONDATA (directions in which sprite collision would occur)
	and b              ; check against chosen direction (1,2,4 or 8)
	jr nz, .impassable ; collision between sprites, don't go there
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA2_YDISPLACEMENT
	ld l, a
	ld a, [hli]        ; x#SPRITESTATEDATA2_YDISPLACEMENT (initialized at $8, keep track of where a sprite did go)
	bit 7, d           ; check if going upwards (d == -1)
	jr nz, .upwards
	add d
	; bug: these tests against $5 probably were supposed to prevent
	; sprites from walking out too far, but this line makes sprites get
	; stuck whenever they walked upwards 5 steps
	; on the other hand, the amount a sprite can walk out to the
	; right of bottom is not limited (until the counter overflows)
	cp $5
	jr c, .impassable  ; if [x#SPRITESTATEDATA2_YDISPLACEMENT]+d < 5, don't go
	jr .checkHorizontal
.upwards
	sub $1
	jr c, .impassable  ; if [x#SPRITESTATEDATA2_YDISPLACEMENT] == 0, don't go
.checkHorizontal
	ld d, a
	ld a, [hl]         ; x#SPRITESTATEDATA2_XDISPLACEMENT (initialized at $8, keep track of where a sprite did go)
	bit 7, e           ; check if going left (e == -1)
	jr nz, .left
	add e
	cp $5              ; compare, but no conditional jump like in the vertical check above (bug?)
	jr .passable
.left
	sub $1
	jr c, .impassable  ; if [x#SPRITESTATEDATA2_XDISPLACEMENT] == 0, don't go
.passable
	ld [hld], a        ; update x#SPRITESTATEDATA2_XDISPLACEMENT
	ld [hl], d         ; update x#SPRITESTATEDATA2_YDISPLACEMENT
	and a              ; clear carry (marking success)
	ret
.impassable
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	inc a
	ld l, a
	ld [hl], $2        ; [x#SPRITESTATEDATA1_MOVEMENTSTATUS] = 2 (delayed)
	inc l
	inc l
	xor a
	ld [hli], a        ; [x#SPRITESTATEDATA1_YSTEPVECTOR] = 0
	inc l
	ld [hl], a         ; [x#SPRITESTATEDATA1_XSTEPVECTOR] = 0
	inc h
	ldh a, [hCurrentSpriteOffset]
	add $8
	ld l, a
	call Random
	ldh a, [hRandomAdd]
	and $7f
	ld [hl], a         ; x#SPRITESTATEDATA2_MOVEMENTDELAY: set to a random value in [0,$7f] (again with delay $100 if value is 0)
	scf                ; set carry (marking failure to walk)
	ret

; calculates the tile pointer pointing to the tile the current sprite stands on
; this is always the lower left tile of the 2x2 tile blocks all sprites are snapped to
; hl: output pointer
GetTileSpriteStandsOn:
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA1_YPIXELS
	ld l, a
	ld a, [hli]     ; x#SPRITESTATEDATA1_YPIXELS
	add $4          ; align to 2*2 tile blocks (Y position is always off 4 pixels to the top)
	and $f0         ; in case object is currently moving
	srl a           ; screen Y tile * 4
	ld c, a
	ld b, $0
	inc l
	ld a, [hl]      ; x#SPRITESTATEDATA1_XPIXELS
	srl a
	srl a
	srl a            ; screen X tile
	add SCREEN_WIDTH ; screen X tile + 20
	ld d, $0
	ld e, a
	hlcoord 0, 0
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, de     ; wTileMap + 20*(screen Y tile + 1) + screen X tile
	ret

; loads [de+a] into a
LoadDEPlusA:
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	ld a, [de]
	ret

DoScriptedNPCMovement:
; This is an alternative method of scripting an NPC's movement and is only used
; a few times in the game. It is used when the NPC and player must walk together
; in sync, such as when the player is following the NPC somewhere. An NPC can't
; be moved in sync with the player using the other method.
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret z
	ld hl, wStatusFlags4
	bit BIT_INIT_SCRIPTED_MOVEMENT, [hl]
	set BIT_INIT_SCRIPTED_MOVEMENT, [hl]
	jp z, InitScriptedNPCMovement
	ld hl, wNPCMovementDirections2
	ld a, [wNPCMovementDirections2Index]
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hl]
; check if moving up
	cp NPC_MOVEMENT_UP
	jr nz, .checkIfMovingDown
	call GetSpriteScreenYPointer
	ld c, SPRITE_FACING_UP
	ld a, -2
	jr .move
.checkIfMovingDown
	cp NPC_MOVEMENT_DOWN
	jr nz, .checkIfMovingLeft
	call GetSpriteScreenYPointer
	ld c, SPRITE_FACING_DOWN
	ld a, 2
	jr .move
.checkIfMovingLeft
	cp NPC_MOVEMENT_LEFT
	jr nz, .checkIfMovingRight
	call GetSpriteScreenXPointer
	ld c, SPRITE_FACING_LEFT
	ld a, -2
	jr .move
.checkIfMovingRight
	cp NPC_MOVEMENT_RIGHT
	jr nz, .noMatch
	call GetSpriteScreenXPointer
	ld c, SPRITE_FACING_RIGHT
	ld a, 2
	jr .move
.noMatch
	cp $ff
	ret
.move
	ld b, a
	ld a, [hl]
	add b
	ld [hl], a
	ldh a, [hCurrentSpriteOffset]
	add $9
	ld l, a
	ld a, c
	ld [hl], a ; facing direction
	call AnimScriptedNPCMovement
	ld hl, wScriptedNPCWalkCounter
	dec [hl]
	ret nz
	ld a, 8
	ld [wScriptedNPCWalkCounter], a
	ld hl, wNPCMovementDirections2Index
	inc [hl]
	ret

InitScriptedNPCMovement:
	xor a
	ld [wNPCMovementDirections2Index], a
	ld a, 8
	ld [wScriptedNPCWalkCounter], a
	jp AnimScriptedNPCMovement

GetSpriteScreenYPointer:
	ld a, SPRITESTATEDATA1_YPIXELS
	ld b, a
	jr GetSpriteScreenXYPointerCommon

GetSpriteScreenXPointer:
	ld a, SPRITESTATEDATA1_XPIXELS
	ld b, a

GetSpriteScreenXYPointerCommon:
	ld hl, wSpriteStateData1
	ldh a, [hCurrentSpriteOffset]
	add l
	add b
	ld l, a
	ret

AnimScriptedNPCMovement:
	ld hl, wSpriteStateData2
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA2_IMAGEBASEOFFSET
	ld l, a
	ld a, [hl] ; VRAM slot
	dec a
	swap a
	ld b, a
	ld hl, wSpriteStateData1
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA1_FACINGDIRECTION
	ld l, a
	ld a, [hl] ; facing direction
	cp SPRITE_FACING_DOWN
	jr z, .anim
	cp SPRITE_FACING_UP
	jr z, .anim
	cp SPRITE_FACING_LEFT
	jr z, .anim
	cp SPRITE_FACING_RIGHT
	jr z, .anim
	ret
.anim
	add b
	ld b, a
	ldh [hSpriteVRAMSlotAndFacing], a
	call AdvanceScriptedNPCAnimFrameCounter
	ld hl, wSpriteStateData1
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA1_IMAGEINDEX
	ld l, a
	ldh a, [hSpriteVRAMSlotAndFacing]
	ld b, a
	ldh a, [hSpriteAnimFrameCounter]
	add b
	ld [hl], a
	ret

AdvanceScriptedNPCAnimFrameCounter:
	ldh a, [hCurrentSpriteOffset]
	add $7
	ld l, a
	ld a, [hl] ; intra-animation frame counter
	inc a
	ld [hl], a
	cp 4
	ret nz
	xor a
	ld [hl], a ; reset intra-animation frame counter
	inc l
	ld a, [hl] ; animation frame counter
	inc a
	and $3
	ld [hl], a
	ldh [hSpriteAnimFrameCounter], a
	ret
