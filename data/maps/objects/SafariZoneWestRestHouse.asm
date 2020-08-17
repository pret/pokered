SafariZoneWestRestHouse_Object:
	db $a ; border block

	def_warps
	warp 2, 7, 7, SAFARI_ZONE_WEST
	warp 3, 7, 7, SAFARI_ZONE_WEST

	def_signs

	def_objects
	object SPRITE_SCIENTIST, 4, 4, WALK, ANY_DIR, 1 ; person
	object SPRITE_COOLTRAINER_M, 0, 2, STAY, RIGHT, 2 ; person
	object SPRITE_ERIKA, 6, 2, STAY, DOWN, 3 ; person

	; warp-to
	warp_to 2, 7, SAFARI_ZONE_WEST_REST_HOUSE_WIDTH ; SAFARI_ZONE_WEST
	warp_to 3, 7, SAFARI_ZONE_WEST_REST_HOUSE_WIDTH ; SAFARI_ZONE_WEST
