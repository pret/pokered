ViridianForestEntranceObject:
	db $a ; border block

	db $4 ; warps
	db $0, $4, $3, VIRIDIAN_FOREST
	db $0, $5, $4, VIRIDIAN_FOREST
	db $7, $4, $5, $ff
	db $7, $5, $5, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_GIRL, $8, $4, STAY, LEFT, $1 ; person
	object SPRITE_LITTLE_GIRL, $2, $4, WALK, $1, $2 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_FOREST_ENTRANCE_WIDTH, $0, $4 ; VIRIDIAN_FOREST
	EVENT_DISP VIRIDIAN_FOREST_ENTRANCE_WIDTH, $0, $5 ; VIRIDIAN_FOREST
	EVENT_DISP VIRIDIAN_FOREST_ENTRANCE_WIDTH, $7, $4
	EVENT_DISP VIRIDIAN_FOREST_ENTRANCE_WIDTH, $7, $5
