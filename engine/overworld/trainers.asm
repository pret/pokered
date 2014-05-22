Func_567f9: ; 567f9 (15:67f9)
	ld hl, wSpriteStateData1
	ld de, $4
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call Func_56903
	ld a, [hli]
	ld [$ffeb], a
	inc hl
	ld a, [hl]
	ld [$ffec], a
	ld de, $fe
	add hl, de
	ld a, [hli]
	ld [$ffed], a
	ld a, [hl]
	ld [$ffee], a
	ret

Func_56819: ; 56819 (15:6819)
	ld hl, wSpriteStateData1
	ld de, $0004
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call Func_56903
	ld a, [hli]
	ld [$d130], a
	inc hl
	ld a, [hl]
	ld [$d131], a
	ld de, $00fe
	add hl, de
	ld a, [hli]
	ld [$d132], a
	ld a, [hl]
	ld [$d133], a
	ret

Func_5683d: ; 5683d (15:683d)
	ld hl, wSpriteStateData1
	ld de, $4
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call Func_56903
	ld a, [$ffeb]
	ld [hli], a
	inc hl
	ld a, [$ffec]
	ld [hl], a
	ld de, $fe
	add hl, de
	ld a, [$ffed]
	ld [hli], a
	ld a, [$ffee]
	ld [hl], a
	ret

Func_5685d: ; 5685d (15:685d)
	ld hl, wSpriteStateData1
	ld de, $0004
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call Func_56903
	ld a, [$d130]
	ld [hli], a
	inc hl
	ld a, [$d131]
	ld [hl], a
	ld de, $00fe
	add hl, de
	ld a, [$d132]
	ld [hli], a
	ld a, [$d133]
	ld [hl], a
	ret

TrainerWalkUpToPlayer: ; 56881 (15:6881)
	ld a, [$cf13]
	swap a
	ld [wTrainerSpriteOffset], a ; $cd3d
	call ReadTrainerScreenPosition
	ld a, [wTrainerFacingDirection]
	and a
	jr z, .facingDown
	cp $4
	jr z, .facingUp
	cp $8
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
	ld a, [$cd41]
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
	ld hl, $cc97
	ld de, $cc97
	call FillMemory     ; write the necessary steps to reach player
	ld [hl], $ff        ; write end of list sentinel
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	jp MoveSprite_

Func_56903: ; 56903 (15:6903)
	push de
	add hl, de
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	swap a
	ld d, $0
	ld e, a
	add hl, de
	pop de
	ret

; tests if this trainer is in the right position to engage the player and do so if she is.
CheckEngagePlayer: ; 5690f (15:690f)
	push hl
	push de
	ld a, [wTrainerSpriteOffset] ; $cd3d
	add $2
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]             ; c1x2: sprite image index
	sub $ff
	jr nz, .spriteOnScreen ; test if sprite is on screen
	jp .noEngage
.spriteOnScreen
	ld a, [wTrainerSpriteOffset] ; $cd3d
	add $9
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]             ; c1x9: facing direction
	ld [$cd3f], a
	call ReadTrainerScreenPosition
	ld a, [$cd40]          ; sprite screen Y pos
	ld b, a
	ld a, $3c
	cp b
	jr z, .linedUpY
	ld a, [$cd41]          ; sprite screen X pos
	ld b, a
	ld a, $40
	cp b
	jr z, .linedUpX
	xor a
	jp .noEngage
.linedUpY
	ld a, [$cd41]        ; sprite screen X pos
	ld b, a
	ld a, $40            ; (fixed) player X position
	call CalcDifference  ; calc distance
	jr z, .noEngage      ; exact same position as player
	call CheckSpriteCanSeePlayer
	jr c, .engage
	xor a
	jr .noEngage
.linedUpX
	ld a, [$cd40]        ; sprite screen Y pos
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
	ld a, [wTrainerSpriteOffset] ; $cd3d
	and a
	jr z, .noEngage
	ld hl, wFlags_0xcd60
	set 0, [hl]
	call EngageMapTrainer
	ld a, $ff
.noEngage: ; 56988 (15:6988)
	ld [wTrainerSpriteOffset], a ; $cd3d
	pop de
	pop hl
	ret

; reads trainer's Y position to $cd40 and X position to $cd41
ReadTrainerScreenPosition: ; 5698e (15:698e)
	ld a, [wTrainerSpriteOffset] ; $cd3d
	add $4
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]
	ld [$cd40], a
	ld a, [wTrainerSpriteOffset] ; $cd3d
	add $6
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]
	ld [$cd41], a
	ret

; checks if the sprite is properly lined up with the player with respect to the direction it's looking. Also checks the distance between player and sprite
; note that this does not necessarily mean the sprite is seeing the player, he could be behind it's back
; a: distance player to sprite
CheckSpriteCanSeePlayer: ; 569af (15:69af)
	ld b, a
	ld a, [wTrainerEngageDistance]  ; sprite line of sight (engage distance)
	cp b
	jr nc, .checkIfLinedUp
	jr .notInLine         ; player too far away
.checkIfLinedUp
	ld a, [$cd3f]         ; sprite facing direction
	cp $0                 ; down
	jr z, .checkXCoord
	cp $4                 ; up
	jr z, .checkXCoord
	cp $8                 ; left
	jr z, .checkYCoord
	cp $c                 ; right
	jr z, .checkYCoord
	jr .notInLine
.checkXCoord
	ld a, [$cd41]         ; sprite screen X position
	ld b, a
	cp $40
	jr z, .inLine
	jr .notInLine
.checkYCoord
	ld a, [$cd40]         ; sprite screen Y position
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
CheckPlayerIsInFrontOfSprite: ; 569e3 (15:69e3)
	ld a, [W_CURMAP] ; $d35e
	cp POWER_PLANT
	jp z, .engage       ; XXX not sure why bypass this for power plant (maybe to get voltorb fake items to work?)
	ld a, [wTrainerSpriteOffset] ; $cd3d
	add $4
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]          ; c1x4 (sprite screen Y pos)
	cp $fc
	jr nz, .notOnTopmostTile ; special case if sprite is on topmost tile (Y = $fc (-4)), make it come down a block
	ld a, $c
.notOnTopmostTile
	ld [$cd40], a
	ld a, [wTrainerSpriteOffset] ; $cd3d
	add $6
	ld d, $0
	ld e, a
	ld hl, wSpriteStateData1
	add hl, de
	ld a, [hl]          ; c1x6 (sprite screen X pos)
	ld [$cd41], a
	ld a, [$cd3f]       ; facing direction
	cp $0
	jr nz, .notFacingDown
	ld a, [$cd40]       ; sprite screen Y pos
	cp $3c
	jr c, .engage       ; sprite above player
	jr .noEngage        ; sprite below player
.notFacingDown
	cp $4
	jr nz, .notFacingUp
	ld a, [$cd40]       ; sprite screen Y pos
	cp $3c
	jr nc, .engage      ; sprite below player
	jr .noEngage        ; sprite above player
.notFacingUp
	cp $8
	jr nz, .notFacingLeft
	ld a, [$cd41]       ; sprite screen X pos
	cp $40
	jr nc, .engage      ; sprite right of player
	jr .noEngage        ; sprite left of player
.notFacingLeft
	ld a, [$cd41]       ; sprite screen X pos
	cp $40
	jr nc, .noEngage    ; sprite right of player
.engage
	ld a, $ff
	jr .done
.noEngage
	xor a
.done
	ld [wTrainerSpriteOffset], a ; $cd3d
	ret
