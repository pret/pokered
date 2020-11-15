GameCornerPrizeRoom_Object:
	db $f ; border block

	def_warps
	warp  4,  7, 9, LAST_MAP
	warp  5,  7, 9, LAST_MAP

	def_signs
	sign  2,  2, 3 ; CeladonPrizeRoomText3
	sign  4,  2, 4 ; CeladonPrizeRoomText4
	sign  6,  2, 5 ; CeladonPrizeRoomText5

	def_objects
	object SPRITE_BALDING_GUY, 1, 4, STAY, NONE, 1 ; person
	object SPRITE_GAMBLER, 7, 3, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to GAME_CORNER_PRIZE_ROOM
