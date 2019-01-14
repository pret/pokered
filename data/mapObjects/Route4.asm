Route4_Object:
	db $2c ; border block

	db 3 ; warps
	warp 11, 5, 0, MT_MOON_POKECENTER
	warp 18, 5, 0, MT_MOON_1F
	warp 24, 5, 7, MT_MOON_B1F

	db 3 ; signs
	sign 12, 5, 4 ; PokeCenterSignText
	sign 17, 7, 5 ; Route4Text5
	sign 27, 7, 6 ; Route4Text6

	db 3 ; objects
	object SPRITE_LASS, 9, 8, WALK, 0, 1 ; person
	object SPRITE_LASS, 63, 3, STAY, RIGHT, 2, OPP_LASS, 4
	object SPRITE_BALL, 57, 3, STAY, NONE, 3, TM_04

	; warp-to
	warp_to 11, 5, ROUTE_4_WIDTH ; MT_MOON_POKECENTER
	warp_to 18, 5, ROUTE_4_WIDTH ; MT_MOON_1F
	warp_to 24, 5, ROUTE_4_WIDTH ; MT_MOON_B1F
