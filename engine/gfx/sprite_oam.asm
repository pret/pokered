PrepareOAMData::
; Determine OAM data for currently visible
; sprites and write it to wShadowOAM.

	ld a, [wUpdateSpritesEnabled]
	dec a
	jr z, .updateEnabled

	cp -1
	ret nz
	ld [wUpdateSpritesEnabled], a
	jp HideSprites

.updateEnabled
	xor a
	ldh [hOAMBufferOffset], a

.spriteLoop
	ldh [hSpriteOffset2], a

	ld d, HIGH(wSpriteStateData1)
	ldh a, [hSpriteOffset2]
	ld e, a
	ld a, [de] ; [x#SPRITESTATEDATA1_PICTUREID]
	and a
	jp z, .nextSprite

	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_IMAGEINDEX]
	ld [wSavedSpriteImageIndex], a
	cp $ff ; off-screen (don't draw)
	jr nz, .visible

	call GetSpriteScreenXY
	jr .nextSprite

.visible
	cp $a0 ; is the sprite unchanging like an item ball or boulder?
	jr c, .usefacing

; unchanging
	and $f
	add $10 ; skip to the second half of the table which doesn't account for facing direction
	jr .next

.usefacing
	and $f

.next
	ld l, a

; get sprite priority
	push de
	inc d
	ld a, e
	add $5
	ld e, a
	ld a, [de] ; [x#SPRITESTATEDATA2_GRASSPRIORITY]
	and $80
	ldh [hSpritePriority], a ; temp store sprite priority
	pop de

; read the entry from the table
	ld h, 0
	ld bc, SpriteFacingAndAnimationTable
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a

	call GetSpriteScreenXY

	ldh a, [hOAMBufferOffset]
	ld e, a
	ld d, HIGH(wShadowOAM)

.tileLoop
	ldh a, [hSpriteScreenY]   ; temp for sprite Y position
	add $10                  ; Y=16 is top of screen (Y=0 is invisible)
	add [hl]                 ; add Y offset from table
	ld [de], a               ; write new sprite OAM Y position
	inc hl
	ldh a, [hSpriteScreenX]   ; temp for sprite X position
	add $8                   ; X=8 is left of screen (X=0 is invisible)
	add [hl]                 ; add X offset from table
	inc e
	ld [de], a               ; write new sprite OAM X position
	inc e
	ld a, [bc]               ; read pattern number offset (accommodates orientation (offset 0,4 or 8) and animation (offset 0 or $80))
	inc bc
	push bc
	ld b, a

	ld a, [wSavedSpriteImageIndex]
	swap a                   ; high nybble determines sprite used (0 is always player sprite, next are some npcs)
	and $f

	; Sprites $a and $b have one face (and therefore 4 tiles instead of 12).
	; As a result, sprite $b's tile offset is less than normal.
	cp $b
	jr nz, .notFourTileSprite
	ld a, $a * 12 + 4
	jr .next2

.notFourTileSprite
	; a *= 12
	sla a
	sla a
	ld c, a
	sla a
	add c

.next2
	add b ; add the tile offset from the table (based on frame and facing direction)
	pop bc
	ld [de], a ; tile id
	inc hl
	inc e
	ld a, [hl]
	bit BIT_SPRITE_UNDER_GRASS, a
	jr z, .skipPriority
	ldh a, [hSpritePriority]
	or [hl]
.skipPriority
	inc hl
	ld [de], a
	inc e
	bit BIT_END_OF_OAM_DATA, a
	jr z, .tileLoop

	ld a, e
	ldh [hOAMBufferOffset], a

.nextSprite
	ldh a, [hSpriteOffset2]
	add $10
	cp LOW($100)
	jp nz, .spriteLoop

	; Clear unused OAM.
	ldh a, [hOAMBufferOffset]
	ld l, a
	ld h, HIGH(wShadowOAM)
	ld de, $4
	ld b, $a0
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	ld a, $a0
	jr z, .clear

; Don't clear the last 4 entries because they are used for the shadow in the
; jumping down ledge animation and the rod in the fishing animation.
	ld a, $90

.clear
	cp l
	ret z
	ld [hl], b
	add hl, de
	jr .clear

GetSpriteScreenXY:
	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_YPIXELS]
	ldh [hSpriteScreenY], a
	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_XPIXELS]
	ldh [hSpriteScreenX], a
	ld a, 4
	add e
	ld e, a
	ldh a, [hSpriteScreenY]
	add 4
	and $f0
	ld [de], a ; [x#SPRITESTATEDATA1_YADJUSTED]
	inc e
	ldh a, [hSpriteScreenX]
	and $f0
	ld [de], a  ; [x#SPRITESTATEDATA1_XADJUSTED]
	ret
