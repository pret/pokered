FanClubObject: ; 0x59c97 (size=62)
	db $d ; border block

	db $2 ; warps
	db $7, $2, $1, $ff
	db $7, $3, $1, $ff

	db $2 ; signs
	db $0, $1, $7 ; FanClubText7
	db $0, $6, $8 ; FanClubText8

	db $6 ; objects
	object SPRITE_FISHER2, $6, $3, STAY, LEFT, $1 ; person
	object SPRITE_GIRL, $1, $3, STAY, RIGHT, $2 ; person
	object SPRITE_CLEFAIRY, $6, $4, STAY, LEFT, $3 ; person
	object SPRITE_SEEL, $1, $4, STAY, RIGHT, $4 ; person
	object SPRITE_GENTLEMAN, $3, $1, STAY, DOWN, $5 ; person
	object SPRITE_CABLE_CLUB_WOMAN, $5, $1, STAY, DOWN, $6 ; person

	; warp-to
	EVENT_DISP POKEMON_FAN_CLUB_WIDTH, $7, $2
	EVENT_DISP POKEMON_FAN_CLUB_WIDTH, $7, $3
