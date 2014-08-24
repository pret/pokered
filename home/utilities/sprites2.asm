UpdateSprites:: ; 2429 (0:2429)
	ld a, [wcfcb]
	dec a
	ret nz
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, Bank(_UpdateSprites)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	call _UpdateSprites
	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret