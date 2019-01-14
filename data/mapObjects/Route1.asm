Route1_Object:
	db $b ; border block

	db 0 ; warps

	db 1 ; signs
	sign 9, 27, 3 ; Route1Text3

	db 2 ; objects
	object SPRITE_BUG_CATCHER, 5, 24, WALK, 1, 1 ; person
	object SPRITE_BUG_CATCHER, 15, 13, WALK, 2, 2 ; person

	; warp-to (unused)
	warp_to 2, 7, 4
