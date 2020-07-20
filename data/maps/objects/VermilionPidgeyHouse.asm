VermilionPidgeyHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 4, LAST_MAP
	warp 3, 7, 4, LAST_MAP

	db 0 ; signs

	db 3 ; objects
	object SPRITE_YOUNGSTER, 5, 3, STAY, LEFT, 1 ; person
	object SPRITE_BIRD, 3, 5, WALK, 2, 2 ; person
	object SPRITE_PAPER, 4, 3, STAY, NONE, 3 ; person

	; warp-to
	warp_to 2, 7, VERMILION_PIDGEY_HOUSE_WIDTH
	warp_to 3, 7, VERMILION_PIDGEY_HOUSE_WIDTH
