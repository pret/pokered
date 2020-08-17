RedsHouse1F_Object:
	db $a ; border block

	def_warps
	warp 2, 7, 0, LAST_MAP ; exit1
	warp 3, 7, 0, LAST_MAP ; exit2
	warp 7, 1, 0, REDS_HOUSE_2F ; staircase

	def_signs
	sign 3, 1, 2 ; TV

	def_objects
	object SPRITE_MOM, 5, 4, STAY, LEFT, 1 ; Mom

	; warp-to
	warp_to 2, 7, REDS_HOUSE_1F_WIDTH
	warp_to 3, 7, REDS_HOUSE_1F_WIDTH
	warp_to 7, 1, REDS_HOUSE_1F_WIDTH
