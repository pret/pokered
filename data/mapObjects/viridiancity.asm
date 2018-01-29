ViridianCityObject:
	db $f ; border block

	db $5 ; warps
	warp $17, $19, $0, VIRIDIAN_POKECENTER
	warp $1d, $13, $0, VIRIDIAN_MART
	warp $15, $f, $0, VIRIDIAN_SCHOOL
	warp $15, $9, $0, VIRIDIAN_HOUSE
	warp $20, $7, $0, VIRIDIAN_GYM

	db $6 ; signs
	sign $11, $11, $8 ; ViridianCityText8
	sign $13, $1, $9 ; ViridianCityText9
	sign $15, $1d, $a ; ViridianCityText10
	sign $1e, $13, $b ; MartSignText
	sign $18, $19, $c ; PokeCenterSignText
	sign $1b, $7, $d ; ViridianCityText13

	db $7 ; objects
	object SPRITE_BUG_CATCHER, $d, $14, WALK, $0, $1 ; person
	object SPRITE_GAMBLER, $1e, $8, STAY, NONE, $2 ; person
	object SPRITE_BUG_CATCHER, $1e, $19, WALK, $0, $3 ; person
	object SPRITE_GIRL, $11, $9, STAY, RIGHT, $4 ; person
	object SPRITE_LYING_OLD_MAN, $12, $9, STAY, NONE, $5 ; person
	object SPRITE_FISHER2, $6, $17, STAY, DOWN, $6 ; person
	object SPRITE_GAMBLER, $11, $5, WALK, $2, $7 ; person

	; warp-to
	warp_to $17, $19, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_POKECENTER
	warp_to $1d, $13, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_MART
	warp_to $15, $f, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_SCHOOL
	warp_to $15, $9, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_HOUSE
	warp_to $20, $7, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_GYM
