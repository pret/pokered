FuchsiaBillsGrandpasHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 1, -1
	warp 3, 7, 1, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_MOM_GEISHA, 2, 3, STAY, RIGHT, 1 ; person
	object SPRITE_GAMBLER, 7, 2, STAY, UP, 2 ; person
	object SPRITE_BUG_CATCHER, 5, 5, STAY, NONE, 3 ; person

	; warp-to
	warp_to 2, 7, FUCHSIA_BILLS_GRANDPAS_HOUSE_WIDTH
	warp_to 3, 7, FUCHSIA_BILLS_GRANDPAS_HOUSE_WIDTH
