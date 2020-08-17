SSAnneCaptainsRoom_Object:
	db $c ; border block

	def_warps
	warp 0, 7, 8, SS_ANNE_2F

	def_signs
	sign 4, 1, 2 ; SSAnne7Text2
	sign 1, 2, 3 ; SSAnne7Text3

	def_objects
	object SPRITE_CAPTAIN, 4, 2, STAY, UP, 1 ; person

	; warp-to
	warp_to 0, 7, SS_ANNE_CAPTAINS_ROOM_WIDTH ; SS_ANNE_2F
