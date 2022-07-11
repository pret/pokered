_Multiply::
	ld a, $8
	ld b, a
	xor a
	ldh [hProduct], a
	ldh [hMultiplyBuffer], a
	ldh [hMultiplyBuffer+1], a
	ldh [hMultiplyBuffer+2], a
	ldh [hMultiplyBuffer+3], a
.loop
	ldh a, [hMultiplier]
	srl a
	ldh [hMultiplier], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	jr nc, .smallMultiplier
	ldh a, [hMultiplyBuffer+3]
	ld c, a
	ldh a, [hMultiplicand+2]
	add c
	ldh [hMultiplyBuffer+3], a
	ldh a, [hMultiplyBuffer+2]
	ld c, a
	ldh a, [hMultiplicand+1]
	adc c
	ldh [hMultiplyBuffer+2], a
	ldh a, [hMultiplyBuffer+1]
	ld c, a
	ldh a, [hMultiplicand] ; (aliases: hMultiplicand)
	adc c
	ldh [hMultiplyBuffer+1], a
	ldh a, [hMultiplyBuffer]
	ld c, a
	ldh a, [hProduct] ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	adc c
	ldh [hMultiplyBuffer], a
.smallMultiplier
	dec b
	jr z, .done
	ldh a, [hMultiplicand+2]
	sla a
	ldh [hMultiplicand+2], a
	ldh a, [hMultiplicand+1]
	rl a
	ldh [hMultiplicand+1], a
	ldh a, [hMultiplicand]
	rl a
	ldh [hMultiplicand], a
	ldh a, [hProduct]
	rl a
	ldh [hProduct], a
	jr .loop
.done
	ldh a, [hMultiplyBuffer+3]
	ldh [hProduct+3], a
	ldh a, [hMultiplyBuffer+2]
	ldh [hProduct+2], a
	ldh a, [hMultiplyBuffer+1]
	ldh [hProduct+1], a
	ldh a, [hMultiplyBuffer]
	ldh [hProduct], a
	ret

_Divide::
	xor a
	ldh [hDivideBuffer], a
	ldh [hDivideBuffer+1], a
	ldh [hDivideBuffer+2], a
	ldh [hDivideBuffer+3], a
	ldh [hDivideBuffer+4], a
	ld a, $9
	ld e, a
.loop
	ldh a, [hDivideBuffer]
	ld c, a
	ldh a, [hDividend+1] ; (aliases: hMultiplicand)
	sub c
	ld d, a
	ldh a, [hDivisor] ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ld c, a
	ldh a, [hDividend] ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	sbc c
	jr c, .next
	ldh [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ld a, d
	ldh [hDividend+1], a ; (aliases: hMultiplicand)
	ldh a, [hDivideBuffer+4]
	inc a
	ldh [hDivideBuffer+4], a
	jr .loop
.next
	ld a, b
	cp $1
	jr z, .done
	ldh a, [hDivideBuffer+4]
	sla a
	ldh [hDivideBuffer+4], a
	ldh a, [hDivideBuffer+3]
	rl a
	ldh [hDivideBuffer+3], a
	ldh a, [hDivideBuffer+2]
	rl a
	ldh [hDivideBuffer+2], a
	ldh a, [hDivideBuffer+1]
	rl a
	ldh [hDivideBuffer+1], a
	dec e
	jr nz, .next2
	ld a, $8
	ld e, a
	ldh a, [hDivideBuffer]
	ldh [hDivisor], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	xor a
	ldh [hDivideBuffer], a
	ldh a, [hDividend+1] ; (aliases: hMultiplicand)
	ldh [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ldh a, [hDividend+2]
	ldh [hDividend+1], a ; (aliases: hMultiplicand)
	ldh a, [hDividend+3]
	ldh [hDividend+2], a
.next2
	ld a, e
	cp $1
	jr nz, .okay
	dec b
.okay
	ldh a, [hDivisor] ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	srl a
	ldh [hDivisor], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ldh a, [hDivideBuffer]
	rr a
	ldh [hDivideBuffer], a
	jr .loop
.done
	ldh a, [hDividend+1] ; (aliases: hMultiplicand)
	ldh [hRemainder], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ldh a, [hDivideBuffer+4]
	ldh [hQuotient+3], a
	ldh a, [hDivideBuffer+3]
	ldh [hQuotient+2], a
	ldh a, [hDivideBuffer+2]
	ldh [hQuotient+1], a ; (aliases: hMultiplicand)
	ldh a, [hDivideBuffer+1]
	ldh [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ret
