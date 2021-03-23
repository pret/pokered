FuchsiaBillsGrandpasHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 1, LAST_MAP
	warp  3,  7, 1, LAST_MAP

	def_signs

	def_objects
	object SPRITE_MIDDLE_AGED_WOMAN, 2, 3, STAY, RIGHT, 1 ; person
	object SPRITE_GAMBLER, 7, 2, STAY, UP, 2 ; person
	object SPRITE_YOUNGSTER, 5, 5, STAY, NONE, 3 ; person

	def_warps_to FUCHSIA_BILLS_GRANDPAS_HOUSE
