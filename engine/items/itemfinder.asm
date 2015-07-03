HiddenItemNear: ; 7481f (1d:481f)
	ld hl, HiddenItemCoords
	ld b, $0
.asm_74824
	ld de, $0003
	ld a, [W_CURMAP]
	call IsInRestOfArray
	ret nc ; return if current map has no hidden items
	push bc
	push hl
	ld hl, wd6f0
	ld c, b
	ld b, $2
	predef FlagActionPredef
	ld a, c
	pop hl
	pop bc
	inc b
	and a
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	jr nz, .asm_74824
	ld a, [W_YCOORD]
	call Func_7486b
	cp d
	jr nc, .asm_74824
	ld a, [W_YCOORD]
	add $4
	cp d
	jr c, .asm_74824
	ld a, [W_XCOORD]
	call Func_7486b
	cp e
	jr nc, .asm_74824
	ld a, [W_XCOORD]
	add $5
	cp e
	jr c, .asm_74824
	scf
	ret

Func_7486b: ; 7486b (1d:486b)
	sub $5
	cp $f0
	ret c
	xor a
	ret
