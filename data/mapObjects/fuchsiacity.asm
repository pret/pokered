FuchsiaCityObject: ; 0x18bd4 (size=178)
	db $f ; border block

	db $9 ; warps
	db $d, $5, $0, FUCHSIA_MART
	db $1b, $b, $0, FUCHSIA_HOUSE_1
	db $1b, $13, $0, FUCHSIA_POKECENTER
	db $1b, $1b, $0, FUCHSIA_HOUSE_2
	db $3, $12, $0, SAFARI_ZONE_ENTRANCE
	db $1b, $5, $0, FUCHSIA_GYM
	db $d, $16, $0, FUCHSIA_MEETING_ROOM
	db $1b, $1f, $1, FUCHSIA_HOUSE_3
	db $18, $1f, $0, FUCHSIA_HOUSE_3

	db $e ; signs
	db $17, $f, $b ; FuchsiaCityText11
	db $f, $19, $c ; FuchsiaCityText12
	db $5, $11, $d ; FuchsiaCityText13
	db $d, $6, $e ; MartSignText
	db $1b, $14, $f ; PokeCenterSignText
	db $1d, $1b, $10 ; FuchsiaCityText16
	db $f, $15, $11 ; FuchsiaCityText17
	db $1d, $5, $12 ; FuchsiaCityText18
	db $7, $21, $13 ; FuchsiaCityText19
	db $7, $1b, $14 ; FuchsiaCityText20
	db $7, $d, $15 ; FuchsiaCityText21
	db $d, $1f, $16 ; FuchsiaCityText22
	db $f, $d, $17 ; FuchsiaCityText23
	db $7, $7, $18 ; FuchsiaCityText24

	db $a ; people
	db SPRITE_BUG_CATCHER, $c + 4, $a + 4, $fe, $2, $1 ; person
	db SPRITE_GAMBLER, $11 + 4, $1c + 4, $fe, $2, $2 ; person
	db SPRITE_FISHER2, $e + 4, $1e + 4, $ff, $d0, $3 ; person
	db SPRITE_BUG_CATCHER, $8 + 4, $18 + 4, $ff, $d1, $4 ; person
	db SPRITE_CLEFAIRY, $5 + 4, $1f + 4, $fe, $0, $5 ; person
	db SPRITE_BALL, $6 + 4, $19 + 4, $ff, $ff, $6 ; person
	db SPRITE_SLOWBRO, $6 + 4, $c + 4, $fe, $2, $7 ; person
	db SPRITE_SLOWBRO, $c + 4, $1e + 4, $fe, $2, $8 ; person
	db SPRITE_SEEL, $11 + 4, $8 + 4, $fe, $0, $9 ; person
	db SPRITE_OMANYTE, $5 + 4, $6 + 4, $ff, $ff, $a ; person

	; warp-to
	EVENT_DISP FUCHSIA_CITY_WIDTH, $d, $5 ; FUCHSIA_MART
	EVENT_DISP FUCHSIA_CITY_WIDTH, $1b, $b ; FUCHSIA_HOUSE_1
	EVENT_DISP FUCHSIA_CITY_WIDTH, $1b, $13 ; FUCHSIA_POKECENTER
	EVENT_DISP FUCHSIA_CITY_WIDTH, $1b, $1b ; FUCHSIA_HOUSE_2
	EVENT_DISP FUCHSIA_CITY_WIDTH, $3, $12 ; SAFARI_ZONE_ENTRANCE
	EVENT_DISP FUCHSIA_CITY_WIDTH, $1b, $5 ; FUCHSIA_GYM
	EVENT_DISP FUCHSIA_CITY_WIDTH, $d, $16 ; FUCHSIA_MEETING_ROOM
	EVENT_DISP FUCHSIA_CITY_WIDTH, $1b, $1f ; FUCHSIA_HOUSE_3
	EVENT_DISP FUCHSIA_CITY_WIDTH, $18, $1f ; FUCHSIA_HOUSE_3
