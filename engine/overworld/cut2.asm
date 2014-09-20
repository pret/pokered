Func_79e96: ; 79e96 (1e:5e96)
	ld a, [wcd4d]
	cp $52
	jr z, .asm_79ec8
	ld c, $8
.asm_79e9f
	push bc
	ld hl, wOAMBuffer + $91
	ld a, $1
	ld [wd08a], a
	ld c, $2
	call AdjustOAMBlockXPos2
	ld hl, wOAMBuffer + $99
	ld a, $ff
	ld [wd08a], a
	ld c, $2
	call AdjustOAMBlockXPos2
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
	ld hl, wOAMBuffer + $90
	ld a, $2
	ld [wd08a], a
	ld c, $4
	call AdjustOAMBlockYPos2
	pop bc
	dec c
	jr nz, .asm_79eca
	ret

Func_79eed: ; 79eed (1e:5eed)
	push bc
	ld hl, wOAMBuffer + $91
	ld a, $1
	ld [wd08a], a
	ld c, $1
	call AdjustOAMBlockXPos2
	ld hl, wOAMBuffer + $95
	ld a, $2
	ld [wd08a], a
	ld c, $1
	call AdjustOAMBlockXPos2
	ld hl, wOAMBuffer + $99
	ld a, $fe
	ld [wd08a], a
	ld c, $1
	call AdjustOAMBlockXPos2
	ld hl, wOAMBuffer + $9d
	ld a, $ff
	ld [wd08a], a
	ld c, $1
	call AdjustOAMBlockXPos2
	ld a, [rOBP1] ; $ff49
	xor $64
	ld [rOBP1], a ; $ff49
	call DelayFrame
	pop bc
	dec c
	jr nz, Func_79eed
	ret

Func_79f30: ; 79f30 (1e:5f30)
	ld hl, wOAMBuffer + $90
	ld de, wHPBarMaxHP
	ld bc, $8
	call CopyData
	ld hl, wOAMBuffer + $98
	ld de, wOAMBuffer + $90
	ld bc, $8
	call CopyData
	ld hl, wHPBarMaxHP
	ld de, wOAMBuffer + $98
	ld bc, $8
	jp CopyData
