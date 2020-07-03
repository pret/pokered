Museum2F_Object:
	db $a ; border block

	db 1 ; warps
	warp 7, 7, 4, MUSEUM_1F

	db 2 ; signs
	sign 11, 2, 6 ; Museum2FText6
	sign 2, 5, 7 ; Museum2FText7

	db 5 ; objects
	object SPRITE_BUG_CATCHER, 1, 7, WALK, 2, 1 ; person
	object SPRITE_OLD_PERSON, 0, 5, STAY, DOWN, 2 ; person
	object SPRITE_OAK_AIDE, 7, 5, STAY, DOWN, 3 ; person
	object SPRITE_BRUNETTE_GIRL, 11, 5, STAY, NONE, 4 ; person
	object SPRITE_HIKER, 12, 5, STAY, DOWN, 5 ; person

	; warp-to
	warp_to 7, 7, MUSEUM_2F_WIDTH ; MUSEUM_1F
