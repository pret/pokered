Route1_Object:
	db $b ; border block

	db 0 ; warps

	db 1 ; signs
	sign 9, 27, 3 ; Route1Text3

	db 2 ; objects
	object SPRITE_YOUNGSTER, 5, 24, WALK, UP_DOWN, 1 ; person
	object SPRITE_YOUNGSTER, 15, 13, WALK, LEFT_RIGHT, 2 ; person

	; warp-to (unused)
	warp_to 2, 7, 4
