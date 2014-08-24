Serial:: ; 2125 (0:2125)
	push af
	push bc
	push de
	push hl
	ld a, [$ffaa]
	inc a
	jr z, .asm_2142
	ld a, [$ff01]
	ld [$ffad], a
	ld a, [$ffac]
	ld [$ff01], a
	ld a, [$ffaa]
	cp $2
	jr z, .asm_2162
	ld a, $80
	ld [$ff02], a
	jr .asm_2162
.asm_2142
	ld a, [$ff01]
	ld [$ffad], a
	ld [$ffaa], a
	cp $2
	jr z, .asm_215f
	xor a
	ld [$ff01], a
	ld a, $3
	ld [rDIV], a ; $ff04
.asm_2153
	ld a, [rDIV] ; $ff04
	bit 7, a
	jr nz, .asm_2153
	ld a, $80
	ld [$ff02], a
	jr .asm_2162
.asm_215f
	xor a
	ld [$ff01], a
.asm_2162
	ld a, $1
	ld [$ffa9], a
	ld a, $fe
	ld [$ffac], a
	pop hl
	pop de
	pop bc
	pop af
	reti