CinnabarLab_Object:
	db $17 ; border block

	db 5 ; warps
	warp 2, 7, 2, -1
	warp 3, 7, 2, -1
	warp 8, 4, 0, CINNABAR_LAB_TRADE_ROOM
	warp 12, 4, 0, CINNABAR_LAB_METRONOME_ROOM
	warp 16, 4, 0, CINNABAR_LAB_FOSSIL_ROOM

	db 4 ; signs
	sign 3, 2, 2 ; Lab1Text2
	sign 9, 4, 3 ; Lab1Text3
	sign 13, 4, 4 ; Lab1Text4
	sign 17, 4, 5 ; Lab1Text5

	db 1 ; objects
	object SPRITE_FISHER, 1, 3, STAY, NONE, 1 ; person

	; warp-to
	warp_to 2, 7, CINNABAR_LAB_WIDTH
	warp_to 3, 7, CINNABAR_LAB_WIDTH
	warp_to 8, 4, CINNABAR_LAB_WIDTH ; CINNABAR_LAB_TRADE_ROOM
	warp_to 12, 4, CINNABAR_LAB_WIDTH ; CINNABAR_LAB_METRONOME_ROOM
	warp_to 16, 4, CINNABAR_LAB_WIDTH ; CINNABAR_LAB_FOSSIL_ROOM
