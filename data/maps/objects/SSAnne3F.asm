SSAnne3F_Object:
	db $c ; border block

	def_warps
	warp  0,  3, 0, SS_ANNE_BOW
	warp 19,  3, 7, SS_ANNE_2F

	def_signs

	def_objects
	object SPRITE_SAILOR, 9, 3, WALK, LEFT_RIGHT, 1 ; person

	def_warps_to SS_ANNE_3F
