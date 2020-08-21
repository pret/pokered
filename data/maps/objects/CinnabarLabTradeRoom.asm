CinnabarLabTradeRoom_Object:
	db $17 ; border block

	def_warps
	warp  2,  7, 2, CINNABAR_LAB
	warp  3,  7, 2, CINNABAR_LAB

	def_signs

	def_objects
	object SPRITE_SUPER_NERD, 3, 2, STAY, DOWN, 1 ; person
	object SPRITE_GRAMPS, 1, 4, STAY, NONE, 2 ; person
	object SPRITE_BEAUTY, 5, 5, STAY, UP, 3 ; person

	def_warps_to CINNABAR_LAB_TRADE_ROOM
