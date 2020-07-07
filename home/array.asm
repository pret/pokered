; skips a text entries, each of size NAME_LENGTH (like trainer name, OT name, rival name, ...)
; hl: base pointer, will be incremented by NAME_LENGTH * a
SkipFixedLengthTextEntries::
	and a
	ret z
	ld bc, NAME_LENGTH
.skipLoop
	add hl, bc
	dec a
	jr nz, .skipLoop
	ret

AddNTimes::
; add bc to hl a times
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
