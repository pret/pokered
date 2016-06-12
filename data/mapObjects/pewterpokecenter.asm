PewterPokecenterObject:
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $6, $ff
	db $7, $4, $6, $ff

	db $0 ; signs

	db $4 ; objects
	object SPRITE_NURSE, $3, $1, STAY, DOWN, $1 ; person
	object SPRITE_GENTLEMAN, $b, $7, STAY, LEFT, $2 ; person
	object SPRITE_CLEFAIRY, $1, $3, STAY, DOWN, $3 ; person
	object SPRITE_CABLE_CLUB_WOMAN, $b, $2, STAY, DOWN, $4 ; person

	; warp-to
	EVENT_DISP PEWTER_POKECENTER_WIDTH, $7, $3
	EVENT_DISP PEWTER_POKECENTER_WIDTH, $7, $4
