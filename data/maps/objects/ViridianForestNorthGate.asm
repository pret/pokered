ViridianForestNorthGate_Object:
	db $a ; border block

	db 4 ; warps
	warp 4, 0, 1, LAST_MAP
	warp 5, 0, 1, LAST_MAP
	warp 4, 7, 0, VIRIDIAN_FOREST
	warp 5, 7, 0, VIRIDIAN_FOREST

	db 0 ; signs

	db 2 ; objects
	object SPRITE_SUPER_NERD, 3, 2, STAY, NONE, 1 ; person
	object SPRITE_GRAMPS, 2, 5, STAY, NONE, 2 ; person

	; warp-to
	warp_to 4, 0, VIRIDIAN_FOREST_NORTH_GATE_WIDTH
	warp_to 5, 0, VIRIDIAN_FOREST_NORTH_GATE_WIDTH
	warp_to 4, 7, VIRIDIAN_FOREST_NORTH_GATE_WIDTH ; VIRIDIAN_FOREST
	warp_to 5, 7, VIRIDIAN_FOREST_NORTH_GATE_WIDTH ; VIRIDIAN_FOREST
