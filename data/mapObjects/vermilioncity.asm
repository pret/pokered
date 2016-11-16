VermilionCityObject:
	db $43 ; border block

	db $9 ; warps
	db $3, $b, $0, VERMILION_POKECENTER
	db $d, $9, $0, POKEMON_FAN_CLUB
	db $d, $17, $0, VERMILION_MART
	db $13, $c, $0, VERMILION_GYM
	db $13, $17, $0, VERMILION_HOUSE_1
	db $1f, $12, $0, VERMILION_DOCK
	db $1f, $13, $0, VERMILION_DOCK
	db $d, $f, $0, VERMILION_HOUSE_3
	db $3, $7, $0, VERMILION_HOUSE_2

	db $7 ; signs
	db $3, $1b, $7 ; VermilionCityText7
	db $d, $25, $8 ; VermilionCityText8
	db $d, $18, $9 ; MartSignText
	db $3, $c, $a ; PokeCenterSignText
	db $d, $7, $b ; VermilionCityText11
	db $13, $7, $c ; VermilionCityText12
	db $f, $1d, $d ; VermilionCityText13

	db $6 ; objects
	object SPRITE_FOULARD_WOMAN, $13, $7, WALK, $2, $1 ; person
	object SPRITE_GAMBLER, $e, $6, STAY, NONE, $2 ; person
	object SPRITE_SAILOR, $13, $1e, STAY, UP, $3 ; person
	object SPRITE_GAMBLER, $1e, $7, STAY, NONE, $4 ; person
	object SPRITE_SLOWBRO, $1d, $9, WALK, $1, $5 ; person
	object SPRITE_SAILOR, $19, $1b, WALK, $2, $6 ; person

	; warp-to
	EVENT_DISP VERMILION_CITY_WIDTH, $3, $b ; VERMILION_POKECENTER
	EVENT_DISP VERMILION_CITY_WIDTH, $d, $9 ; POKEMON_FAN_CLUB
	EVENT_DISP VERMILION_CITY_WIDTH, $d, $17 ; VERMILION_MART
	EVENT_DISP VERMILION_CITY_WIDTH, $13, $c ; VERMILION_GYM
	EVENT_DISP VERMILION_CITY_WIDTH, $13, $17 ; VERMILION_HOUSE_1
	EVENT_DISP VERMILION_CITY_WIDTH, $1f, $12 ; VERMILION_DOCK
	EVENT_DISP VERMILION_CITY_WIDTH, $1f, $13 ; VERMILION_DOCK
	EVENT_DISP VERMILION_CITY_WIDTH, $d, $f ; VERMILION_HOUSE_3
	EVENT_DISP VERMILION_CITY_WIDTH, $3, $7 ; VERMILION_HOUSE_2
