UpdatePlayerSprite: ; 4e31 (1:4e31)
	ld a, [wSpriteStateData2]
	and a
	jr z, .asm_4e41
	cp $ff
	jr z, .asm_4e4a
	dec a
	ld [wSpriteStateData2], a
	jr .asm_4e4a
.asm_4e41
	aCoord 8, 9
	ld [$ff93], a
	cp $60
	jr c, .asm_4e50
.asm_4e4a
	ld a, $ff
	ld [wSpriteStateData1 + 2], a
	ret
.asm_4e50
	call Func_4c70
	ld h, $c1
	ld a, [wWalkCounter] ; wcfc5
	and a
	jr nz, .asm_4e90
	ld a, [wd528]
	bit 2, a
	jr z, .asm_4e65
	xor a
	jr .asm_4e86
.asm_4e65
	bit 3, a
	jr z, .asm_4e6d
	ld a, $4
	jr .asm_4e86
.asm_4e6d
	bit 1, a
	jr z, .asm_4e75
	ld a, $8
	jr .asm_4e86
.asm_4e75
	bit 0, a
	jr z, .asm_4e7d
	ld a, $c
	jr .asm_4e86
.asm_4e7d
	xor a
	ld [wSpriteStateData1 + 7], a
	ld [wSpriteStateData1 + 8], a
	jr .asm_4eab
.asm_4e86
	ld [wSpriteStateData1 + 9], a
	ld a, [wcfc4]
	bit 0, a
	jr nz, .asm_4e7d
.asm_4e90
	ld a, [wd736]
	bit 7, a
	jr nz, .asm_4eb6
	ld a, [H_CURRENTSPRITEOFFSET]
	add $7
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	jr nz, .asm_4eab
	xor a
	ld [hl], a
	inc hl
	ld a, [hl]
	inc a
	and $3
	ld [hl], a
.asm_4eab
	ld a, [wSpriteStateData1 + 8]
	ld b, a
	ld a, [wSpriteStateData1 + 9]
	add b
	ld [wSpriteStateData1 + 2], a
.asm_4eb6
	ld a, [$ff93]
	ld c, a
	ld a, [W_GRASSTILE]
	cp c
	ld a, $0
	jr nz, .asm_4ec3
	ld a, $80
.asm_4ec3
	ld [wSpriteStateData2 + $07], a
	ret

Func_4ec7: ; 4ec7 (1:4ec7)
	push bc
	push af
	ld a, [$ffda]
	ld c, a
	pop af
	add c
	ld l, a
	pop bc
	ret

Func_4ed1: ; 4ed1 (1:4ed1)
	ld a, [H_CURRENTSPRITEOFFSET]
	swap a
	dec a
	add a
	ld hl, W_MAPSPRITEDATA ; wd4e4
	add l
	ld l, a
	ld a, [hl]        ; read movement byte 2
	ld [wCurSpriteMovement2], a
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	ld l, a
	inc l
	ld a, [hl]        ; c1x1
	and a
	jp z, InitializeSpriteStatus
	call CheckSpriteAvailability
	ret c             ; if sprite is invisible, on tile >=$60, in grass or player is currently walking
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	ld l, a
	inc l
	ld a, [hl]        ; c1x1
	bit 7, a
	jp nz, InitializeSpriteFacingDirection  ; c1x1 >= $80
	ld b, a
	ld a, [wcfc4]
	bit 0, a
	jp nz, notYetMoving
	ld a, b
	cp $2
	jp z, UpdateSpriteMovementDelay  ; c1x1 == 2
	cp $3
	jp z, UpdateSpriteInWalkingAnimation  ; c1x1 == 3
	ld a, [wWalkCounter] ; wcfc5
	and a
	ret nz           ; don't do anything yet if player is currently moving (redundant, already tested in CheckSpriteAvailability)
	call InitializeSpriteScreenPosition
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]       ; c2x6: movement byte 1
	inc a
	jr z, .asm_4f59  ; value $FF
	inc a
	jr z, .asm_4f59  ; value $FE
	dec a
	ld [hl], a       ; (temporarily) increment movement byte 1
	dec a
	push hl
	ld hl, wcf0f
	dec [hl]         ; decrement wcf0f
	pop hl
	ld de, wcc5b
	call LoadDEPlusA ; a = [wcc5b + movement byte 1]
	cp $e0
	jp z, ChangeFacingDirection
	cp $ff
	jr nz, .asm_4f4b
	ld [hl], a       ; reset movement byte 1 to initial value
	ld hl, wd730
	res 0, [hl]
	xor a
	ld [wcd38], a
	ld [wcd3a], a
	ret
