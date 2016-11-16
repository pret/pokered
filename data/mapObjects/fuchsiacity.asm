FuchsiaCityObject:
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

	db $a ; objects
	object SPRITE_BUG_CATCHER, $a, $c, WALK, $2, $1 ; person
	object SPRITE_GAMBLER, $1c, $11, WALK, $2, $2 ; person
	object SPRITE_FISHER2, $1e, $e, STAY, DOWN, $3 ; person
	object SPRITE_BUG_CATCHER, $18, $8, STAY, UP, $4 ; person
	object SPRITE_CLEFAIRY, $1f, $5, WALK, $0, $5 ; person
	object SPRITE_BALL, $19, $6, STAY, NONE, $6 ; person
	object SPRITE_SLOWBRO, $c, $6, WALK, $2, $7 ; person
	object SPRITE_SLOWBRO, $1e, $c, WALK, $2, $8 ; person
	object SPRITE_SEEL, $8, $11, WALK, $0, $9 ; person
	object SPRITE_OMANYTE, $6, $5, STAY, NONE, $a ; person

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
