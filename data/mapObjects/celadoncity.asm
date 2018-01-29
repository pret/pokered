CeladonCityObject:
	db $f ; border block

	db $d ; warps
	warp $8, $d, $0, CELADON_MART_1
	warp $a, $d, $2, CELADON_MART_1
	warp $18, $9, $0, CELADON_MANSION_1
	warp $18, $3, $2, CELADON_MANSION_1
	warp $19, $3, $2, CELADON_MANSION_1
	warp $29, $9, $0, CELADON_POKECENTER
	warp $c, $1b, $0, CELADON_GYM
	warp $1c, $13, $0, GAME_CORNER
	warp $27, $13, $0, CELADON_MART_5 ; beta warp! no longer used
	warp $21, $13, $0, CELADON_PRIZE_ROOM
	warp $1f, $1b, $0, CELADON_DINER
	warp $23, $1b, $0, CELADON_HOUSE
	warp $2b, $1b, $0, CELADON_HOTEL

	db $9 ; signs
	sign $1b, $f, $a ; CeladonCityText10
	sign $13, $f, $b ; CeladonCityText11
	sign $2a, $9, $c ; PokeCenterSignText
	sign $d, $1d, $d ; CeladonCityText13
	sign $15, $9, $e ; CeladonCityText14
	sign $c, $d, $f ; CeladonCityText15
	sign $27, $15, $10 ; CeladonCityText16
	sign $21, $15, $11 ; CeladonCityText17
	sign $1b, $15, $12 ; CeladonCityText18

	db $9 ; objects
	object SPRITE_LITTLE_GIRL, $8, $11, WALK, $0, $1 ; person
	object SPRITE_OLD_PERSON, $b, $1c, STAY, UP, $2 ; person
	object SPRITE_GIRL, $e, $13, WALK, $1, $3 ; person
	object SPRITE_OLD_PERSON, $19, $16, STAY, DOWN, $4 ; person
	object SPRITE_OLD_PERSON, $16, $10, STAY, DOWN, $5 ; person
	object SPRITE_FISHER2, $20, $c, STAY, LEFT, $6 ; person
	object SPRITE_SLOWBRO, $1e, $c, STAY, RIGHT, $7 ; person
	object SPRITE_ROCKET, $20, $1d, WALK, $2, $8 ; person
	object SPRITE_ROCKET, $2a, $e, WALK, $2, $9 ; person

	; warp-to
	warp_to $8, $d, CELADON_CITY_WIDTH ; CELADON_MART_1
	warp_to $a, $d, CELADON_CITY_WIDTH ; CELADON_MART_1
	warp_to $18, $9, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to $18, $3, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to $19, $3, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to $29, $9, CELADON_CITY_WIDTH ; CELADON_POKECENTER
	warp_to $c, $1b, CELADON_CITY_WIDTH ; CELADON_GYM
	warp_to $1c, $13, CELADON_CITY_WIDTH ; GAME_CORNER
	warp_to $27, $13, CELADON_CITY_WIDTH ; CELADON_MART_5
	warp_to $21, $13, CELADON_CITY_WIDTH ; CELADON_PRIZE_ROOM
	warp_to $1f, $1b, CELADON_CITY_WIDTH ; CELADON_DINER
	warp_to $23, $1b, CELADON_CITY_WIDTH ; CELADON_HOUSE
	warp_to $2b, $1b, CELADON_CITY_WIDTH ; CELADON_HOTEL
