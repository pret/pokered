BluesHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 1, LAST_MAP
	warp  3,  7, 1, LAST_MAP

	def_signs

	def_objects
	object SPRITE_DAISY, 2, 3, STAY, RIGHT, 1 ; Daisy, sitting by map
	object SPRITE_DAISY, 6, 4, WALK, UP_DOWN, 2, 0 ; Daisy, walking around
	object SPRITE_POKEDEX, 3, 3, STAY, NONE, 3, 0 ; map on table

	def_warps_to BLUES_HOUSE
