CinnabarPokecenterObject:
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $3, $ff
	db $7, $4, $3, $ff

	db $0 ; signs

	db $4 ; objects
	object SPRITE_NURSE, $3, $1, STAY, DOWN, $1 ; person
	object SPRITE_LASS, $9, $4, WALK, $0, $2 ; person
	object SPRITE_GENTLEMAN, $2, $6, STAY, NONE, $3 ; person
	object SPRITE_CABLE_CLUB_WOMAN, $b, $2, STAY, DOWN, $4 ; person

	; warp-to
	EVENT_DISP CINNABAR_POKECENTER_WIDTH, $7, $3
	EVENT_DISP CINNABAR_POKECENTER_WIDTH, $7, $4
