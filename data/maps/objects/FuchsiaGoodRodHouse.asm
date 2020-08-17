FuchsiaGoodRodHouse_Object:
	db $c ; border block

	def_warps
	warp 2, 0, 8, LAST_MAP
	warp 2, 7, 7, LAST_MAP
	warp 3, 7, 7, LAST_MAP

	def_signs

	def_objects
	object SPRITE_FISHING_GURU, 5, 3, STAY, RIGHT, 1 ; person

	; warp-to
	warp_to 2, 0, FUCHSIA_GOOD_ROD_HOUSE_WIDTH
	warp_to 2, 7, FUCHSIA_GOOD_ROD_HOUSE_WIDTH
	warp_to 3, 7, FUCHSIA_GOOD_ROD_HOUSE_WIDTH
