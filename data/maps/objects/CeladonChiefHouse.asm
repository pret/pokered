CeladonChiefHouse_Object:
	db $f ; border block

	def_warps
	warp 2, 7, 11, LAST_MAP
	warp 3, 7, 11, LAST_MAP

	def_signs

	def_objects
	object SPRITE_GRAMPS, 4, 2, STAY, DOWN, 1 ; person
	object SPRITE_ROCKET, 1, 4, WALK, ANY_DIR, 2 ; person
	object SPRITE_SAILOR, 5, 6, STAY, LEFT, 3 ; person

	; warp-to
	warp_to 2, 7, CELADON_CHIEF_HOUSE_WIDTH
	warp_to 3, 7, CELADON_CHIEF_HOUSE_WIDTH