.asm_4f4b
	cp $fe
	jr nz, .asm_4f5f
	ld [hl], $1     ; set movement byte 1 to $1
	ld de, wcc5b
	call LoadDEPlusA ; a = [wcc5b + $fe] (?)
	jr .asm_4f5f
.asm_4f59
	call getTileSpriteStandsOn
	call Random
.asm_4f5f
	ld b, a
	ld a, [wCurSpriteMovement2]
	cp $d0
	jr z, .moveDown    ; movement byte 2 = $d0 forces down
	cp $d1
	jr z, .moveUp      ; movement byte 2 = $d1 forces up
	cp $d2
	jr z, .moveLeft    ; movement byte 2 = $d2 forces left
	cp $d3
	jr z, .moveRight   ; movement byte 2 = $d3 forces right
	ld a, b
	cp $40             ; a < $40: down (or left)
	jr nc, .notDown
	ld a, [wCurSpriteMovement2]
	cp $2
	jr z, .moveLeft    ; movement byte 2 = $2 only allows left or right
.moveDown
	ld de, 2*20
	add hl, de         ; move tile pointer two rows down
	ld de, $100

	ld bc, $400
	jr TryWalking
.notDown
	cp $80             ; $40 <= a < $80: up (or right)
	jr nc, .notUp
	ld a, [wCurSpriteMovement2]
	cp $2
	jr z, .moveRight   ; movement byte 2 = $2 only allows left or right
.moveUp
	ld de, -2*20 ; $ffd8
	add hl, de         ; move tile pointer two rows up
	ld de, $ff00
	ld bc, $804
	jr TryWalking
.notUp
	cp $c0             ; $80 <= a < $c0: left (or up)
	jr nc, .notLeft
	ld a, [wCurSpriteMovement2]
	cp $1
	jr z, .moveUp      ; movement byte 2 = $1 only allows up or down
.moveLeft
	dec hl
	dec hl             ; move tile pointer two columns left
	ld de, $ff
	ld bc, $208
	jr TryWalking
.notLeft              ; $c0 <= a: right (or down)
	ld a, [wCurSpriteMovement2]
	cp $1
	jr z, .moveDown    ; movement byte 2 = $1 only allows up or down
.moveRight
	inc hl
	inc hl             ; move tile pointer two columns right
	ld de, $1
	ld bc, $10c
	jr TryWalking

; changes facing direction by zeroing the movement delta and calling TryWalking
ChangeFacingDirection: ; 4fc8 (1:4fc8)
	ld de, $0
	; fall through

; b: direction (1,2,4 or 8)
; c: new facing direction (0,4,8 or $c)
; d: Y movement delta (-1, 0 or 1)
; e: X movement delta (-1, 0 or 1)
; hl: pointer to tile the sprite would wlak onto
; set carry on failure, clears carry on success
TryWalking: ; 4fcb (1:4fcb)
	push hl
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld [hl], c          ; c1x9 (update facing direction)
	ld a, [H_CURRENTSPRITEOFFSET]
	add $3
	ld l, a
	ld [hl], d          ; c1x3 (update Y movement delta)
	inc l
	inc l
	ld [hl], e          ; c1x5 (update X movement delta)
	pop hl
	push de
	ld c, [hl]          ; read tile to walk onto
	call CanWalkOntoTile
	pop de
	ret c               ; cannot walk there (reinitialization of delay values already done)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld a, [hl]          ; c2x4: Y position
	add d
	ld [hli], a         ; update Y position
	ld a, [hl]          ; c2x5: X position
	add e
	ld [hl], a          ; update X position
	ld a, [H_CURRENTSPRITEOFFSET]
	ld l, a
	ld [hl], $10        ; c2x0=16: walk animation counter
	dec h
	inc l
	ld [hl], $3         ; c1x1: set movement status to walking
	jp UpdateSpriteImage

