; calculates the level a mon should be based on its current exp
CalcLevelFromExperience::
	ld a, [wLoadedMonSpecies]
	ld [wd0b5], a
	call GetMonHeader
	ld d, $1 ; init level to 1
.loop
	inc d ; increment level
	call CalcExperience
	push hl
	ld hl, wLoadedMonExp + 2 ; current exp
; compare exp needed for level d with current exp
	ld a, [hExperience + 2]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [hExperience + 1]
	ld c, a
	ld a, [hld]
	sbc c
	ld a, [hExperience]
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
	ld [hMultiplier], a
	call Multiply
	ld a, [hl]
	and $f0
	swap a
	ld [hMultiplier], a
	call Multiply
	ld a, [hli]
	and $f
	ld [hDivisor], a
	ld b, $4
	call Divide
	ld a, [hQuotient + 1]
	push af
	ld a, [hQuotient + 2]
	push af
	ld a, [hQuotient + 3]
	push af
	call CalcDSquared
	ld a, [hl]
	and $7f
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 1]
	push af
	ld a, [hProduct + 2]
	push af
	ld a, [hProduct + 3]
	push af
	ld a, [hli]
	push af
	xor a
	ld [hMultiplicand], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld a, [hli]
	ld [hMultiplier], a
	call Multiply
	ld b, [hl]
	ld a, [hProduct + 3]
	sub b
	ld [hProduct + 3], a
	ld b, $0
	ld a, [hProduct + 2]
	sbc b
	ld [hProduct + 2], a
	ld a, [hProduct + 1]
	sbc b
	ld [hProduct + 1], a
; The difference of the linear term and the constant term consists of 3 bytes
; starting at hProduct + 1. Below, hExperience (an alias of that address) will
; be used instead for the further work of adding or subtracting the squared
; term and adding the cubed term.
	pop af
	and $80
	jr nz, .subtractSquaredTerm ; check sign
	pop bc
	ld a, [hExperience + 2]
	add b
	ld [hExperience + 2], a
	pop bc
	ld a, [hExperience + 1]
	adc b
	ld [hExperience + 1], a
	pop bc
	ld a, [hExperience]
	adc b
	ld [hExperience], a
	jr .addCubedTerm
.subtractSquaredTerm
	pop bc
	ld a, [hExperience + 2]
	sub b
	ld [hExperience + 2], a
	pop bc
	ld a, [hExperience + 1]
	sbc b
	ld [hExperience + 1], a
	pop bc
	ld a, [hExperience]
	sbc b
	ld [hExperience], a
.addCubedTerm
	pop bc
	ld a, [hExperience + 2]
	add b
	ld [hExperience + 2], a
	pop bc
	ld a, [hExperience + 1]
	adc b
	ld [hExperience + 1], a
	pop bc
	ld a, [hExperience]
	adc b
	ld [hExperience], a
	ret

; calculates d*d
CalcDSquared:
	xor a
	ld [hMultiplicand], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld [hMultiplier], a
	jp Multiply

INCLUDE "data/growth_rates.asm"
