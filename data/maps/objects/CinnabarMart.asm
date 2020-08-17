CinnabarMart_Object:
	db $0 ; border block

	def_warps
	warp 3, 7, 4, LAST_MAP
	warp 4, 7, 4, LAST_MAP

	def_signs

	def_objects
	object SPRITE_CLERK, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_ERIKA, 6, 2, STAY, NONE, 2 ; person
	object SPRITE_SCIENTIST, 3, 4, STAY, NONE, 3 ; person

	; warp-to
	warp_to 3, 7, CINNABAR_MART_WIDTH
	warp_to 4, 7, CINNABAR_MART_WIDTH
