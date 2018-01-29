VermilionCityObject:
	db $43 ; border block

	db $9 ; warps
	warp $b, $3, $0, VERMILION_POKECENTER
	warp $9, $d, $0, POKEMON_FAN_CLUB
	warp $17, $d, $0, VERMILION_MART
	warp $c, $13, $0, VERMILION_GYM
	warp $17, $13, $0, VERMILION_HOUSE_1
	warp $12, $1f, $0, VERMILION_DOCK
	warp $13, $1f, $0, VERMILION_DOCK
	warp $f, $d, $0, VERMILION_HOUSE_3
	warp $7, $3, $0, VERMILION_HOUSE_2

	db $7 ; signs
	sign $1b, $3, $7 ; VermilionCityText7
	sign $25, $d, $8 ; VermilionCityText8
	sign $18, $d, $9 ; MartSignText
	sign $c, $3, $a ; PokeCenterSignText
	sign $7, $d, $b ; VermilionCityText11
	sign $7, $13, $c ; VermilionCityText12
	sign $1d, $f, $d ; VermilionCityText13

	db $6 ; objects
	object SPRITE_FOULARD_WOMAN, $13, $7, WALK, $2, $1 ; person
	object SPRITE_GAMBLER, $e, $6, STAY, NONE, $2 ; person
	object SPRITE_SAILOR, $13, $1e, STAY, UP, $3 ; person
	object SPRITE_GAMBLER, $1e, $7, STAY, NONE, $4 ; person
	object SPRITE_SLOWBRO, $1d, $9, WALK, $1, $5 ; person
	object SPRITE_SAILOR, $19, $1b, WALK, $2, $6 ; person

	; warp-to
	warp_to $b, $3, VERMILION_CITY_WIDTH ; VERMILION_POKECENTER
	warp_to $9, $d, VERMILION_CITY_WIDTH ; POKEMON_FAN_CLUB
	warp_to $17, $d, VERMILION_CITY_WIDTH ; VERMILION_MART
	warp_to $c, $13, VERMILION_CITY_WIDTH ; VERMILION_GYM
	warp_to $17, $13, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_1
	warp_to $12, $1f, VERMILION_CITY_WIDTH ; VERMILION_DOCK
	warp_to $13, $1f, VERMILION_CITY_WIDTH ; VERMILION_DOCK
	warp_to $f, $d, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_3
	warp_to $7, $3, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_2
