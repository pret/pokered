GameCornerPrizeRoom_Object:
	db $f ; border block

	db 2 ; warps
	warp 4, 7, 9, -1
	warp 5, 7, 9, -1

	db 3 ; signs
	sign 2, 2, 3 ; CeladonPrizeRoomText3
	sign 4, 2, 4 ; CeladonPrizeRoomText4
	sign 6, 2, 5 ; CeladonPrizeRoomText5

	db 2 ; objects
	object SPRITE_BALDING_GUY, 1, 4, STAY, NONE, 1 ; person
	object SPRITE_GAMBLER, 7, 3, WALK, 2, 2 ; person

	; warp-to
	warp_to 4, 7, GAME_CORNER_PRIZE_ROOM_WIDTH
	warp_to 5, 7, GAME_CORNER_PRIZE_ROOM_WIDTH
