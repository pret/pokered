CeladonHotel_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 12, LAST_MAP
	warp  4,  7, 12, LAST_MAP

	def_signs

	def_objects
	object SPRITE_GRANNY, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_BEAUTY, 2, 4, STAY, NONE, 2 ; person
	object SPRITE_SUPER_NERD, 8, 4, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to CELADON_HOTEL
