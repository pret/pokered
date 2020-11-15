CinnabarLabMetronomeRoom_Object:
	db $17 ; border block

	def_warps
	warp  2,  7, 3, CINNABAR_LAB
	warp  3,  7, 3, CINNABAR_LAB

	def_signs
	sign  0,  4, 3 ; Lab3Text3
	sign  1,  4, 4 ; Lab3Text4
	sign  2,  1, 5 ; Lab3Text5

	def_objects
	object SPRITE_SCIENTIST, 7, 2, STAY, DOWN, 1 ; person
	object SPRITE_SCIENTIST, 2, 3, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to CINNABAR_LAB_METRONOME_ROOM
