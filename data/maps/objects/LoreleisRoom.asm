LoreleisRoom_Object:
	db $3 ; border block

	def_warps
	warp  4, 11, 2, INDIGO_PLATEAU_LOBBY
	warp  5, 11, 2, INDIGO_PLATEAU_LOBBY
	warp  4,  0, 0, BRUNOS_ROOM
	warp  5,  0, 1, BRUNOS_ROOM

	def_signs

	def_objects
	object SPRITE_LORELEI, 5, 2, STAY, DOWN, 1, OPP_LORELEI, 1

	def_warps_to LORELEIS_ROOM
