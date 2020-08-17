CeruleanBadgeHouse_Object:
	db $c ; border block

	def_warps
	warp 2, 0, 9, LAST_MAP
	warp 2, 7, 8, LAST_MAP
	warp 3, 7, 8, LAST_MAP

	def_signs

	def_objects
	object SPRITE_MIDDLE_AGED_MAN, 5, 3, STAY, RIGHT, 1 ; person

	; warp-to
	warp_to 2, 0, CERULEAN_BADGE_HOUSE_WIDTH
	warp_to 2, 7, CERULEAN_BADGE_HOUSE_WIDTH
	warp_to 3, 7, CERULEAN_BADGE_HOUSE_WIDTH
