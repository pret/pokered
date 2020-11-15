SSAnne2FRooms_Object:
	db $c ; border block

	def_warps
	warp  2,  5, 0, SS_ANNE_2F
	warp  3,  5, 0, SS_ANNE_2F
	warp 12,  5, 1, SS_ANNE_2F
	warp 13,  5, 1, SS_ANNE_2F
	warp 22,  5, 2, SS_ANNE_2F
	warp 23,  5, 2, SS_ANNE_2F
	warp  2, 15, 3, SS_ANNE_2F
	warp  3, 15, 3, SS_ANNE_2F
	warp 12, 15, 4, SS_ANNE_2F
	warp 13, 15, 4, SS_ANNE_2F
	warp 22, 15, 5, SS_ANNE_2F
	warp 23, 15, 5, SS_ANNE_2F

	def_signs

	def_objects
	object SPRITE_GENTLEMAN, 10, 2, STAY, RIGHT, 1, OPP_GENTLEMAN, 3
	object SPRITE_FISHER, 13, 4, STAY, LEFT, 2, OPP_FISHER, 1
	object SPRITE_GENTLEMAN, 0, 14, STAY, RIGHT, 3, OPP_GENTLEMAN, 5
	object SPRITE_COOLTRAINER_F, 2, 11, STAY, DOWN, 4, OPP_LASS, 12
	object SPRITE_GENTLEMAN, 1, 2, STAY, DOWN, 5 ; person
	object SPRITE_POKE_BALL, 12, 1, STAY, NONE, 6, MAX_ETHER
	object SPRITE_GENTLEMAN, 21, 2, STAY, DOWN, 7 ; person
	object SPRITE_GRAMPS, 22, 1, STAY, DOWN, 8 ; person
	object SPRITE_POKE_BALL, 0, 12, STAY, NONE, 9, RARE_CANDY
	object SPRITE_GENTLEMAN, 12, 12, STAY, DOWN, 10 ; person
	object SPRITE_LITTLE_BOY, 11, 14, STAY, NONE, 11 ; person
	object SPRITE_BRUNETTE_GIRL, 22, 12, STAY, LEFT, 12 ; person
	object SPRITE_BEAUTY, 20, 12, STAY, RIGHT, 13 ; person

	def_warps_to SS_ANNE_2F_ROOMS
