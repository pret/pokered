CeruleanTrashedHouse_Object:
	db $a ; border block

	def_warps
	warp 2, 7, 0, LAST_MAP
	warp 3, 7, 0, LAST_MAP
	warp 3, 0, 7, LAST_MAP

	def_signs
	sign 3, 0, 3 ; CeruleanHouseTrashedText3

	def_objects
	object SPRITE_FISHING_GURU, 2, 1, STAY, DOWN, 1 ; person
	object SPRITE_GIRL, 5, 6, WALK, LEFT_RIGHT, 2 ; person

	; warp-to
	warp_to 2, 7, CERULEAN_TRASHED_HOUSE_WIDTH
	warp_to 3, 7, CERULEAN_TRASHED_HOUSE_WIDTH
	warp_to 3, 0, CERULEAN_TRASHED_HOUSE_WIDTH
