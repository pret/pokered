CeruleanCityObject:
	db $f ; border block

	db $a ; warps
	db $b, $1b, $0, TRASHED_HOUSE
	db $f, $d, $0, CERULEAN_HOUSE_1
	db $11, $13, $0, CERULEAN_POKECENTER
	db $13, $1e, $0, CERULEAN_GYM
	db $19, $d, $0, BIKE_SHOP
	db $19, $19, $0, CERULEAN_MART
	db $b, $4, $0, UNKNOWN_DUNGEON_1
	db $9, $1b, $2, TRASHED_HOUSE
	db $b, $9, $1, CERULEAN_HOUSE_2
	db $9, $9, $0, CERULEAN_HOUSE_2

	db $6 ; signs
	db $13, $17, $c ; CeruleanCityText12
	db $1d, $11, $d ; CeruleanCityText13
	db $19, $1a, $e ; MartSignText
	db $11, $14, $f ; PokeCenterSignText
	db $19, $b, $10 ; CeruleanCityText16
	db $15, $1b, $11 ; CeruleanCityText17

	db $b ; objects
	object SPRITE_BLUE, $14, $2, STAY, DOWN, $1 ; person
	object SPRITE_ROCKET, $1e, $8, STAY, NONE, $2, OPP_ROCKET, $5
	object SPRITE_BLACK_HAIR_BOY_1, $1f, $14, STAY, DOWN, $3 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $f, $12, WALK, $1, $4 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $9, $15, WALK, $2, $5 ; person
	object SPRITE_GUARD, $1c, $c, STAY, DOWN, $6 ; person
	object SPRITE_LASS, $1d, $1a, STAY, LEFT, $7 ; person
	object SPRITE_SLOWBRO, $1c, $1a, STAY, DOWN, $8 ; person
	object SPRITE_LASS, $9, $1b, WALK, $2, $9 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $4, $c, STAY, DOWN, $a ; person
	object SPRITE_GUARD, $1b, $c, STAY, DOWN, $b ; person

	; warp-to
	EVENT_DISP CERULEAN_CITY_WIDTH, $b, $1b ; TRASHED_HOUSE
	EVENT_DISP CERULEAN_CITY_WIDTH, $f, $d ; CERULEAN_HOUSE_1
	EVENT_DISP CERULEAN_CITY_WIDTH, $11, $13 ; CERULEAN_POKECENTER
	EVENT_DISP CERULEAN_CITY_WIDTH, $13, $1e ; CERULEAN_GYM
	EVENT_DISP CERULEAN_CITY_WIDTH, $19, $d ; BIKE_SHOP
	EVENT_DISP CERULEAN_CITY_WIDTH, $19, $19 ; CERULEAN_MART
	EVENT_DISP CERULEAN_CITY_WIDTH, $b, $4 ; UNKNOWN_DUNGEON_1
	EVENT_DISP CERULEAN_CITY_WIDTH, $9, $1b ; TRASHED_HOUSE
	EVENT_DISP CERULEAN_CITY_WIDTH, $b, $9 ; CERULEAN_HOUSE_2
	EVENT_DISP CERULEAN_CITY_WIDTH, $9, $9 ; CERULEAN_HOUSE_2
