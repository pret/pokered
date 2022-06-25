UpdateSprites::
	ld a, [wUpdateSpritesEnabled]
	dec a
	ret nz
	ld hl, hFlagsFFFA
	set 0, [hl]	;joenote - do not allow OAM updates  in vblank while updating sprites
	homecall _UpdateSprites
	ld hl, hFlagsFFFA
	res 0, [hl];joenote - allow OAM updates again
	ret
