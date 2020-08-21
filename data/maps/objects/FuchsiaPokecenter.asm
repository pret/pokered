FuchsiaPokecenter_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 2, LAST_MAP
	warp  4,  7, 2, LAST_MAP

	def_signs

	def_objects
	object SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_ROCKER, 2, 3, STAY, NONE, 2 ; person
	object SPRITE_COOLTRAINER_F, 6, 5, WALK, LEFT_RIGHT, 3 ; person
	object SPRITE_LINK_RECEPTIONIST, 11, 2, STAY, DOWN, 4 ; person

	def_warps_to FUCHSIA_POKECENTER
