SSAnne1FRooms_Object:
	db $c ; border block

	def_warps
	warp  0,  0, 2, SS_ANNE_1F
	warp 10,  0, 3, SS_ANNE_1F
	warp 20,  0, 4, SS_ANNE_1F
	warp  0, 10, 5, SS_ANNE_1F
	warp 10, 10, 6, SS_ANNE_1F
	warp 20, 10, 7, SS_ANNE_1F

	def_signs

	def_objects
	object SPRITE_GENTLEMAN, 2, 3, STAY, LEFT, 1, OPP_GENTLEMAN, 1
	object SPRITE_GENTLEMAN, 11, 4, STAY, UP, 2, OPP_GENTLEMAN, 2
	object SPRITE_YOUNGSTER, 11, 14, STAY, UP, 3, OPP_YOUNGSTER, 8
	object SPRITE_COOLTRAINER_F, 13, 11, STAY, LEFT, 4, OPP_LASS, 11
	object SPRITE_GIRL, 22, 3, WALK, UP_DOWN, 5 ; person
	object SPRITE_MIDDLE_AGED_MAN, 0, 14, STAY, NONE, 6 ; person
	object SPRITE_LITTLE_GIRL, 2, 11, STAY, DOWN, 7 ; person
	object SPRITE_FAIRY, 3, 11, STAY, DOWN, 8 ; person
	object SPRITE_GIRL, 10, 13, STAY, RIGHT, 9 ; person
	object SPRITE_POKE_BALL, 12, 15, STAY, NONE, 10, TM_BODY_SLAM
	object SPRITE_GENTLEMAN, 21, 13, WALK, LEFT_RIGHT, 11 ; person

	def_warps_to SS_ANNE_1F_ROOMS
