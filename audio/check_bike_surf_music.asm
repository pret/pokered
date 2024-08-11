CheckForBikeSurfMusic::
	ld a, [wWalkBikeSurfState]
	dec a
	jr z, .biking
	dec a
	ld e, MUSIC_SURFING
	jr z, .otherMusic
	jr .walking
.biking
	ld e, MUSIC_BIKE_RIDING
;;;;;;;;;; PureRGBnote: ADDED: bike music can be disabled via options.
	ld a, [wOptions2]
	bit BIT_BIKE_MUSIC, a
	jr z, .otherMusic ; jump if bike music is enabled
	; else only play bike music if in cycling road
	ld a, [wd732] ; forcibly riding bike (cycling road)
	bit 5, a
	jr z, .walking
.otherMusic
;;;;;;;;;;
	and a
	ret
.walking
	scf
	ret