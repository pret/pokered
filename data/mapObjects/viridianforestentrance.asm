ViridianForestEntranceObject: ; 0x5d66d (size=48)
	db $a ; border block

	db $4 ; warps
	db $0, $4, $3, VIRIDIAN_FOREST
	db $0, $5, $4, VIRIDIAN_FOREST
	db $7, $4, $5, $ff
	db $7, $5, $5, $ff

	db $0 ; signs

	db $2 ; people
	db SPRITE_GIRL, $4 + 4, $8 + 4, $ff, $d2, $1 ; person
	db SPRITE_LITTLE_GIRL, $4 + 4, $2 + 4, $fe, $1, $2 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_FOREST_ENTRANCE_WIDTH, $0, $4 ; VIRIDIAN_FOREST
	EVENT_DISP VIRIDIAN_FOREST_ENTRANCE_WIDTH, $0, $5 ; VIRIDIAN_FOREST
	EVENT_DISP VIRIDIAN_FOREST_ENTRANCE_WIDTH, $7, $4
	EVENT_DISP VIRIDIAN_FOREST_ENTRANCE_WIDTH, $7, $5
