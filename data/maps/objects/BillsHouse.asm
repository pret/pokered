BillsHouse_Object:
	db $d ; border block

	db 2 ; warps
	warp 2, 7, 0, -1
	warp 3, 7, 0, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_SLOWBRO, 6, 5, STAY, NONE, 1 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 4, 4, STAY, NONE, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 6, 5, STAY, NONE, 3 ; person

	; warp-to
	warp_to 2, 7, BILLS_HOUSE_WIDTH
	warp_to 3, 7, BILLS_HOUSE_WIDTH
