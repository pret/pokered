SeafoamIslands1Object:
	db $7d ; border block

	db $7 ; warps
	warp $4, $11, $0, $ff
	warp $5, $11, $0, $ff
	warp $1a, $11, $1, $ff
	warp $1b, $11, $1, $ff
	warp $7, $5, $1, SEAFOAM_ISLANDS_2
	warp $19, $3, $6, SEAFOAM_ISLANDS_2
	warp $17, $f, $4, SEAFOAM_ISLANDS_2

	db $0 ; signs

	db $2 ; objects
	object SPRITE_BOULDER, $12, $a, STAY, BOULDER_MOVEMENT_BYTE_2, $1 ; person
	object SPRITE_BOULDER, $1a, $7, STAY, BOULDER_MOVEMENT_BYTE_2, $2 ; person

	; warp-to
	warp_to $4, $11, SEAFOAM_ISLANDS_1_WIDTH
	warp_to $5, $11, SEAFOAM_ISLANDS_1_WIDTH
	warp_to $1a, $11, SEAFOAM_ISLANDS_1_WIDTH
	warp_to $1b, $11, SEAFOAM_ISLANDS_1_WIDTH
	warp_to $7, $5, SEAFOAM_ISLANDS_1_WIDTH ; SEAFOAM_ISLANDS_2
	warp_to $19, $3, SEAFOAM_ISLANDS_1_WIDTH ; SEAFOAM_ISLANDS_2
	warp_to $17, $f, SEAFOAM_ISLANDS_1_WIDTH ; SEAFOAM_ISLANDS_2

	; holes
	warp_to $11, $6, SEAFOAM_ISLANDS_1_WIDTH
	warp_to $18, $6, SEAFOAM_ISLANDS_1_WIDTH
