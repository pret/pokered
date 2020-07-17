BillsHouse_Object:
	db $d ; border block

	db 2 ; warps
	warp 2, 7, 0, LAST_MAP
	warp 3, 7, 0, LAST_MAP

	db 0 ; signs

	db 3 ; objects
	object SPRITE_MONSTER, 6, 5, STAY, NONE, 1 ; person
	object SPRITE_SUPER_NERD, 4, 4, STAY, NONE, 2 ; person
	object SPRITE_SUPER_NERD, 6, 5, STAY, NONE, 3 ; person

	; warp-to
	warp_to 2, 7, BILLS_HOUSE_WIDTH
	warp_to 3, 7, BILLS_HOUSE_WIDTH
