; Compare strings, c bytes in length, at de and hl.
; Often used to compare big endian numbers in battle calculations.
StringCmp::
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, StringCmp
	ret
