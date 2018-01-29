SeafoamIslands1Object:
	db 125 ; border block

	db 7 ; warps
	warp 4, 17, 0, -1
	warp 5, 17, 0, -1
	warp 26, 17, 1, -1
	warp 27, 17, 1, -1
	warp 7, 5, 1, SEAFOAM_ISLANDS_2
	warp 25, 3, 6, SEAFOAM_ISLANDS_2
	warp 23, 15, 4, SEAFOAM_ISLANDS_2

	db 0 ; signs

	db 2 ; objects
	object SPRITE_BOULDER, 18, 10, STAY, BOULDER_MOVEMENT_BYTE_2, 1 ; person
	object SPRITE_BOULDER, 26, 7, STAY, BOULDER_MOVEMENT_BYTE_2, 2 ; person

	; warp-to
	warp_to 4, 17, SEAFOAM_ISLANDS_1_WIDTH
	warp_to 5, 17, SEAFOAM_ISLANDS_1_WIDTH
	warp_to 26, 17, SEAFOAM_ISLANDS_1_WIDTH
	warp_to 27, 17, SEAFOAM_ISLANDS_1_WIDTH
	warp_to 7, 5, SEAFOAM_ISLANDS_1_WIDTH ; SEAFOAM_ISLANDS_2
	warp_to 25, 3, SEAFOAM_ISLANDS_1_WIDTH ; SEAFOAM_ISLANDS_2
	warp_to 23, 15, SEAFOAM_ISLANDS_1_WIDTH ; SEAFOAM_ISLANDS_2

	; holes
	warp_to 17, 6, SEAFOAM_ISLANDS_1_WIDTH
	warp_to 24, 6, SEAFOAM_ISLANDS_1_WIDTH
