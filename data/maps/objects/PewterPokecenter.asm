PewterPokecenter_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 6, LAST_MAP
	warp 4, 7, 6, LAST_MAP

	db 0 ; signs

	db 4 ; objects
	object SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_GENTLEMAN, 11, 7, STAY, LEFT, 2 ; person
	object SPRITE_FAIRY, 1, 3, STAY, DOWN, 3 ; person
	object SPRITE_LINK_RECEPTIONIST, 11, 2, STAY, DOWN, 4 ; person

	; warp-to
	warp_to 3, 7, PEWTER_POKECENTER_WIDTH
	warp_to 4, 7, PEWTER_POKECENTER_WIDTH
