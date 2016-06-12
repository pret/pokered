_Multiply:
	ld a, $8
	ld b, a
	xor a
	ld [H_PRODUCT], a
	ld [H_MULTIPLYBUFFER], a
	ld [H_MULTIPLYBUFFER+1], a
	ld [H_MULTIPLYBUFFER+2], a
	ld [H_MULTIPLYBUFFER+3], a
.loop
	ld a, [H_MULTIPLIER]
	srl a
	ld [H_MULTIPLIER], a ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	jr nc, .smallMultiplier
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
	ld a, [H_MULTIPLYBUFFER+1]
	ld c, a
	ld a, [H_MULTIPLICAND] ; (aliases: H_MULTIPLICAND)
	adc c
	ld [H_MULTIPLYBUFFER+1], a
	ld a, [H_MULTIPLYBUFFER]
	ld c, a
	ld a, [H_PRODUCT] ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	adc c
	ld [H_MULTIPLYBUFFER], a
.smallMultiplier
	dec b
	jr z, .done
	ld a, [H_MULTIPLICAND+2]
	sla a
	ld [H_MULTIPLICAND+2], a
	ld a, [H_MULTIPLICAND+1]
	rl a
	ld [H_MULTIPLICAND+1], a
	ld a, [H_MULTIPLICAND]
	rl a
	ld [H_MULTIPLICAND], a
	ld a, [H_PRODUCT]
	rl a
	ld [H_PRODUCT], a
	jr .loop
.done
	ld a, [H_MULTIPLYBUFFER+3]
	ld [H_PRODUCT+3], a
	ld a, [H_MULTIPLYBUFFER+2]
	ld [H_PRODUCT+2], a
	ld a, [H_MULTIPLYBUFFER+1]
	ld [H_PRODUCT+1], a
	ld a, [H_MULTIPLYBUFFER]
	ld [H_PRODUCT], a
	ret

_Divide:
	xor a
	ld [H_DIVIDEBUFFER], a
	ld [H_DIVIDEBUFFER+1], a
	ld [H_DIVIDEBUFFER+2], a
	ld [H_DIVIDEBUFFER+3], a
	ld [H_DIVIDEBUFFER+4], a
	ld a, $9
	ld e, a
.asm_37db3
	ld a, [H_DIVIDEBUFFER]
	ld c, a
	ld a, [H_DIVIDEND+1] ; (aliases: H_MULTIPLICAND)
	sub c
	ld d, a
	ld a, [H_DIVISOR] ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld c, a
	ld a, [H_DIVIDEND] ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	sbc c
	jr c, .asm_37dce
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ld a, d
	ld [H_DIVIDEND+1], a ; (aliases: H_MULTIPLICAND)
	ld a, [H_DIVIDEBUFFER+4]
	inc a
	ld [H_DIVIDEBUFFER+4], a
	jr .asm_37db3
.asm_37dce
	ld a, b
	cp $1
	jr z, .asm_37e18
	ld a, [H_DIVIDEBUFFER+4]
	sla a
	ld [H_DIVIDEBUFFER+4], a
	ld a, [H_DIVIDEBUFFER+3]
	rl a
	ld [H_DIVIDEBUFFER+3], a
	ld a, [H_DIVIDEBUFFER+2]
	rl a
	ld [H_DIVIDEBUFFER+2], a
	ld a, [H_DIVIDEBUFFER+1]
	rl a
	ld [H_DIVIDEBUFFER+1], a
	dec e
	jr nz, .asm_37e04
	ld a, $8
	ld e, a
	ld a, [H_DIVIDEBUFFER]
	ld [H_DIVISOR], a ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	xor a
	ld [H_DIVIDEBUFFER], a
	ld a, [H_DIVIDEND+1] ; (aliases: H_MULTIPLICAND)
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ld a, [H_DIVIDEND+2]
	ld [H_DIVIDEND+1], a ; (aliases: H_MULTIPLICAND)
	ld a, [H_DIVIDEND+3]
	ld [H_DIVIDEND+2], a
.asm_37e04
	ld a, e
	cp $1
	jr nz, .asm_37e0a
	dec b
.asm_37e0a
	ld a, [H_DIVISOR] ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	srl a
	ld [H_DIVISOR], a ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld a, [H_DIVIDEBUFFER]
	rr a
	ld [H_DIVIDEBUFFER], a
	jr .asm_37db3
.asm_37e18
	ld a, [H_DIVIDEND+1] ; (aliases: H_MULTIPLICAND)
	ld [H_REMAINDER], a ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld a, [H_DIVIDEBUFFER+4]
	ld [H_QUOTIENT+3], a
	ld a, [H_DIVIDEBUFFER+3]
	ld [H_QUOTIENT+2], a
	ld a, [H_DIVIDEBUFFER+2]
	ld [H_QUOTIENT+1], a ; (aliases: H_MULTIPLICAND)
	ld a, [H_DIVIDEBUFFER+1]
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ret
