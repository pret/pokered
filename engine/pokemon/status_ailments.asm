PrintStatusAilment::
	ld a, [de]
	bit PSN, a
	jr nz, .psn
	bit BRN, a
	jr nz, .brn
	bit FRZ, a
	jr nz, .frz
	bit PAR, a
	jr nz, .par
	and SLP_MASK
	ret z
	ld a, "S"
	ld [hli], a
	ld a, "L"
	ld [hli], a
	ld [hl], "P"
	ret
.psn
	ld a, "P"
	ld [hli], a
	ld a, "S"
	ld [hli], a
	ld [hl], "N"
	ret
.brn
	ld a, "B"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld [hl], "N"
	ret
.frz
	ld a, "F"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld [hl], "Z"
	ret
.par
	ld a, "P"
	ld [hli], a
	ld a, "A"
	ld [hli], a
	ld [hl], "R"
	ret
