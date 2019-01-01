WardensHouse_Object:
	db $17 ; border block

	db 2 ; warps
	warp 4, 7, 3, -1
	warp 5, 7, 3, -1

	db 2 ; signs
	sign 4, 3, 4 ; FuchsiaHouse2Text4
	sign 5, 3, 5 ; FuchsiaHouse2Text5

	db 3 ; objects
	object SPRITE_WARDEN, 2, 3, STAY, NONE, 1 ; person
	object SPRITE_BALL, 8, 3, STAY, NONE, 2, RARE_CANDY
	object SPRITE_BOULDER, 8, 4, STAY, BOULDER_MOVEMENT_BYTE_2, 3 ; person

	; warp-to
	warp_to 4, 7, WARDENS_HOUSE_WIDTH
	warp_to 5, 7, WARDENS_HOUSE_WIDTH