; update the walking animation parameters for a sprite that is currently walking
UpdateSpriteInWalkingAnimation: ; 4ffe (1:4ffe)
	ld a, [H_CURRENTSPRITEOFFSET]
	add $7
	ld l, a
	ld a, [hl]                       ; c1x7 (counter until next walk animation frame)
	inc a
	ld [hl], a                       ; c1x7 += 1
	cp $4
	jr nz, .noNextAnimationFrame
	xor a
	ld [hl], a                       ; c1x7 = 0
	inc l
	ld a, [hl]                       ; c1x8 (walk animation frame)
	inc a
	and $3
	ld [hl], a                       ; advance to next animation frame every 4 ticks (16 ticks total for one step)
.noNextAnimationFrame
	ld a, [H_CURRENTSPRITEOFFSET]
	add $3
	ld l, a
	ld a, [hli]                      ; c1x3 (movement Y delta)
	ld b, a
	ld a, [hl]                       ; c1x4 (screen Y position)
	add b
	ld [hli], a                      ; update screen Y position
	ld a, [hli]                      ; c1x5 (movement X delta)
	ld b, a
	ld a, [hl]                       ; c1x6 (screen X position)
	add b
	ld [hl], a                       ; update screen X position
	ld a, [H_CURRENTSPRITEOFFSET]
	ld l, a
	inc h
	ld a, [hl]                       ; c2x0 (walk animantion counter)
	dec a
	ld [hl], a                       ; update walk animantion counter
	ret nz
	ld a, $6                         ; walking finished, update state
	add l
	ld l, a
	ld a, [hl]                       ; c2x6 (movement byte 1)
	cp $fe
	jr nc, .initNextMovementCounter  ; values $fe and $ff
	ld a, [H_CURRENTSPRITEOFFSET]
	inc a
	ld l, a
	dec h
	ld [hl], $1                      ; c1x1 = 1 (movement status ready)
	ret
.initNextMovementCounter
	call Random
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	ld a, [hRandomAdd]
	and $7f
	ld [hl], a                       ; c2x8: set next movement delay to a random value in [0,$7f]
	dec h                            ;       note that value 0 actually makes the delay $100 (bug?)
	ld a, [H_CURRENTSPRITEOFFSET]
	inc a
	ld l, a
	ld [hl], $2                      ; c1x1 = 2 (movement status)
	inc l
	inc l
	xor a
	ld b, [hl]                       ; c1x3 (movement Y delta)
	ld [hli], a                      ; reset movement Y delta
	inc l
	ld c, [hl]                       ; c1x5 (movement X delta)
	ld [hl], a                       ; reset movement X delta
	ret

; update delay value (c2x8) for sprites in the delayed state (c1x1)
UpdateSpriteMovementDelay: ; 5057 (1:5057)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]              ; c2x6: movement byte 1
	inc l
	inc l
	cp $fe
	jr nc, .tickMoveCounter ; values $fe or $ff
	ld [hl], $0
	jr .moving
.tickMoveCounter
	dec [hl]                ; c2x8: frame counter until next movement
	jr nz, notYetMoving
.moving
	dec h
	ld a, [H_CURRENTSPRITEOFFSET]
	inc a
	ld l, a
	ld [hl], $1             ; c1x1 = 1 (mark as ready to move)
notYetMoving: ; 5073 (1:5073)
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	ld [hl], $0             ; c1x8 = 0 (walk animation frame)
	jp UpdateSpriteImage

