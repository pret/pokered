Func_79e96: ; 79e96 (1e:5e96)
	ld a, [$cd4d]
	cp $52
	jr z, .asm_79ec8
	ld c, $8
.asm_79e9f
	push bc
	ld hl, $c391
	ld a, $1
	ld [$d08a], a
	ld c, $2
	call Func_79339
	ld hl, $c399
	ld a, $ff
	ld [$d08a], a
	ld c, $2
	call Func_79339
	ld a, [rOBP1] ; $ff49
	xor $64
	ld [rOBP1], a ; $ff49
	call DelayFrame
	pop bc
	dec c
	jr nz, .asm_79e9f
	ret
.asm_79ec8
	ld c, $2
.asm_79eca
	push bc
	ld c, $8
	call Func_79eed
	call Func_79f30
	ld c, $8
	call Func_79eed
	call Func_79f30
	ld hl, $c390
	ld a, $2
	ld [$d08a], a
	ld c, $4
	call Func_79352
	pop bc
	dec c
	jr nz, .asm_79eca
	ret

Func_79eed: ; 79eed (1e:5eed)
	push bc
	ld hl, $c391
	ld a, $1
	ld [$d08a], a
	ld c, $1
	call Func_79339
	ld hl, $c395
	ld a, $2
	ld [$d08a], a
	ld c, $1
	call Func_79339
	ld hl, $c399
	ld a, $fe
	ld [$d08a], a
	ld c, $1
	call Func_79339
	ld hl, $c39d
	ld a, $ff
	ld [$d08a], a
	ld c, $1
	call Func_79339
	ld a, [rOBP1] ; $ff49
	xor $64
	ld [rOBP1], a ; $ff49
	call DelayFrame
	pop bc
	dec c
	jr nz, Func_79eed
	ret

Func_79f30: ; 79f30 (1e:5f30)
	ld hl, $c390
	ld de, $cee9
	ld bc, $8
	call CopyData
	ld hl, $c398
	ld de, $c390
	ld bc, $8
	call CopyData
	ld hl, $cee9
	ld de, $c398
	ld bc, $8
	jp CopyData
