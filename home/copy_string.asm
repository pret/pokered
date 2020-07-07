; copies a string from [de] to [wcf4b]
CopyStringToCF4B::
	ld hl, wcf4b
	; fall through

; copies a string from [de] to [hl]
CopyString::
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, CopyString
	ret