InitializeSpriteFacingDirection: ; 507f (1:507f)
	ld a, [wd72d]
	bit 5, a
	jr nz, notYetMoving
	res 7, [hl]
	ld a, [wd52a]
	bit 3, a
	jr z, .notFacingDown
	ld c, $0                ; make sprite face down
	jr .facingDirectionDetermined
.notFacingDown
	bit 2, a
	jr z, .notFacingUp
	ld c, $4                ; make sprite face up
	jr .facingDirectionDetermined
.notFacingUp
	bit 1, a
	jr z, .notFacingRight
	ld c, $c                ; make sprite face right
	jr .facingDirectionDetermined
.notFacingRight
	ld c, $8                ; make sprite face left
.facingDirectionDetermined
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld [hl], c              ; c1x9: set facing direction
	jr notYetMoving

InitializeSpriteStatus: ; 50ad (1:50ad)
	ld [hl], $1   ; $c1x1: set movement status to ready
	inc l
	ld [hl], $ff  ; $c1x2: set sprite image to $ff (invisible/off screen)
	inc h
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld a, $8
	ld [hli], a   ; $c2x2: set Y displacement to 8
	ld [hl], a    ; $c2x3: set X displacement to 8
	ret

; calculates the spprite's scrren position form its map position and the player position
InitializeSpriteScreenPosition: ; 50bd (1:50bd)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld a, [W_YCOORD] ; wd361
	ld b, a
	ld a, [hl]      ; c2x4 (Y position + 4)
	sub b           ; relative to player position
	swap a          ; * 16
	sub $4          ; - 4
	dec h
	ld [hli], a     ; c1x4 (screen Y position)
	inc h
	ld a, [W_XCOORD] ; wd362
	ld b, a
	ld a, [hli]     ; c2x6 (X position + 4)
	sub b           ; relative to player position
	swap a          ; * 16
	dec h
	ld [hl], a      ; c1x6 (screen X position)
	ret

; tests if sprite is off screen or otherwise unable to do anything
CheckSpriteAvailability: ; 50dc (1:50dc)
	predef IsObjectHidden
	ld a, [$ffe5]
	and a
	jp nz, .spriteInvisible
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]      ; c2x6: movement byte 1
	cp $fe
	jr c, .skipXVisibilityTest ; movement byte 1 < $fe
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld b, [hl]      ; c2x4: Y pos (+4)
	ld a, [W_YCOORD] ; wd361
	cp b
	jr z, .skipYVisibilityTest
	jr nc, .spriteInvisible ; above screen region
	add $8                  ; screen is 9 tiles high
	cp b
	jr c, .spriteInvisible  ; below screen region
.skipYVisibilityTest
	inc l
	ld b, [hl]      ; c2x5: X pos (+4)
	ld a, [W_XCOORD] ; wd362
	cp b
	jr z, .skipXVisibilityTest
	jr nc, .spriteInvisible ; left of screen region
	add $9                  ; screen is 10 tiles wide
	cp b
	jr c, .spriteInvisible  ; right of screen region
.skipXVisibilityTest
	call getTileSpriteStandsOn
	ld d, $60
	ld a, [hli]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=$60 (bottom left tile)
	ld a, [hld]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=$60 (bottom right tile)
	ld bc, -20 ; $ffec
	add hl, bc              ; go back one row of tiles
	ld a, [hli]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=$60 (top left tile)
	ld a, [hl]
	cp d
	jr c, .spriteVisible    ; standing on tile with ID >=$60 (top right tile)
.spriteInvisible
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld [hl], $ff       ; c1x2
	scf
	jr .done
.spriteVisible
	ld c, a
	ld a, [wWalkCounter] ; wcfc5
	and a
	jr nz, .done           ; if player is currently walking, we're done
	call UpdateSpriteImage
	inc h
	ld a, [H_CURRENTSPRITEOFFSET]
	add $7
	ld l, a
	ld a, [W_GRASSTILE]
	cp c
	ld a, $0
	jr nz, .notInGrass
	ld a, $80
.notInGrass
	ld [hl], a       ; c2x7
	and a
