SSAnne7Object:
	db 12 ; border block

	db 1 ; warps
	warp 0, 7, 8, SS_ANNE_2

	db 2 ; signs
	sign 4, 1, 2 ; SSAnne7Text2
	sign 1, 2, 3 ; SSAnne7Text3

	db 1 ; objects
	object SPRITE_SS_CAPTAIN, 4, 2, STAY, UP, 1 ; person

	; warp-to
	warp_to 0, 7, SS_ANNE_7_WIDTH ; SS_ANNE_2
