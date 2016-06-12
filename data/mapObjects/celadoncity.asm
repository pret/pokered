CeladonCityObject:
	db $f ; border block

	db $d ; warps
	db $d, $8, $0, CELADON_MART_1
	db $d, $a, $2, CELADON_MART_1
	db $9, $18, $0, CELADON_MANSION_1
	db $3, $18, $2, CELADON_MANSION_1
	db $3, $19, $2, CELADON_MANSION_1
	db $9, $29, $0, CELADON_POKECENTER
	db $1b, $c, $0, CELADON_GYM
	db $13, $1c, $0, GAME_CORNER
	db $13, $27, $0, CELADON_MART_5 ; beta warp! no longer used
	db $13, $21, $0, CELADON_PRIZE_ROOM
	db $1b, $1f, $0, CELADON_DINER
	db $1b, $23, $0, CELADON_HOUSE
	db $1b, $2b, $0, CELADON_HOTEL

	db $9 ; signs
	db $f, $1b, $a ; CeladonCityText10
	db $f, $13, $b ; CeladonCityText11
	db $9, $2a, $c ; PokeCenterSignText
	db $1d, $d, $d ; CeladonCityText13
	db $9, $15, $e ; CeladonCityText14
	db $d, $c, $f ; CeladonCityText15
	db $15, $27, $10 ; CeladonCityText16
	db $15, $21, $11 ; CeladonCityText17
	db $15, $1b, $12 ; CeladonCityText18

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
	EVENT_DISP CELADON_CITY_WIDTH, $d, $8 ; CELADON_MART_1
	EVENT_DISP CELADON_CITY_WIDTH, $d, $a ; CELADON_MART_1
	EVENT_DISP CELADON_CITY_WIDTH, $9, $18 ; CELADON_MANSION_1
	EVENT_DISP CELADON_CITY_WIDTH, $3, $18 ; CELADON_MANSION_1
	EVENT_DISP CELADON_CITY_WIDTH, $3, $19 ; CELADON_MANSION_1
	EVENT_DISP CELADON_CITY_WIDTH, $9, $29 ; CELADON_POKECENTER
	EVENT_DISP CELADON_CITY_WIDTH, $1b, $c ; CELADON_GYM
	EVENT_DISP CELADON_CITY_WIDTH, $13, $1c ; GAME_CORNER
	EVENT_DISP CELADON_CITY_WIDTH, $13, $27 ; CELADON_MART_5
	EVENT_DISP CELADON_CITY_WIDTH, $13, $21 ; CELADON_PRIZE_ROOM
	EVENT_DISP CELADON_CITY_WIDTH, $1b, $1f ; CELADON_DINER
	EVENT_DISP CELADON_CITY_WIDTH, $1b, $23 ; CELADON_HOUSE
	EVENT_DISP CELADON_CITY_WIDTH, $1b, $2b ; CELADON_HOTEL
