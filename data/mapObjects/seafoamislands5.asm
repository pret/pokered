SeafoamIslands5Object:
	db $7d ; border block

	db 4 ; warps
	warp 20, 17, 5, SEAFOAM_ISLANDS_4
	warp 21, 17, 6, SEAFOAM_ISLANDS_4
	warp 11, 7, 1, SEAFOAM_ISLANDS_4
	warp 25, 4, 2, SEAFOAM_ISLANDS_4

	db 2 ; signs
	sign 9, 15, 4 ; SeafoamIslands5Text4
	sign 23, 1, 5 ; SeafoamIslands5Text5

	db 3 ; objects
	object SPRITE_BOULDER, 4, 15, STAY, NONE, 1 ; person
	object SPRITE_BOULDER, 5, 15, STAY, NONE, 2 ; person
	object SPRITE_BIRD, 6, 1, STAY, DOWN, 3, ARTICUNO, 50

	; warp-to
	warp_to 20, 17, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
	warp_to 21, 17, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
	warp_to 11, 7, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
	warp_to 25, 4, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
