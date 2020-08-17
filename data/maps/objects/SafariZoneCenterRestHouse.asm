SafariZoneCenterRestHouse_Object:
	db $a ; border block

	def_warps
	warp 2, 7, 8, SAFARI_ZONE_CENTER
	warp 3, 7, 8, SAFARI_ZONE_CENTER

	def_signs

	def_objects
	object SPRITE_GIRL, 3, 2, STAY, DOWN, 1 ; person
	object SPRITE_SCIENTIST, 1, 4, WALK, UP_DOWN, 2 ; person

	; warp-to
	warp_to 2, 7, SAFARI_ZONE_CENTER_REST_HOUSE_WIDTH ; SAFARI_ZONE_CENTER
	warp_to 3, 7, SAFARI_ZONE_CENTER_REST_HOUSE_WIDTH ; SAFARI_ZONE_CENTER
