UpdateSpriteFacingOffsetAndDelayMovement::
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hCurrentSpriteOffset]
	add $8
	ld l, a
	ld a, $7f ; maximum movement delay
	ld [hl], a ; x#SPRITESTATEDATA2_MOVEMENTDELAY
	dec h ; HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add $9
	ld l, a
	ld a, [hld] ; x#SPRITESTATEDATA1_FACINGDIRECTION
	ld b, a
	xor a
	ld [hld], a
	ld [hl], a ; x#SPRITESTATEDATA1_ANIMFRAMECOUNTER
	ldh a, [hCurrentSpriteOffset]
	add SPRITESTATEDATA1_IMAGEINDEX
	ld l, a
	ld a, [hl] ; x#SPRITESTATEDATA1_IMAGEINDEX
	or b ; or in the facing direction
	ld [hld], a
	ld a, $2 ; delayed movement status
	ld [hl], a ; x#SPRITESTATEDATA1_MOVEMENTSTATUS
	ret
