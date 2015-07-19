IndigoPlateauLobbyObject: ; 0x19c95 (size=58)
	db $0 ; border block

	db $3 ; warps
	db $b, $7, $0, $ff
	db $b, $8, $1, $ff
	db $0, $8, $0, LORELEIS_ROOM

	db $0 ; signs

	db $5 ; objects
	object SPRITE_NURSE, $7, $5, FACE, DOWN, $1 ; person
	object SPRITE_GYM_HELPER, $4, $9, FACE, LEFT, $2 ; person
	object SPRITE_LASS, $5, $1, FACE, DOWN, $3 ; person
	object SPRITE_MART_GUY, $0, $5, FACE, LEFT, $4 ; person
	object SPRITE_CABLE_CLUB_WOMAN, $d, $6, FACE, DOWN, $5 ; person

	; warp-to
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $b, $7
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $b, $8
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $0, $8 ; LORELEIS_ROOM
