ViridianForestObject:
	db $3 ; border block

	db $6 ; warps
	warp $1, $0, $2, VIRIDIAN_FOREST_EXIT
	warp $2, $0, $3, VIRIDIAN_FOREST_EXIT
	warp $f, $2f, $1, VIRIDIAN_FOREST_ENTRANCE
	warp $10, $2f, $1, VIRIDIAN_FOREST_ENTRANCE
	warp $11, $2f, $1, VIRIDIAN_FOREST_ENTRANCE
	warp $12, $2f, $1, VIRIDIAN_FOREST_ENTRANCE

	db $6 ; signs
	sign $18, $28, $9 ; ViridianForestText9
	sign $10, $20, $a ; ViridianForestText10
	sign $1a, $11, $b ; ViridianForestText11
	sign $4, $18, $c ; ViridianForestText12
	sign $12, $2d, $d ; ViridianForestText13
	sign $2, $1, $e ; ViridianForestText14

	db $8 ; objects
	object SPRITE_BUG_CATCHER, $10, $2b, STAY, NONE, $1 ; person
	object SPRITE_BUG_CATCHER, $1e, $21, STAY, LEFT, $2, OPP_BUG_CATCHER, $1
	object SPRITE_BUG_CATCHER, $1e, $13, STAY, LEFT, $3, OPP_BUG_CATCHER, $2
	object SPRITE_BUG_CATCHER, $2, $12, STAY, LEFT, $4, OPP_BUG_CATCHER, $3
	object SPRITE_BALL, $19, $b, STAY, NONE, $5, ANTIDOTE
	object SPRITE_BALL, $c, $1d, STAY, NONE, $6, POTION
	object SPRITE_BALL, $1, $1f, STAY, NONE, $7, POKE_BALL
	object SPRITE_BUG_CATCHER, $1b, $28, STAY, NONE, $8 ; person

	; warp-to
	warp_to $1, $0, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_EXIT
	warp_to $2, $0, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_EXIT
	warp_to $f, $2f, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
	warp_to $10, $2f, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
	warp_to $11, $2f, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
	warp_to $12, $2f, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
