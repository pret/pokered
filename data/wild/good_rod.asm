; PureRGBnote: ADDED: there are now 2 encounter tables for good rod, one for ponds/lakes and one for the ocean.
; random choice of 4 good rod encounters
GoodRodMons:
	; level, species
	db 16, GOLDEEN
	db 16, POLIWAG
	db 16, MAGIKARP
	db 18, POLIWAG
	db -1, -1 ; end

GoodRodMonsOcean:
	; level, species
	db 16, HORSEA
	db 16, MAGIKARP
	db 16, SHELLDER
	db 16, TENTACOOL
	db -1, -1 ; end

; sets bit 1 and 2 of wTownMapAreaTypeFlags respectively if the pokemon in wd11e is included in either good rod mons list

CheckHasGoodRod:
	ld a, [wd11e]
	ld hl, wTownMapAreaTypeFlags
	push hl
	ld hl, GoodRodMons
	inc hl
	ld de, 2
	call IsInArray
	pop hl
	res BIT_HAS_GOOD_ROD_FRESH, [hl]
	jr nc, .noLakeMon
	set BIT_HAS_GOOD_ROD_FRESH, [hl]
.noLakeMon
	push hl
	ld a, [wd11e]
	ld hl, GoodRodMonsOcean
	inc hl
	ld de, 2
	call IsInArray
	pop hl
	res BIT_HAS_GOOD_ROD_SALT, [hl]
	ret nc
	set BIT_HAS_GOOD_ROD_SALT, [hl]
	ret