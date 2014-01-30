SeafoamIslands3Object: ; 0x464b2 (size=72)
	db $7d ; border tile

	db $7 ; warps
	db $3, $5, $0, SEAFOAM_ISLANDS_2
	db $d, $5, $0, SEAFOAM_ISLANDS_4
	db $7, $d, $2, SEAFOAM_ISLANDS_2
	db $f, $13, $3, SEAFOAM_ISLANDS_2
	db $3, $19, $3, SEAFOAM_ISLANDS_4
	db $b, $19, $5, SEAFOAM_ISLANDS_2
	db $e, $19, $4, SEAFOAM_ISLANDS_4

	db $0 ; signs

	db $2 ; people
	db SPRITE_BOULDER, $6 + 4, $12 + 4, $ff, $10, $1 ; person
	db SPRITE_BOULDER, $6 + 4, $17 + 4, $ff, $10, $2 ; person

	; warp-to
	EVENT_DISP $f, $3, $5 ; SEAFOAM_ISLANDS_2
	EVENT_DISP $f, $d, $5 ; SEAFOAM_ISLANDS_4
	EVENT_DISP $f, $7, $d ; SEAFOAM_ISLANDS_2
	EVENT_DISP $f, $f, $13 ; SEAFOAM_ISLANDS_2
	EVENT_DISP $f, $3, $19 ; SEAFOAM_ISLANDS_4
	EVENT_DISP $f, $b, $19 ; SEAFOAM_ISLANDS_2
	EVENT_DISP $f, $e, $19 ; SEAFOAM_ISLANDS_4
