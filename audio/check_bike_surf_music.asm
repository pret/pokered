; PureRGBnote: MOVED: moved out of home bank since the logic for choosing which song to play was made a bit more complicated
CheckForBikeSurfMusic::
	ld a, [wWalkBikeSurfState]
	dec a
	jr z, .biking
	dec a
	ld e, MUSIC_SURFING
	jr z, .surfing
	jr .walking
.biking
	ld e, MUSIC_BIKE_RIDING
;;;;;;;;;; PureRGBnote: ADDED: bike music can be disabled via options.
	ld a, [wOptions2]
	bit BIT_BIKE_MUSIC, a
	jr z, .otherMusic ; jump if bike music is enabled
	; else only play bike music if in cycling road
	ld a, [wStatusFlags6] ; forcibly riding bike (cycling road)
	bit BIT_ALWAYS_ON_BIKE, a
	jr z, .walking
.otherMusic
;;;;;;;;;;
	and a
	ret
.walking
	scf
	ret
.surfing
	; no surfing music in the volcano when lava surfing
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .walking
	jr .otherMusic