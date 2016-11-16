CeladonDinerObject:
	db $f ; border block

	db $2 ; warps
	db $7, $3, $a, $ff
	db $7, $4, $a, $ff

	db $0 ; signs

	db $5 ; objects
	object SPRITE_COOK, $8, $5, WALK, $2, $1 ; person
	object SPRITE_MOM_GEISHA, $7, $2, STAY, NONE, $2 ; person
	object SPRITE_FAT_BALD_GUY, $1, $4, STAY, DOWN, $3 ; person
	object SPRITE_FISHER2, $5, $3, STAY, RIGHT, $4 ; person
	object SPRITE_GYM_HELPER, $0, $1, STAY, DOWN, $5 ; person

	; warp-to
	EVENT_DISP CELADON_DINER_WIDTH, $7, $3
	EVENT_DISP CELADON_DINER_WIDTH, $7, $4
