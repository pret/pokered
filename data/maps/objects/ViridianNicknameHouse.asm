ViridianNicknameHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 3, LAST_MAP
	warp 3, 7, 3, LAST_MAP

	db 0 ; signs

	db 4 ; objects
	object SPRITE_BALDING_GUY, 5, 3, STAY, NONE, 1 ; person
	object SPRITE_LITTLE_GIRL, 1, 4, WALK, UP_DOWN, 2 ; person
	object SPRITE_BIRD, 5, 5, WALK, LEFT_RIGHT, 3 ; person
	object SPRITE_CLIPBOARD, 4, 0, STAY, NONE, 4 ; person

	; warp-to
	warp_to 2, 7, VIRIDIAN_NICKNAME_HOUSE_WIDTH
	warp_to 3, 7, VIRIDIAN_NICKNAME_HOUSE_WIDTH
