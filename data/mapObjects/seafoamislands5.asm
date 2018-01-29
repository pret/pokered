SeafoamIslands5Object:
	db $7d ; border block

	db $4 ; warps
	warp $14, $11, $5, SEAFOAM_ISLANDS_4
	warp $15, $11, $6, SEAFOAM_ISLANDS_4
	warp $b, $7, $1, SEAFOAM_ISLANDS_4
	warp $19, $4, $2, SEAFOAM_ISLANDS_4

	db $2 ; signs
	sign $9, $f, $4 ; SeafoamIslands5Text4
	sign $17, $1, $5 ; SeafoamIslands5Text5

	db $3 ; objects
	object SPRITE_BOULDER, $4, $f, STAY, NONE, $1 ; person
	object SPRITE_BOULDER, $5, $f, STAY, NONE, $2 ; person
	object SPRITE_BIRD, $6, $1, STAY, DOWN, $3, ARTICUNO, 50

	; warp-to
	warp_to $14, $11, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
	warp_to $15, $11, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
	warp_to $b, $7, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
	warp_to $19, $4, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
