Museum1FObject:
	db $a ; border block

	db $5 ; warps
	warp $a, $7, $0, $ff
	warp $b, $7, $0, $ff
	warp $10, $7, $1, $ff
	warp $11, $7, $1, $ff
	warp $7, $7, $0, MUSEUM_2F

	db $0 ; signs

	db $5 ; objects
	object SPRITE_OAK_AIDE, $c, $4, STAY, LEFT, $1 ; person
	object SPRITE_GAMBLER, $1, $4, STAY, NONE, $2 ; person
	object SPRITE_OAK_AIDE, $f, $2, STAY, DOWN, $3 ; person
	object SPRITE_OAK_AIDE, $11, $4, STAY, NONE, $4 ; person
	object SPRITE_OLD_AMBER, $10, $2, STAY, NONE, $5 ; person

	; warp-to
	warp_to $a, $7, MUSEUM_1F_WIDTH
	warp_to $b, $7, MUSEUM_1F_WIDTH
	warp_to $10, $7, MUSEUM_1F_WIDTH
	warp_to $11, $7, MUSEUM_1F_WIDTH
	warp_to $7, $7, MUSEUM_1F_WIDTH ; MUSEUM_2F
