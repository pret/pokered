SeafoamIslands2Object: ; 0x46376 (size=72)
	db $7d ; border tile

	db $7 ; warps
	db $2, $4, $0, SEAFOAM_ISLANDS_3
	db $5, $7, $4, SEAFOAM_ISLANDS_1
	db $7, $d, $2, SEAFOAM_ISLANDS_3
	db $f, $13, $3, SEAFOAM_ISLANDS_3
	db $f, $17, $6, SEAFOAM_ISLANDS_1
	db $b, $19, $5, SEAFOAM_ISLANDS_3
	db $3, $19, $5, SEAFOAM_ISLANDS_1

	db $0 ; signs

	db $2 ; people
	db SPRITE_BOULDER, $6 + 4, $11 + 4, $ff, $10, $1 ; person
	db SPRITE_BOULDER, $6 + 4, $16 + 4, $ff, $10, $2 ; person

	; warp-to
	EVENT_DISP $f, $2, $4 ; SEAFOAM_ISLANDS_3
	EVENT_DISP $f, $5, $7 ; SEAFOAM_ISLANDS_1
	EVENT_DISP $f, $7, $d ; SEAFOAM_ISLANDS_3
	EVENT_DISP $f, $f, $13 ; SEAFOAM_ISLANDS_3
	EVENT_DISP $f, $f, $17 ; SEAFOAM_ISLANDS_1
	EVENT_DISP $f, $b, $19 ; SEAFOAM_ISLANDS_3
	EVENT_DISP $f, $3, $19 ; SEAFOAM_ISLANDS_1

