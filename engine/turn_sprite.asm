UpdateSpriteFacingOffsetAndDelayMovement:
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	ld a, $7f ; maximum movement delay
	ld [hl], a ; c2x8 (movement delay)
	dec h
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld a, [hld] ; c1x9 (facing direction)
	ld b, a
	xor a
	ld [hld], a
	ld [hl], a ; c1x8 (walk animation frame)
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld a, [hl] ; c1x2 (facing and animation table offset)
	or b ; or in the facing direction
	ld [hld], a
	ld a, $2 ; delayed movement status
	ld [hl], a ; c1x1 (movement status)
	ret
