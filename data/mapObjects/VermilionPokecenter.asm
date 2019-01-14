VermilionPokecenter_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 0, -1
	warp 4, 7, 0, -1

	db 0 ; signs

	db 4 ; objects
	object SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_FISHER, 10, 5, STAY, NONE, 2 ; person
	object SPRITE_SAILOR, 5, 4, STAY, NONE, 3 ; person
	object SPRITE_CABLE_CLUB_WOMAN, 11, 2, STAY, DOWN, 4 ; person

	; warp-to
	warp_to 3, 7, VERMILION_POKECENTER_WIDTH
	warp_to 4, 7, VERMILION_POKECENTER_WIDTH