.done
	ret

UpdateSpriteImage: ; 5157 (1:5157)
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	ld a, [hli]        ; c1x8: walk animation frame
	ld b, a
	ld a, [hl]         ; c1x9: facing direction
	add b
	ld b, a
	ld a, [$ff93]  ; current sprite offset
	add b
	ld b, a
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld [hl], b         ; c1x2: sprite to display
	ret

; tests if sprite can walk the specified direction
; b: direction (1,2,4 or 8)
; c: ID of tile the sprite would walk onto
; d: Y movement delta (-1, 0 or 1)
; e: X movement delta (-1, 0 or 1)
; set carry on failure, clears carry on success
CanWalkOntoTile: ; 516e (1:516e)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]         ; c2x6 (movement byte 1)
	cp $fe
	jr nc, .canMove    ; values $fe and $ff
	and a
	ret
.canMove
	ld a, [W_TILESETCOLLISIONPTR]
	ld l, a
	ld a, [W_TILESETCOLLISIONPTR+1]
	ld h, a
.tilePassableLoop
	ld a, [hli]
	cp $ff
	jr z, .impassable
	cp c
	jr nz, .tilePassableLoop
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]         ; $c2x6 (movement byte 1)
	inc a
	jr z, .impassable  ; if $ff, no movement allowed (however, changing direction is)
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld a, [hli]        ; c1x4 (screen Y pos)
	add $4             ; align to blocks (Y pos is always 4 pixels off)
	add d              ; add Y delta
	cp $80             ; if value is >$80, the destination is off screen (either $81 or $FF underflow)
	jr nc, .impassable ; don't walk off screen
	inc l
	ld a, [hl]         ; c1x6 (screen X pos)
	add e              ; add X delta
	cp $90             ; if value is >$90, the destination is off screen (either $91 or $FF underflow)
	jr nc, .impassable ; don't walk off screen
	push de
	push bc
	call Func_4c70
	pop bc
	pop de
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $c
	ld l, a
	ld a, [hl]         ; c1xc (forbidden directions flags(?))
	and b              ; check against chosen direction (1,2,4 or 8)
	jr nz, .impassable ; direction forbidden, don't go there
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld a, [hli]        ; c2x2 (sprite Y displacement, initialized at $8, keep track of where a sprite did go)
	bit 7, d           ; check if going upwards (d=$ff)
	jr nz, .upwards
	add d
	cp $5
	jr c, .impassable  ; if c2x2+d < 5, don't go ;bug: this tests probably were supposed to prevent sprites
	jr .checkHorizontal                          ; from walking out too far, but this line makes sprites get stuck
.upwards                                         ; whenever they walked upwards 5 steps
	sub $1                                       ; on the other hand, the amount a sprite can walk out to the
	jr c, .impassable  ; if d2x2 == 0, don't go  ; right of bottom is not limited (until the counter overflows)
.checkHorizontal
	ld d, a
	ld a, [hl]         ; c2x3 (sprite X displacement, initialized at $8, keep track of where a sprite did go)
	bit 7, e           ; check if going left (e=$ff)
	jr nz, .left
	add e
	cp $5              ; compare, but no conditional jump like in the vertical check above (bug?)
	jr .passable
.left
	sub $1
	jr c, .impassable  ; if d2x3 == 0, don't go
.passable
	ld [hld], a        ; update c2x3
	ld [hl], d         ; update c2x2
	and a              ; clear carry (marking success)
	ret
.impassable
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	inc a
	ld l, a
	ld [hl], $2        ; c1x1 = 2 (set movement status to delayed)
	inc l
	inc l
	xor a
	ld [hli], a        ; c1x3 = 0 (clear Y movement delta)
	inc l
	ld [hl], a         ; c1x5 = 0 (clear X movement delta)
	inc h
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	call Random
	ld a, [hRandomAdd]
	and $7f
	ld [hl], a         ; c2x8: set next movement delay to a random value in [0,$7f] (again with delay $100 if value is 0)
	scf                ; set carry (marking failure to walk)
	ret

