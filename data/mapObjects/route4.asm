Route4Object:
	db $2c ; border block

	db $3 ; warps
	warp $b, $5, $0, MT_MOON_POKECENTER
	warp $12, $5, $0, MT_MOON_1
	warp $18, $5, $7, MT_MOON_2

	db $3 ; signs
	sign $c, $5, $4 ; PokeCenterSignText
	sign $11, $7, $5 ; Route4Text5
	sign $1b, $7, $6 ; Route4Text6

	db $3 ; objects
	object SPRITE_LASS, $9, $8, WALK, $0, $1 ; person
	object SPRITE_LASS, $3f, $3, STAY, RIGHT, $2, OPP_LASS, $4
	object SPRITE_BALL, $39, $3, STAY, NONE, $3, TM_04

	; warp-to
	warp_to $b, $5, ROUTE_4_WIDTH ; MT_MOON_POKECENTER
	warp_to $12, $5, ROUTE_4_WIDTH ; MT_MOON_1
	warp_to $18, $5, ROUTE_4_WIDTH ; MT_MOON_2
