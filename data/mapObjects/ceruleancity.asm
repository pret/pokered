CeruleanCityObject:
	db $f ; border block

	db $a ; warps
	warp $1b, $b, $0, TRASHED_HOUSE
	warp $d, $f, $0, CERULEAN_HOUSE_1
	warp $13, $11, $0, CERULEAN_POKECENTER
	warp $1e, $13, $0, CERULEAN_GYM
	warp $d, $19, $0, BIKE_SHOP
	warp $19, $19, $0, CERULEAN_MART
	warp $4, $b, $0, UNKNOWN_DUNGEON_1
	warp $1b, $9, $2, TRASHED_HOUSE
	warp $9, $b, $1, CERULEAN_HOUSE_2
	warp $9, $9, $0, CERULEAN_HOUSE_2

	db $6 ; signs
	sign $17, $13, $c ; CeruleanCityText12
	sign $11, $1d, $d ; CeruleanCityText13
	sign $1a, $19, $e ; MartSignText
	sign $14, $11, $f ; PokeCenterSignText
	sign $b, $19, $10 ; CeruleanCityText16
	sign $1b, $15, $11 ; CeruleanCityText17

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
	warp_to $1b, $b, CERULEAN_CITY_WIDTH ; TRASHED_HOUSE
	warp_to $d, $f, CERULEAN_CITY_WIDTH ; CERULEAN_HOUSE_1
	warp_to $13, $11, CERULEAN_CITY_WIDTH ; CERULEAN_POKECENTER
	warp_to $1e, $13, CERULEAN_CITY_WIDTH ; CERULEAN_GYM
	warp_to $d, $19, CERULEAN_CITY_WIDTH ; BIKE_SHOP
	warp_to $19, $19, CERULEAN_CITY_WIDTH ; CERULEAN_MART
	warp_to $4, $b, CERULEAN_CITY_WIDTH ; UNKNOWN_DUNGEON_1
	warp_to $1b, $9, CERULEAN_CITY_WIDTH ; TRASHED_HOUSE
	warp_to $9, $b, CERULEAN_CITY_WIDTH ; CERULEAN_HOUSE_2
	warp_to $9, $9, CERULEAN_CITY_WIDTH ; CERULEAN_HOUSE_2
