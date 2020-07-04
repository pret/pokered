_Multiply::
	ld a, $8
	ld b, a
	xor a
	ld [hProduct], a
	ld [hMultiplyBuffer], a
	ld [hMultiplyBuffer+1], a
	ld [hMultiplyBuffer+2], a
	ld [hMultiplyBuffer+3], a
.loop
	ld a, [hMultiplier]
	srl a
	ld [hMultiplier], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	jr nc, .smallMultiplier
	ld a, [hMultiplyBuffer+3]
	ld c, a
	ld a, [hMultiplicand+2]
	add c
	ld [hMultiplyBuffer+3], a
	ld a, [hMultiplyBuffer+2]
	ld c, a
	ld a, [hMultiplicand+1]
	adc c
	ld [hMultiplyBuffer+2], a
	ld a, [hMultiplyBuffer+1]
	ld c, a
	ld a, [hMultiplicand] ; (aliases: hMultiplicand)
	adc c
	ld [hMultiplyBuffer+1], a
	ld a, [hMultiplyBuffer]
	ld c, a
	ld a, [hProduct] ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	adc c
	ld [hMultiplyBuffer], a
.smallMultiplier
	dec b
	jr z, .done
	ld a, [hMultiplicand+2]
	sla a
	ld [hMultiplicand+2], a
	ld a, [hMultiplicand+1]
	rl a
	ld [hMultiplicand+1], a
	ld a, [hMultiplicand]
	rl a
	ld [hMultiplicand], a
	ld a, [hProduct]
	rl a
	ld [hProduct], a
	jr .loop
.done
	ld a, [hMultiplyBuffer+3]
	ld [hProduct+3], a
	ld a, [hMultiplyBuffer+2]
	ld [hProduct+2], a
	ld a, [hMultiplyBuffer+1]
	ld [hProduct+1], a
	ld a, [hMultiplyBuffer]
	ld [hProduct], a
	ret

_Divide::
	xor a
	ld [hDivideBuffer], a
	ld [hDivideBuffer+1], a
	ld [hDivideBuffer+2], a
	ld [hDivideBuffer+3], a
	ld [hDivideBuffer+4], a
	ld a, $9
	ld e, a
.asm_37db3
	ld a, [hDivideBuffer]
	ld c, a
	ld a, [hDividend+1] ; (aliases: hMultiplicand)
	sub c
	ld d, a
	ld a, [hDivisor] ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ld c, a
	ld a, [hDividend] ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	sbc c
	jr c, .asm_37dce
	ld [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ld a, d
	ld [hDividend+1], a ; (aliases: hMultiplicand)
	ld a, [hDivideBuffer+4]
	inc a
	ld [hDivideBuffer+4], a
	jr .asm_37db3
.asm_37dce
	ld a, b
	cp $1
	jr z, .asm_37e18
	ld a, [hDivideBuffer+4]
	sla a
	ld [hDivideBuffer+4], a
	ld a, [hDivideBuffer+3]
	rl a
	ld [hDivideBuffer+3], a
	ld a, [hDivideBuffer+2]
	rl a
	ld [hDivideBuffer+2], a
	ld a, [hDivideBuffer+1]
	rl a
	ld [hDivideBuffer+1], a
	dec e
	jr nz, .asm_37e04
	ld a, $8
	ld e, a
	ld a, [hDivideBuffer]
	ld [hDivisor], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	xor a
	ld [hDivideBuffer], a
	ld a, [hDividend+1] ; (aliases: hMultiplicand)
	ld [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ld a, [hDividend+2]
	ld [hDividend+1], a ; (aliases: hMultiplicand)
	ld a, [hDividend+3]
	ld [hDividend+2], a
.asm_37e04
	ld a, e
	cp $1
	jr nz, .asm_37e0a
	dec b
.asm_37e0a
	ld a, [hDivisor] ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	srl a
	ld [hDivisor], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ld a, [hDivideBuffer]
	rr a
	ld [hDivideBuffer], a
	jr .asm_37db3
.asm_37e18
	ld a, [hDividend+1] ; (aliases: hMultiplicand)
	ld [hRemainder], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ld a, [hDivideBuffer+4]
	ld [hQuotient+3], a
	ld a, [hDivideBuffer+3]
	ld [hQuotient+2], a
	ld a, [hDivideBuffer+2]
	ld [hQuotient+1], a ; (aliases: hMultiplicand)
	ld a, [hDivideBuffer+1]
	ld [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ret
