SeafoamIslands5Object:
	db $7d ; border block

	db $4 ; warps
	db $11, $14, $5, SEAFOAM_ISLANDS_4
	db $11, $15, $6, SEAFOAM_ISLANDS_4
	db $7, $b, $1, SEAFOAM_ISLANDS_4
	db $4, $19, $2, SEAFOAM_ISLANDS_4

	db $2 ; signs
	db $f, $9, $4 ; SeafoamIslands5Text4
	db $1, $17, $5 ; SeafoamIslands5Text5

	db $3 ; objects
	object SPRITE_BOULDER, $4, $f, STAY, NONE, $1 ; person
	object SPRITE_BOULDER, $5, $f, STAY, NONE, $2 ; person
	object SPRITE_BIRD, $6, $1, STAY, DOWN, $3, ARTICUNO, 50

	; warp-to
	EVENT_DISP SEAFOAM_ISLANDS_5_WIDTH, $11, $14 ; SEAFOAM_ISLANDS_4
	EVENT_DISP SEAFOAM_ISLANDS_5_WIDTH, $11, $15 ; SEAFOAM_ISLANDS_4
	EVENT_DISP SEAFOAM_ISLANDS_5_WIDTH, $7, $b ; SEAFOAM_ISLANDS_4
	EVENT_DISP SEAFOAM_ISLANDS_5_WIDTH, $4, $19 ; SEAFOAM_ISLANDS_4
