UpdateSprites::
	ld a, [wUpdateSpritesEnabled]
	dec a
	ret nz
	ld hl, hSkipOAMUpdates
	set 0, [hl]
	homecall _UpdateSprites
	ld hl, hSkipOAMUpdates
	res 0, [hl] ; this prevents v-blank interference - PvK
	ret
