CeladonPokecenter_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 5, -1
	warp 4, 7, 5, -1

	db 0 ; signs

	db 4 ; objects
	object SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_GENTLEMAN, 7, 3, WALK, 2, 2 ; person
	object SPRITE_FOULARD_WOMAN, 10, 5, WALK, 0, 3 ; person
	object SPRITE_CABLE_CLUB_WOMAN, 11, 2, STAY, DOWN, 4 ; person

	; warp-to
	warp_to 3, 7, CELADON_POKECENTER_WIDTH
	warp_to 4, 7, CELADON_POKECENTER_WIDTH
