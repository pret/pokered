LavenderTownObject:
	db $2c ; border block

	db $6 ; warps
	db $5, $3, $0, LAVENDER_POKECENTER
	db $5, $e, $0, POKEMONTOWER_1
	db $9, $7, $0, LAVENDER_HOUSE_1
	db $d, $f, $0, LAVENDER_MART
	db $d, $3, $0, LAVENDER_HOUSE_2
	db $d, $7, $0, NAME_RATERS_HOUSE

	db $6 ; signs
	db $9, $b, $4 ; LavenderTownText4
	db $3, $9, $5 ; LavenderTownText5
	db $d, $10, $6 ; MartSignText
	db $5, $4, $7 ; PokeCenterSignText
	db $9, $5, $8 ; LavenderTownText8
	db $7, $11, $9 ; LavenderTownText9

	db $3 ; objects
	object SPRITE_LITTLE_GIRL, $f, $9, WALK, $0, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $9, $a, STAY, NONE, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $8, $7, WALK, $2, $3 ; person

	; warp-to
	EVENT_DISP LAVENDER_TOWN_WIDTH, $5, $3 ; LAVENDER_POKECENTER
	EVENT_DISP LAVENDER_TOWN_WIDTH, $5, $e ; POKEMONTOWER_1
	EVENT_DISP LAVENDER_TOWN_WIDTH, $9, $7 ; LAVENDER_HOUSE_1
	EVENT_DISP LAVENDER_TOWN_WIDTH, $d, $f ; LAVENDER_MART
	EVENT_DISP LAVENDER_TOWN_WIDTH, $d, $3 ; LAVENDER_HOUSE_2
	EVENT_DISP LAVENDER_TOWN_WIDTH, $d, $7 ; NAME_RATERS_HOUSE
