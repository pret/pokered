; calculates the level a mon should be based on its current exp
CalcLevelFromExperience::
	ld a, [wLoadedMonSpecies]
	ld [wCurSpecies], a
	call GetMonHeader
	ld d, $1 ; init level to 1
.loop
	inc d ; increment level
	call CalcExperience
	push hl
	ld hl, wLoadedMonExp + 2 ; current exp
; compare exp needed for level d with current exp
	ldh a, [hExperience + 2]
	ld c, a
	ld a, [hld]
	sub c
	ldh a, [hExperience + 1]
	ld c, a
	ld a, [hld]
	sbc c
	ldh a, [hExperience]
	ld c, a
	ld a, [hl]
	sbc c
	pop hl
	jr nc, .loop ; if exp needed for level d is not greater than exp, try the next level
	dec d ; since the exp was too high on the last loop iteration, go back to the previous value and return
	ret

; calculates the amount of experience needed for level d
CalcExperience::
	ld a, [wMonHGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRateTable
	add hl, bc
	call CalcDSquared
	ld a, d
	ldh [hMultiplier], a
	call Multiply
	ld a, [hl]
	and $f0
	swap a
	ldh [hMultiplier], a
	call Multiply
	ld a, [hli]
	and $f
	ldh [hDivisor], a
	ld b, $4
	call Divide
	ldh a, [hQuotient + 1]
	push af
	ldh a, [hQuotient + 2]
	push af
	ldh a, [hQuotient + 3]
	push af
	call CalcDSquared
	ld a, [hl]
	and $7f
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 1]
	push af
	ldh a, [hProduct + 2]
	push af
	ldh a, [hProduct + 3]
	push af
	ld a, [hli]
	push af
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, d
	ldh [hMultiplicand + 2], a
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
	ld b, [hl]
	ldh a, [hProduct + 3]
	sub b
	ldh [hProduct + 3], a
	ld b, $0
	ldh a, [hProduct + 2]
	sbc b
	ldh [hProduct + 2], a
	ldh a, [hProduct + 1]
	sbc b
	ldh [hProduct + 1], a
; The difference of the linear term and the constant term consists of 3 bytes
; starting at hProduct + 1. Below, hExperience (an alias of that address) will
; be used instead for the further work of adding or subtracting the squared
; term and adding the cubed term.
	pop af
	and $80
	jr nz, .subtractSquaredTerm ; check sign
	pop bc
	ldh a, [hExperience + 2]
	add b
	ldh [hExperience + 2], a
	pop bc
	ldh a, [hExperience + 1]
	adc b
	ldh [hExperience + 1], a
	pop bc
	ldh a, [hExperience]
	adc b
	ldh [hExperience], a
	jr .addCubedTerm
.subtractSquaredTerm
	pop bc
	ldh a, [hExperience + 2]
	sub b
	ldh [hExperience + 2], a
	pop bc
	ldh a, [hExperience + 1]
	sbc b
	ldh [hExperience + 1], a
	pop bc
	ldh a, [hExperience]
	sbc b
	ldh [hExperience], a
.addCubedTerm
	pop bc
	ldh a, [hExperience + 2]
	add b
	ldh [hExperience + 2], a
	pop bc
	ldh a, [hExperience + 1]
	adc b
	ldh [hExperience + 1], a
	pop bc
	ldh a, [hExperience]
	adc b
	ldh [hExperience], a
	ret

; calculates d*d
CalcDSquared:
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, d
	ldh [hMultiplicand + 2], a
	ldh [hMultiplier], a
	jp Multiply

INCLUDE "data/growth_rates.asm"
