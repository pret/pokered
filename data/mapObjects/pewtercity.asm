PewterCityObject:
	db $a ; border block

	db $7 ; warps
	warp $e, $7, $0, MUSEUM_1F
	warp $13, $5, $2, MUSEUM_1F
	warp $10, $11, $0, PEWTER_GYM
	warp $1d, $d, $0, PEWTER_HOUSE_1
	warp $17, $11, $0, PEWTER_MART
	warp $7, $1d, $0, PEWTER_HOUSE_2
	warp $d, $19, $0, PEWTER_POKECENTER

	db $7 ; signs
	sign $13, $1d, $6 ; PewterCityText6
	sign $21, $13, $7 ; PewterCityText7
	sign $18, $11, $8 ; MartSignText
	sign $e, $19, $9 ; PokeCenterSignText
	sign $f, $9, $a ; PewterCityText10
	sign $b, $11, $b ; PewterCityText11
	sign $19, $17, $c ; PewterCityText12

	db $5 ; objects
	object SPRITE_LASS, $8, $f, STAY, NONE, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $11, $19, STAY, NONE, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $1b, $11, STAY, NONE, $3 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $1a, $19, WALK, $2, $4 ; person
	object SPRITE_BUG_CATCHER, $23, $10, STAY, DOWN, $5 ; person

	; warp-to
	warp_to $e, $7, PEWTER_CITY_WIDTH ; MUSEUM_1F
	warp_to $13, $5, PEWTER_CITY_WIDTH ; MUSEUM_1F
	warp_to $10, $11, PEWTER_CITY_WIDTH ; PEWTER_GYM
	warp_to $1d, $d, PEWTER_CITY_WIDTH ; PEWTER_HOUSE_1
	warp_to $17, $11, PEWTER_CITY_WIDTH ; PEWTER_MART
	warp_to $7, $1d, PEWTER_CITY_WIDTH ; PEWTER_HOUSE_2
	warp_to $d, $19, PEWTER_CITY_WIDTH ; PEWTER_POKECENTER
