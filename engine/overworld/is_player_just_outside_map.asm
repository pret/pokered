; returns whether the player is one tile outside the map in Z
IsPlayerJustOutsideMap: ; 128d8 (4:68d8)
	ld a, [W_YCOORD]
	ld b, a
	ld a, [W_CURMAPHEIGHT]
	call .compareCoordWithMapDimension
	ret z
	ld a, [W_XCOORD]
	ld b, a
	ld a, [W_CURMAPWIDTH]
.compareCoordWithMapDimension
	add a
	cp b
	ret z
	inc b
	ret
