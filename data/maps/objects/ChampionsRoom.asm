ChampionsRoom_Object:
	db $3 ; border block

	def_warps
	warp  3,  7, 1, LANCES_ROOM
	warp  4,  7, 2, LANCES_ROOM
	warp  3,  0, 0, HALL_OF_FAME
	warp  4,  0, 0, HALL_OF_FAME

	def_signs

	def_objects
	object SPRITE_BLUE, 4, 2, STAY, DOWN, 1 ; person
	object SPRITE_OAK, 3, 7, STAY, UP, 2 ; person

	def_warps_to CHAMPIONS_ROOM
