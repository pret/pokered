IndigoPlateauLobbyObject: ; 0x19c95 (size=58)
	db $0 ; border block

	db $3 ; warps
	db $b, $7, $0, $ff
	db $b, $8, $1, $ff
	db $0, $8, $0, LORELEIS_ROOM

	db $0 ; signs

	db $5 ; people
	db SPRITE_NURSE, $5 + 4, $7 + 4, $ff, $d0, $1 ; person
	db SPRITE_GYM_HELPER, $9 + 4, $4 + 4, $ff, $d3, $2 ; person
	db SPRITE_LASS, $1 + 4, $5 + 4, $ff, $d0, $3 ; person
	db SPRITE_MART_GUY, $5 + 4, $0 + 4, $ff, $d3, $4 ; person
	db SPRITE_CABLE_CLUB_WOMAN, $6 + 4, $d + 4, $ff, $d0, $5 ; person

	; warp-to
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $b, $7
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $b, $8
	EVENT_DISP INDIGO_PLATEAU_LOBBY_WIDTH, $0, $8 ; LORELEIS_ROOM
