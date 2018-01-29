LavenderTownObject:
	db $2c ; border block

	db $6 ; warps
	warp $3, $5, $0, LAVENDER_POKECENTER
	warp $e, $5, $0, POKEMONTOWER_1
	warp $7, $9, $0, LAVENDER_HOUSE_1
	warp $f, $d, $0, LAVENDER_MART
	warp $3, $d, $0, LAVENDER_HOUSE_2
	warp $7, $d, $0, NAME_RATERS_HOUSE

	db $6 ; signs
	sign $b, $9, $4 ; LavenderTownText4
	sign $9, $3, $5 ; LavenderTownText5
	sign $10, $d, $6 ; MartSignText
	sign $4, $5, $7 ; PokeCenterSignText
	sign $5, $9, $8 ; LavenderTownText8
	sign $11, $7, $9 ; LavenderTownText9

	db $3 ; objects
	object SPRITE_LITTLE_GIRL, $f, $9, WALK, $0, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $9, $a, STAY, NONE, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $8, $7, WALK, $2, $3 ; person

	; warp-to
	warp_to $3, $5, LAVENDER_TOWN_WIDTH ; LAVENDER_POKECENTER
	warp_to $e, $5, LAVENDER_TOWN_WIDTH ; POKEMONTOWER_1
	warp_to $7, $9, LAVENDER_TOWN_WIDTH ; LAVENDER_HOUSE_1
	warp_to $f, $d, LAVENDER_TOWN_WIDTH ; LAVENDER_MART
	warp_to $3, $d, LAVENDER_TOWN_WIDTH ; LAVENDER_HOUSE_2
	warp_to $7, $d, LAVENDER_TOWN_WIDTH ; NAME_RATERS_HOUSE
