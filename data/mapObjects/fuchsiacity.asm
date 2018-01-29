FuchsiaCityObject:
	db $f ; border block

	db $9 ; warps
	warp $5, $d, $0, FUCHSIA_MART
	warp $b, $1b, $0, FUCHSIA_HOUSE_1
	warp $13, $1b, $0, FUCHSIA_POKECENTER
	warp $1b, $1b, $0, FUCHSIA_HOUSE_2
	warp $12, $3, $0, SAFARI_ZONE_ENTRANCE
	warp $5, $1b, $0, FUCHSIA_GYM
	warp $16, $d, $0, FUCHSIA_MEETING_ROOM
	warp $1f, $1b, $1, FUCHSIA_HOUSE_3
	warp $1f, $18, $0, FUCHSIA_HOUSE_3

	db $e ; signs
	sign $f, $17, $b ; FuchsiaCityText11
	sign $19, $f, $c ; FuchsiaCityText12
	sign $11, $5, $d ; FuchsiaCityText13
	sign $6, $d, $e ; MartSignText
	sign $14, $1b, $f ; PokeCenterSignText
	sign $1b, $1d, $10 ; FuchsiaCityText16
	sign $15, $f, $11 ; FuchsiaCityText17
	sign $5, $1d, $12 ; FuchsiaCityText18
	sign $21, $7, $13 ; FuchsiaCityText19
	sign $1b, $7, $14 ; FuchsiaCityText20
	sign $d, $7, $15 ; FuchsiaCityText21
	sign $1f, $d, $16 ; FuchsiaCityText22
	sign $d, $f, $17 ; FuchsiaCityText23
	sign $7, $7, $18 ; FuchsiaCityText24

	db $a ; objects
	object SPRITE_BUG_CATCHER, $a, $c, WALK, $2, $1 ; person
	object SPRITE_GAMBLER, $1c, $11, WALK, $2, $2 ; person
	object SPRITE_FISHER2, $1e, $e, STAY, DOWN, $3 ; person
	object SPRITE_BUG_CATCHER, $18, $8, STAY, UP, $4 ; person
	object SPRITE_CLEFAIRY, $1f, $5, WALK, $0, $5 ; person
	object SPRITE_BALL, $19, $6, STAY, NONE, $6 ; person
	object SPRITE_SLOWBRO, $c, $6, WALK, $2, $7 ; person
	object SPRITE_SLOWBRO, $1e, $c, WALK, $2, $8 ; person
	object SPRITE_SEEL, $8, $11, WALK, $0, $9 ; person
	object SPRITE_OMANYTE, $6, $5, STAY, NONE, $a ; person

	; warp-to
	warp_to $5, $d, FUCHSIA_CITY_WIDTH ; FUCHSIA_MART
	warp_to $b, $1b, FUCHSIA_CITY_WIDTH ; FUCHSIA_HOUSE_1
	warp_to $13, $1b, FUCHSIA_CITY_WIDTH ; FUCHSIA_POKECENTER
	warp_to $1b, $1b, FUCHSIA_CITY_WIDTH ; FUCHSIA_HOUSE_2
	warp_to $12, $3, FUCHSIA_CITY_WIDTH ; SAFARI_ZONE_ENTRANCE
	warp_to $5, $1b, FUCHSIA_CITY_WIDTH ; FUCHSIA_GYM
	warp_to $16, $d, FUCHSIA_CITY_WIDTH ; FUCHSIA_MEETING_ROOM
	warp_to $1f, $1b, FUCHSIA_CITY_WIDTH ; FUCHSIA_HOUSE_3
	warp_to $1f, $18, FUCHSIA_CITY_WIDTH ; FUCHSIA_HOUSE_3
