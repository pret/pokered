Museum1FObject:
	db $a ; border block

	db $5 ; warps
	db $7, $a, $0, $ff
	db $7, $b, $0, $ff
	db $7, $10, $1, $ff
	db $7, $11, $1, $ff
	db $7, $7, $0, MUSEUM_2F

	db $0 ; signs

	db $5 ; objects
	object SPRITE_OAK_AIDE, $c, $4, STAY, LEFT, $1 ; person
	object SPRITE_GAMBLER, $1, $4, STAY, NONE, $2 ; person
	object SPRITE_OAK_AIDE, $f, $2, STAY, DOWN, $3 ; person
	object SPRITE_OAK_AIDE, $11, $4, STAY, NONE, $4 ; person
	object SPRITE_OLD_AMBER, $10, $2, STAY, NONE, $5 ; person

	; warp-to
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $a
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $b
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $10
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $11
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $7 ; MUSEUM_2F
