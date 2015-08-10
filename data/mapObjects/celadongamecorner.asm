CeladonGameCornerObject: ; 0x48fa0 (size=99)
	db $f ; border block

	db $3 ; warps
	db $11, $f, $7, $ff
	db $11, $10, $7, $ff
	db $4, $11, $1, ROCKET_HIDEOUT_1

	db $1 ; signs
	db $4, $9, $c ; CeladonGameCornerText12

	db $b ; objects
	object SPRITE_FOULARD_WOMAN, $2, $6, STAY, DOWN, $1 ; person
	object SPRITE_MART_GUY, $5, $6, STAY, DOWN, $2 ; person
	object SPRITE_FAT_BALD_GUY, $2, $a, STAY, LEFT, $3 ; person
	object SPRITE_FOULARD_WOMAN, $2, $d, STAY, LEFT, $4 ; person
	object SPRITE_FISHER, $5, $b, STAY, RIGHT, $5 ; person
	object SPRITE_MOM_GEISHA, $8, $b, STAY, LEFT, $6 ; person
	object SPRITE_GYM_HELPER, $8, $e, STAY, LEFT, $7 ; person
	object SPRITE_GAMBLER, $b, $f, STAY, RIGHT, $8 ; person
	object SPRITE_MART_GUY, $e, $b, STAY, LEFT, $9 ; person
	object SPRITE_GENTLEMAN, $11, $d, STAY, RIGHT, $a ; person
	object SPRITE_ROCKET, $9, $5, STAY, UP, $b, OPP_ROCKET, $7

	; warp-to
	EVENT_DISP GAME_CORNER_WIDTH, $11, $f
	EVENT_DISP GAME_CORNER_WIDTH, $11, $10
	EVENT_DISP GAME_CORNER_WIDTH, $4, $11 ; ROCKET_HIDEOUT_1