; calculates the tile pointer pointing to the tile the current sprite stancs on
; this is always the lower left tile of the 2x2 tile blocks all sprites are snapped to
; hl: output pointer
getTileSpriteStandsOn: ; 5207 (1:5207)
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld a, [hli]     ; c1x4: screen Y position
	add $4          ; align to 2*2 tile blocks (Y position is always off 4 pixels to the top)
	and $f0         ; in case object is currently moving
	srl a           ; screen Y tile * 4
	ld c, a
	ld b, $0
	inc l
	ld a, [hl]      ; c1x6: screen Y position
	srl a
	srl a
	srl a           ; screen X tile
	add $14         ; screen X tile + 20
	ld d, $0
	ld e, a
	ld hl, wTileMap
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, de     ; wTileMap + 20*(screen Y tile + 1) + screen X tile
	ret

; loads [de+a] into a
LoadDEPlusA: ; 522f (1:522f)
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	ld a, [de]
	ret

Func_5236: ; 5236 (1:5236)
	ld a, [wd730]
	bit 7, a
	ret z
	ld hl, wd72e
	bit 7, [hl]
	set 7, [hl]
	jp z, Func_52a6
	ld hl, wcc97
	ld a, [wcd37]
	add l
	ld l, a
	jr nc, .asm_5251
	inc h
.asm_5251
	ld a, [hl]
	cp $40
	jr nz, .asm_525f
	call Func_52b2
	ld c, $4
	ld a, $fe
	jr .asm_5289
.asm_525f
	cp $0
	jr nz, .asm_526c
	call Func_52b2
	ld c, $0
	ld a, $2
	jr .asm_5289
.asm_526c
	cp $80
	jr nz, .asm_5279
	call Func_52b7
	ld c, $8
	ld a, $fe
	jr .asm_5289
.asm_5279
	cp $c0
	jr nz, .asm_5286
	call Func_52b7
	ld c, $c
	ld a, $2
	jr .asm_5289
.asm_5286
	cp $ff
	ret
.asm_5289
	ld b, a
	ld a, [hl]
	add b
	ld [hl], a
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld a, c
	ld [hl], a
	call Func_52c3
	ld hl, wcf18
	dec [hl]
	ret nz
	ld a, $8
	ld [wcf18], a
	ld hl, wcd37
	inc [hl]
	ret

Func_52a6: ; 52a6 (1:52a6)
	xor a
	ld [wcd37], a
	ld a, $8
	ld [wcf18], a
	jp Func_52c3

Func_52b2: ; 52b2 (1:52b2)
	ld a, $4
	ld b, a
	jr asm_52ba

Func_52b7: ; 52b7 (1:52b7)
	ld a, $6
	ld b, a
asm_52ba: ; 52ba (1:52ba)
	ld hl, wSpriteStateData1
	ld a, [H_CURRENTSPRITEOFFSET]
	add l
	add b
	ld l, a
	ret

Func_52c3: ; 52c3 (1:52c3)
	ld hl, wSpriteStateData2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $e
	ld l, a
	ld a, [hl]
	dec a
	swap a
	ld b, a
	ld hl, wSpriteStateData1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld a, [hl]
	cp $0
	jr z, .asm_52ea
	cp $4
	jr z, .asm_52ea
	cp $8
	jr z, .asm_52ea
	cp $c
	jr z, .asm_52ea
	ret
.asm_52ea
	add b
	ld b, a
	ld [$ffe9], a
	call Func_5301
	ld hl, wSpriteStateData1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld a, [$ffe9]
	ld b, a
	ld a, [$ffea]
	add b
	ld [hl], a
	ret

Func_5301: ; 5301 (1:5301)
	ld a, [H_CURRENTSPRITEOFFSET]
	add $7
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	ret nz
	xor a
	ld [hl], a
	inc l
	ld a, [hl]
	inc a
	and $3
	ld [hl], a
	ld [$ffea], a
	ret
