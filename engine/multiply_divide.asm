_Multiply: ; 37d41 (d:7d41)
	ld a, $8
	ld b, a
	xor a
	ld [H_PRODUCT], a          ; $ff95
	ld [H_MULTIPLYBUFFER], a   ; $ff9b
	ld [H_MULTIPLYBUFFER+1], a ; $ff9c
	ld [H_MULTIPLYBUFFER+2], a ; $ff9d
	ld [H_MULTIPLYBUFFER+3], a ; $ff9e
.multiplyLoop
	ld a, [H_MULTIPLIER] ; $ff99
	srl a
	ld [H_MULTIPLIER], a ; $ff99
	jr nc, .smallMultiplier ; less than $80
; code to possibly multiply the multiplicand by 2 and divide the multiplier by 2?
	ld a, [H_MULTIPLYBUFFER+3]
	ld c, a
	ld a, [H_MULTIPLICAND+2]
	add c
	ld [H_MULTIPLYBUFFER+3], a
	ld a, [H_MULTIPLYBUFFER+2]
	ld c, a
	ld a, [H_MULTIPLICAND+1]
	adc c
	ld [H_MULTIPLYBUFFER+2], a
	ld a, [H_MULTIPLYBUFFER+1] ; $ff9c
	ld c, a
	ld a, [H_MULTIPLICAND] ; $ff96
	adc c
	ld [H_MULTIPLYDBUFFER+1], a ; $ff9c
	ld a, [H_MULTIPLYBUFFER]
	ld c, a
	ld a, [H_PRODUCT] ; $ff95
	adc c
	ld [H_MULTIPLYBUFFER], a
.smallMultiplier
	dec b
	jr z, .done
	ld a, [H_MULTIPLICAND]
	sla a
	ld [H_MULTIPLICAND+2], a
	ld a, [H_MULTIPLICAND+1]
	rl a
	ld [H_MULTIPLICAND+1], a
	ld a, [H_MULTIPLICAND] ; $ff96
	rl a
	ld [H_MULTIPLICAND], a ; $ff96
	ld a, [H_PRODUCT] ; $ff95
	rl a
	ld [H_PRODUCT], a ; $ff95
	jr .multiplyLoop
.done
	ld a, [H_MULTIPLYBUFFER+3]
	ld [H_PRODUCT+3], a
	ld a, [H_MULTIPLYBUFFER+2]
	ld [H_PRODUCT+2], a
	ld a, [H_MULTIPLYBUFFER+1] ; $ff9c
	ld [H_PRODUCT+1], a ; $ff96
	ld [H_PRODUCT], a ; $ff95
	ret

_Divide: ; 37da5 (d:7da5)
	xor a
	ld [H_DIVIDEBUFFER], a   ; ff9a
	ld [H_DIVIDEBUFFER+1], a ; ff9b
	ld [H_DIVIDEBUFFER+2], a ; ff9c
	ld [H_DIVIDEBUFFER+3], a ; ff9d
	ld [H_DIVIDEBUFFER+4], a ; ff9e
	ld a, $9
	ld e, a
.asm_37db3
	ld a, [H_DIVIDEBUFFER]
	ld c, a
	ld a, [H_DIVIDEND+1] ; $ff96
	sub c
	ld d, a
	ld a, [H_DIVISOR] ; $ff99
	ld c, a
	ld a, [H_DIVIDEND] ; $ff95
	sbc c
	jr c, .asm_37dce
	ld [H_DIVIDEND], a ; $ff95
	ld a, d
	ld [H_DIVIDEND+1], a ; $ff96
	ld a, [H_DIVIDEBUFFER+4]
	inc a
	ld [H_DIVIDEBUFFER+4], a
	jr .asm_37db3
.asm_37dce
		ld a, b
	cp $1
	jr z, .done
	ld a, [H_DIVIDEBUFFER+4]
	sla a
	ld [H_DIVIDEBUFFER+4], a
	ld a, [H_DIVIDEBUFFER+3]
	rl a
	ld [H_DIVIDEBUFFER+3], a
	ld a, [H_DIVIDEBUFFER+2] ; $ff9c
	rl a
	ld [H_DIVIDEBUFFER+2], a ; $ff9c
	ld a, [H_DIVIDEBUFFER+1]
	rl a
	ld [H_DIVIDEBUFFER+1], a
	dec e
	jr nz, .asm_37e04
	ld a, $8
	ld e, a
	ld a, [H_DIVIDEBUFFER]
	ld [H_DIVISOR], a ; $ff99
	xor a
	ld [H_DIVIDEBUFFER], a
	ld a, [H_DIVIDEND+1] ; $ff96
	ld [H_DIVIDEND], a ; $ff95
	ld a, [H_DIVIDEND+2]
	ld [H_DIVIDEND+1], a ; $ff96
	ld a, [H_DIVIDEND+3]
	ld [H_DIVIDEND+2], a
.asm_37e04
	ld a, e
	cp $1
	jr nz, .asm_37e0a
	dec b
.asm_37e0a
	ld a, [H_DIVIDEND+4] ; $ff99
	srl a
	ld [H_REMAINDER], a ; $ff99
	ld a, [H_DIVIDEBUFFER]
	rr a
	ld [H_DIVIDEBUFFER], a
	jr .asm_37db3
.done
	ld a, [H_DIVIDEND+1] ; $ff96
	ld [H_REMAINDER], a ; $ff99
	ld a, [H_DIVIDEBUFFER+4]
	ld [H_QUOTIENT+3], a
	ld a, [H_DIVIDEBUFFER+3]
	ld [H_QUOTIENT+2], a
	ld a, [H_DIVIDEBUFFER+2] ; $ff9c
	ld [H_QUOTIENT+1], a ; $ff96
	ld a, [H_DIVIDEBUFFER+1]
	ld [H_QUOTIENT], a ; $ff95
	ret
