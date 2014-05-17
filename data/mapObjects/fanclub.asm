FanClubObject: ; 0x59c97 (size=62)
	db $d ; border block

	db $2 ; warps
	db $7, $2, $1, $ff
	db $7, $3, $1, $ff

	db $2 ; signs
	db $0, $1, $7 ; FanClubText7
	db $0, $6, $8 ; FanClubText8

	db $6 ; people
	db SPRITE_FISHER2, $3 + 4, $6 + 4, $ff, $d2, $1 ; person
	db SPRITE_GIRL, $3 + 4, $1 + 4, $ff, $d3, $2 ; person
	db SPRITE_CLEFAIRY, $4 + 4, $6 + 4, $ff, $d2, $3 ; person
	db SPRITE_SEEL, $4 + 4, $1 + 4, $ff, $d3, $4 ; person
	db SPRITE_GENTLEMAN, $1 + 4, $3 + 4, $ff, $d0, $5 ; person
	db SPRITE_CABLE_CLUB_WOMAN, $1 + 4, $5 + 4, $ff, $d0, $6 ; person

	; warp-to
	EVENT_DISP POKEMON_FAN_CLUB_WIDTH, $7, $2
	EVENT_DISP POKEMON_FAN_CLUB_WIDTH, $7, $3
