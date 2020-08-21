AgathasRoom_Object:
	db $0 ; border block

	def_warps
	warp  4, 11, 2, BRUNOS_ROOM
	warp  5, 11, 3, BRUNOS_ROOM
	warp  4,  0, 0, LANCES_ROOM
	warp  5,  0, 0, LANCES_ROOM

	def_signs

	def_objects
	object SPRITE_AGATHA, 5, 2, STAY, DOWN, 1, OPP_AGATHA, 1

	def_warps_to AGATHAS_ROOM
