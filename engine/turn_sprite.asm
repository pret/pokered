Func_13074: ; 13074 (4:7074)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	ld a, $7f
	ld [hl], a
	dec h
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld a, [hld]
	ld b, a
	xor a
	ld [hld], a
	ld [hl], a
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld a, [hl]
	or b
	ld [hld], a
	ld a, $2
	ld [hl], a
	ret
