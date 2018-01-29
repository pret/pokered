CinnabarPokecenterObject:
	db $0 ; border block

	db $2 ; warps
	warp $3, $7, $3, $ff
	warp $4, $7, $3, $ff

	db $0 ; signs

	db $4 ; objects
	object SPRITE_NURSE, $3, $1, STAY, DOWN, $1 ; person
	object SPRITE_LASS, $9, $4, WALK, $0, $2 ; person
	object SPRITE_GENTLEMAN, $2, $6, STAY, NONE, $3 ; person
	object SPRITE_CABLE_CLUB_WOMAN, $b, $2, STAY, DOWN, $4 ; person

	; warp-to
	warp_to $3, $7, CINNABAR_POKECENTER_WIDTH
	warp_to $4, $7, CINNABAR_POKECENTER_WIDTH
