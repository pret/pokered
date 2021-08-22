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
	ld a, "D"
	ld [hli], a
	ld a, "O"
	ld [hli], a
	ld [hl], "R"
	ret
.psn
	ld a, "E"
	ld [hli], a
	ld a, "N"
	ld [hli], a
	ld [hl], "V"
	ret
.brn
	ld a, "Q"
	ld [hli], a
	ld a, "U"
	ld [hli], a
	ld [hl], "E"
	ret
.frz
	ld a, "C"
	ld [hli], a
	ld a, "O"
	ld [hli], a
	ld [hl], "N"
	ret
.par
	ld a, "P"
	ld [hli], a
	ld a, "A"
	ld [hli], a
	ld [hl], "R"
	ret
