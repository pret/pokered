CinnabarIslandObject:
	db $43 ; border block

	db $5 ; warps
	warp $6, $3, $1, MANSION_1
	warp $12, $3, $0, CINNABAR_GYM
	warp $6, $9, $0, CINNABAR_LAB_1
	warp $b, $b, $0, CINNABAR_POKECENTER
	warp $f, $b, $0, CINNABAR_MART

	db $5 ; signs
	sign $9, $5, $3 ; CinnabarIslandText3
	sign $10, $b, $4 ; MartSignText
	sign $c, $b, $5 ; PokeCenterSignText
	sign $9, $b, $6 ; CinnabarIslandText6
	sign $d, $3, $7 ; CinnabarIslandText7

	db $2 ; objects
	object SPRITE_GIRL, $c, $5, WALK, $2, $1 ; person
	object SPRITE_GAMBLER, $e, $6, STAY, NONE, $2 ; person

	; warp-to
	warp_to $6, $3, CINNABAR_ISLAND_WIDTH ; MANSION_1
	warp_to $12, $3, CINNABAR_ISLAND_WIDTH ; CINNABAR_GYM
	warp_to $6, $9, CINNABAR_ISLAND_WIDTH ; CINNABAR_LAB_1
	warp_to $b, $b, CINNABAR_ISLAND_WIDTH ; CINNABAR_POKECENTER
	warp_to $f, $b, CINNABAR_ISLAND_WIDTH ; CINNABAR_MART
