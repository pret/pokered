SeafoamIslands3Object:
	db $7d ; border block

	db $7 ; warps
	warp $5, $3, $0, SEAFOAM_ISLANDS_2
	warp $5, $d, $0, SEAFOAM_ISLANDS_4
	warp $d, $7, $2, SEAFOAM_ISLANDS_2
	warp $13, $f, $3, SEAFOAM_ISLANDS_2
	warp $19, $3, $3, SEAFOAM_ISLANDS_4
	warp $19, $b, $5, SEAFOAM_ISLANDS_2
	warp $19, $e, $4, SEAFOAM_ISLANDS_4

	db $0 ; signs

	db $2 ; objects
	object SPRITE_BOULDER, $12, $6, STAY, BOULDER_MOVEMENT_BYTE_2, $1 ; person
	object SPRITE_BOULDER, $17, $6, STAY, BOULDER_MOVEMENT_BYTE_2, $2 ; person

	; warp-to
	warp_to $5, $3, SEAFOAM_ISLANDS_3_WIDTH ; SEAFOAM_ISLANDS_2
	warp_to $5, $d, SEAFOAM_ISLANDS_3_WIDTH ; SEAFOAM_ISLANDS_4
	warp_to $d, $7, SEAFOAM_ISLANDS_3_WIDTH ; SEAFOAM_ISLANDS_2
	warp_to $13, $f, SEAFOAM_ISLANDS_3_WIDTH ; SEAFOAM_ISLANDS_2
	warp_to $19, $3, SEAFOAM_ISLANDS_3_WIDTH ; SEAFOAM_ISLANDS_4
	warp_to $19, $b, SEAFOAM_ISLANDS_3_WIDTH ; SEAFOAM_ISLANDS_2
	warp_to $19, $e, SEAFOAM_ISLANDS_3_WIDTH ; SEAFOAM_ISLANDS_4
