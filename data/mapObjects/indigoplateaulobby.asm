IndigoPlateauLobbyObject:
	db $0 ; border block

	db $3 ; warps
	db $b, $7, $0, $ff
	db $b, $8, $1, $ff
	db $0, $8, $0, LORELEIS_ROOM

	db $0 ; signs

	db $5 ; objects
	object SPRITE_NURSE, $7, $5, STAY, DOWN, $1 ; person
	object SPRITE_GYM_HELPER, $4, $9, STAY, RIGHT, $2 ; person
	object SPRITE_LASS, $5, $1, STAY, DOWN, $3 ; person
	object SPRITE_MART_GUY, $0, $5, STAY, RIGHT, $4 ; person
	object SPRITE_CABLE_CLUB_WOMAN, $d, $6, STAY, DOWN, $5 ; person

	; warp-to
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $b, $7
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $b, $8
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $0, $8 ; LORELEIS_ROOM
