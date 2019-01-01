CinnabarLabMetronomeRoom_Object:
	db $17 ; border block

	db 2 ; warps
	warp 2, 7, 3, CINNABAR_LAB
	warp 3, 7, 3, CINNABAR_LAB

	db 3 ; signs
	sign 0, 4, 3 ; Lab3Text3
	sign 1, 4, 4 ; Lab3Text4
	sign 2, 1, 5 ; Lab3Text5

	db 2 ; objects
	object SPRITE_OAK_AIDE, 7, 2, STAY, DOWN, 1 ; person
	object SPRITE_OAK_AIDE, 2, 3, WALK, 2, 2 ; person

	; warp-to
	warp_to 2, 7, CINNABAR_LAB_METRONOME_ROOM_WIDTH ; CINNABAR_LAB
	warp_to 3, 7, CINNABAR_LAB_METRONOME_ROOM_WIDTH ; CINNABAR_LAB
