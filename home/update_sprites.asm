UpdateSprites::
	ld a, [wUpdateSpritesEnabled]
	dec a
	ret nz
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(_UpdateSprites)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call _UpdateSprites
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret
