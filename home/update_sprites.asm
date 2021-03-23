UpdateSprites::
	ld a, [wUpdateSpritesEnabled]
	dec a
	ret nz
	homecall _UpdateSprites
	ret
