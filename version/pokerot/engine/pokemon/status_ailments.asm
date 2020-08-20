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
	and SLP
	ret z
	ld a, "S"
	ld [hli], a
	ld a, "L"
	ld [hli], a
	ld [hl], "F"
	ret
.psn
	ld a, "G"
	ld [hli], a
	ld a, "I"
	ld [hli], a
	ld [hl], "F"
	ret
.brn
	ld a, "B"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld [hl], "T"
	ret
.frz
	ld a, "G"
	ld [hli], a
	ld a, "F"
	ld [hli], a
	ld [hl], "R"
	ret
.par
	ld a, "P"
	ld [hli], a
	ld a, "A"
	ld [hli], a
	ld [hl], "R"
	ret
