LancesRoom_Object:
	db $3 ; border block

	def_warps
	warp 24, 16, 2, AGATHAS_ROOM
	warp  5,  0, 0, CHAMPIONS_ROOM
	warp  6,  0, 0, CHAMPIONS_ROOM

	def_signs

	def_objects
	object SPRITE_LANCE, 6, 1, STAY, DOWN, 1, OPP_LANCE, 1

	def_warps_to LANCES_ROOM
