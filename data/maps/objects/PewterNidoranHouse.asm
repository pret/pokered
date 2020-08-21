PewterNidoranHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 3, LAST_MAP
	warp  3,  7, 3, LAST_MAP

	def_signs

	def_objects
	object SPRITE_MONSTER, 4, 5, STAY, LEFT, 1 ; person
	object SPRITE_LITTLE_BOY, 3, 5, STAY, RIGHT, 2 ; person
	object SPRITE_MIDDLE_AGED_MAN, 1, 2, STAY, NONE, 3 ; person

	def_warps_to PEWTER_NIDORAN_HOUSE
