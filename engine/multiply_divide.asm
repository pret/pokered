_Multiply: ; 37d41 (d:7d41)
	ld a, $8
	ld b, a
	xor a
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ld [$ff9b], a
	ld [H_SAVEDNUMTOPRINT], a
	ld [$ff9d], a
	ld [$ff9e], a
.asm_37d4f
	ld a, [H_REMAINDER] ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	srl a
	ld [H_REMAINDER], a ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	jr nc, .asm_37d77
	ld a, [$ff9e]
	ld c, a
	ld a, [$ff98]
	add c
	ld [$ff9e], a
	ld a, [$ff9d]
	ld c, a
	ld a, [$ff97]
	adc c
	ld [$ff9d], a
	ld a, [H_SAVEDNUMTOPRINT]
	ld c, a
	ld a, [H_NUMTOPRINT] ; (aliases: H_MULTIPLICAND)
	adc c
	ld [H_SAVEDNUMTOPRINT], a
	ld a, [$ff9b]
	ld c, a
	ld a, [H_DIVIDEND] ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	adc c
	ld [$ff9b], a
.asm_37d77
	dec b
	jr z, .asm_37d94
	ld a, [$ff98]
	sla a
	ld [$ff98], a
	ld a, [$ff97]
	rl a
	ld [$ff97], a
	ld a, [H_NUMTOPRINT] ; (aliases: H_MULTIPLICAND)
	rl a
	ld [H_NUMTOPRINT], a ; (aliases: H_MULTIPLICAND)
	ld a, [H_DIVIDEND] ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	rl a
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	jr .asm_37d4f
.asm_37d94
	ld a, [$ff9e]
	ld [$ff98], a
	ld a, [$ff9d]
	ld [$ff97], a
	ld a, [H_SAVEDNUMTOPRINT]
	ld [H_NUMTOPRINT], a ; (aliases: H_MULTIPLICAND)
	ld a, [$ff9b]
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ret

_Divide: ; 37da5 (d:7da5)
	xor a
	ld [$ff9a], a
	ld [$ff9b], a
	ld [H_SAVEDNUMTOPRINT], a
	ld [$ff9d], a
	ld [$ff9e], a
	ld a, $9
	ld e, a
.asm_37db3
	ld a, [$ff9a]
	ld c, a
	ld a, [H_NUMTOPRINT] ; (aliases: H_MULTIPLICAND)
	sub c
	ld d, a
	ld a, [H_REMAINDER] ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld c, a
	ld a, [H_DIVIDEND] ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	sbc c
	jr c, .asm_37dce
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ld a, d
	ld [H_NUMTOPRINT], a ; (aliases: H_MULTIPLICAND)
	ld a, [$ff9e]
	inc a
	ld [$ff9e], a
	jr .asm_37db3
.asm_37dce
	ld a, b
	cp $1
	jr z, .asm_37e18
	ld a, [$ff9e]
	sla a
	ld [$ff9e], a
	ld a, [$ff9d]
	rl a
	ld [$ff9d], a
	ld a, [H_SAVEDNUMTOPRINT]
	rl a
	ld [H_SAVEDNUMTOPRINT], a
	ld a, [$ff9b]
	rl a
	ld [$ff9b], a
	dec e
	jr nz, .asm_37e04
	ld a, $8
	ld e, a
	ld a, [$ff9a]
	ld [H_REMAINDER], a ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	xor a
	ld [$ff9a], a
	ld a, [H_NUMTOPRINT] ; (aliases: H_MULTIPLICAND)
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ld a, [$ff97]
	ld [H_NUMTOPRINT], a ; (aliases: H_MULTIPLICAND)
	ld a, [$ff98]
	ld [$ff97], a
.asm_37e04
	ld a, e
	cp $1
	jr nz, .asm_37e0a
	dec b
.asm_37e0a
	ld a, [H_REMAINDER] ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	srl a
	ld [H_REMAINDER], a ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld a, [$ff9a]
	rr a
	ld [$ff9a], a
	jr .asm_37db3
.asm_37e18
	ld a, [H_NUMTOPRINT] ; (aliases: H_MULTIPLICAND)
	ld [H_REMAINDER], a ; (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld a, [$ff9e]
	ld [$ff98], a
	ld a, [$ff9d]
	ld [$ff97], a
	ld a, [H_SAVEDNUMTOPRINT]
	ld [H_NUMTOPRINT], a ; (aliases: H_MULTIPLICAND)
	ld a, [$ff9b]
	ld [H_DIVIDEND], a ; (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	ret
