CeruleanCityObject: ; 0x18786 (size=170)
	db $f ; border block

	db $a ; warps
	db $b, $1b, $0, TRASHED_HOUSE
	db $f, $d, $0, CERULEAN_HOUSE
	db $11, $13, $0, CERULEAN_POKECENTER
	db $13, $1e, $0, CERULEAN_GYM
	db $19, $d, $0, BIKE_SHOP
	db $19, $19, $0, CERULEAN_MART
	db $b, $4, $0, UNKNOWN_DUNGEON_1
	db $9, $1b, $2, TRASHED_HOUSE
	db $b, $9, $1, CERULEAN_HOUSE_3
	db $9, $9, $0, CERULEAN_HOUSE_3

	db $6 ; signs
	db $13, $17, $c ; CeruleanCityText12
	db $1d, $11, $d ; CeruleanCityText13
	db $19, $1a, $e ; MartSignText
	db $11, $14, $f ; PokeCenterSignText
	db $19, $b, $10 ; CeruleanCityText16
	db $15, $1b, $11 ; CeruleanCityText17

	db $b ; people
	db SPRITE_BLUE, $2 + 4, $14 + 4, $ff, $d0, $1 ; person
	db SPRITE_ROCKET, $8 + 4, $1e + 4, $ff, $ff, TRAINER | $2, ROCKET + $C8, $5
	db SPRITE_BLACK_HAIR_BOY_1, $14 + 4, $1f + 4, $ff, $d0, $3 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $12 + 4, $f + 4, $fe, $1, $4 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $15 + 4, $9 + 4, $fe, $2, $5 ; person
	db SPRITE_GUARD, $c + 4, $1c + 4, $ff, $d0, $6 ; person
	db SPRITE_LASS, $1a + 4, $1d + 4, $ff, $d2, $7 ; person
	db SPRITE_SLOWBRO, $1a + 4, $1c + 4, $ff, $d0, $8 ; person
	db SPRITE_LASS, $1b + 4, $9 + 4, $fe, $2, $9 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $c + 4, $4 + 4, $ff, $d0, $a ; person
	db SPRITE_GUARD, $c + 4, $1b + 4, $ff, $d0, $b ; person

	; warp-to
	EVENT_DISP CERULEAN_CITY_WIDTH, $b, $1b ; TRASHED_HOUSE
	EVENT_DISP CERULEAN_CITY_WIDTH, $f, $d ; CERULEAN_HOUSE
	EVENT_DISP CERULEAN_CITY_WIDTH, $11, $13 ; CERULEAN_POKECENTER
	EVENT_DISP CERULEAN_CITY_WIDTH, $13, $1e ; CERULEAN_GYM
	EVENT_DISP CERULEAN_CITY_WIDTH, $19, $d ; BIKE_SHOP
	EVENT_DISP CERULEAN_CITY_WIDTH, $19, $19 ; CERULEAN_MART
	EVENT_DISP CERULEAN_CITY_WIDTH, $b, $4 ; UNKNOWN_DUNGEON_1
	EVENT_DISP CERULEAN_CITY_WIDTH, $9, $1b ; TRASHED_HOUSE
	EVENT_DISP CERULEAN_CITY_WIDTH, $b, $9 ; CERULEAN_HOUSE_3
	EVENT_DISP CERULEAN_CITY_WIDTH, $9, $9 ; CERULEAN_HOUSE_3
