; calculates the level a mon should be based on its current exp
CalcLevelFromExperience: ; 58f43 (16:4f43)
	ld a, [wcf98]
	ld [wd0b5], a
	call GetMonHeader
	ld d, $1 ; init level to 1
.loop
	inc d ; increment level
	call CalcExperience
	push hl
	ld hl, wcfa8 ; current exp
; compare exp needed for level d with current exp
	ld a, [H_MULTIPLICAND + 2]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [H_MULTIPLICAND + 1]
	ld c, a
	ld a, [hld]
	sbc c
	ld a, [H_MULTIPLICAND]
	ld c, a
	ld a, [hl]
	sbc c
	pop hl
	jr nc, .loop ; if exp needed for level d is not greater than exp, try the next level
	dec d ; since the exp was too high on the last loop iteration, go back to the previous value and return
	ret

; calculates the amount of experience needed for level d
CalcExperience: ; 58f6a (16:4f6a)
	ld a, [W_MONHGROWTHRATE]
	add a
	add a
	ld c, a
	ld b, $0
	ld hl, GrowthRateTable
	add hl, bc
	call CalcDSquared
	ld a, d
	ld [H_MULTIPLIER], a ; $ff99
	call Multiply
	ld a, [hl]
	and $f0
	swap a
	ld [H_MULTIPLIER], a ; $ff99
	call Multiply
	ld a, [hli]
	and $f
	ld [H_DIVISOR], a ; $ff99
	ld b, $4
	call Divide
	ld a, [H_MULTIPLICAND] ; $ff96 (aliases: H_NUMTOPRINT)
	push af
	ld a, [H_MULTIPLICAND+1]
	push af
	ld a, [H_MULTIPLICAND+2]
	push af
	call CalcDSquared
	ld a, [hl]
	and $7f
	ld [H_MULTIPLIER], a ; $ff99
	call Multiply
	ld a, [H_MULTIPLICAND] ; $ff96 (aliases: H_NUMTOPRINT)
	push af
	ld a, [H_MULTIPLICAND+1]
	push af
	ld a, [H_MULTIPLICAND+2]
	push af
	ld a, [hli]
	push af
	xor a
	ld [H_MULTIPLICAND], a ; $ff96
	ld [H_MULTIPLICAND+1], a
	ld a, d
	ld [H_MULTIPLICAND+2], a
	ld a, [hli]
	ld [H_MULTIPLIER], a
	call Multiply
	ld b, [hl]
	ld a, [H_MULTIPLICAND+2]
	sub b
	ld [H_MULTIPLICAND+2], a
	ld b, $0
	ld a, [H_MULTIPLICAND+1]
	sbc b
	ld [H_MULTIPLICAND+1], a
	ld a, [H_MULTIPLICAND] ; $ff96
	sbc b
	ld [H_MULTIPLICAND], a ; $ff96
	pop af
	and $80
	jr nz, .subtractSquaredTerm ; check sign
	pop bc
	ld a, [H_MULTIPLICAND+2]
	add b
	ld [H_MULTIPLICAND+2], a
	pop bc
	ld a, [H_MULTIPLICAND+1]
	adc b
	ld [H_MULTIPLICAND+1], a
	pop bc
	ld a, [H_MULTIPLICAND]
	adc b
	ld [H_MULTIPLICAND], a
	jr .addCubedTerm
.subtractSquaredTerm
	pop bc
	ld a, [H_MULTIPLICAND+2]
	sub b
	ld [H_MULTIPLICAND+2], a
	pop bc
	ld a, [H_MULTIPLICAND+1]
	sbc b
	ld [H_MULTIPLICAND+1], a
	pop bc
	ld a, [H_MULTIPLICAND]
	sbc b
	ld [H_MULTIPLICAND], a
.addCubedTerm
	pop bc
	ld a, [H_MULTIPLICAND+2]
	add b
	ld [H_MULTIPLICAND+2], a
	pop bc
	ld a, [H_MULTIPLICAND+1]
	adc b
	ld [H_MULTIPLICAND+1], a
	pop bc
	ld a, [H_MULTIPLICAND]
	adc b
	ld [H_MULTIPLICAND], a
	ret

; calculates d*d
CalcDSquared: ; 59010 (16:5010)
	xor a
	ld [H_MULTIPLICAND], a ; $ff96 (aliases: H_NUMTOPRINT)
	ld [H_MULTIPLICAND+1], a
	ld a, d
	ld [H_MULTIPLICAND+2], a
	ld [H_MULTIPLIER], a ; $ff99 (aliases: H_DIVISOR, H_REMAINDER, H_POWEROFTEN)
	jp Multiply

; each entry has the following scheme:
; %AAAABBBB %SCCCCCCC %DDDDDDDD %EEEEEEEE
; resulting in
;  (a*n^3)/b + sign*c*n^2 + d*n - e
; where sign = -1 <=> S=1
GrowthRateTable: ; 5901d (16:501d)
	db $11,$00,$00,$00 ; medium fast      n^3
	db $34,$0A,$00,$1E ; (unused?)    3/4 n^3 + 10 n^2         - 30
	db $34,$14,$00,$46 ; (unused?)    3/4 n^3 + 20 n^2         - 70
	db $65,$8F,$64,$8C ; medium slow: 6/5 n^3 - 15 n^2 + 100 n - 140
	db $45,$00,$00,$00 ; fast:        4/5 n^3
	db $54,$00,$00,$00 ; slow:        5/4 n^3
