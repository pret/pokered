CeladonGameCornerObject: ; 0x48fa0 (size=99)
	db $f ; border block

	db $3 ; warps
	db $11, $f, $7, $ff
	db $11, $10, $7, $ff
	db $4, $11, $1, ROCKET_HIDEOUT_1

	db $1 ; signs
	db $4, $9, $c ; CeladonGameCornerText12

	db $b ; objects
	object SPRITE_FOULARD_WOMAN, $2, $6, FACE, DOWN, $1 ; person
	object SPRITE_MART_GUY, $5, $6, FACE, DOWN, $2 ; person
	object SPRITE_FAT_BALD_GUY, $2, $a, FACE, RIGHT, $3 ; person
	object SPRITE_FOULARD_WOMAN, $2, $d, FACE, RIGHT, $4 ; person
	object SPRITE_FISHER, $5, $b, FACE, LEFT, $5 ; person
	object SPRITE_MOM_GEISHA, $8, $b, FACE, RIGHT, $6 ; person
	object SPRITE_GYM_HELPER, $8, $e, FACE, RIGHT, $7 ; person
	object SPRITE_GAMBLER, $b, $f, FACE, LEFT, $8 ; person
	object SPRITE_MART_GUY, $e, $b, FACE, RIGHT, $9 ; person
	object SPRITE_GENTLEMAN, $11, $d, FACE, LEFT, $a ; person
	object SPRITE_ROCKET, $9, $5, FACE, UP, $b, ROCKET + $C8, $7

	; warp-to
	EVENT_DISP GAME_CORNER_WIDTH, $11, $f
	EVENT_DISP GAME_CORNER_WIDTH, $11, $10
	EVENT_DISP GAME_CORNER_WIDTH, $4, $11 ; ROCKET_HIDEOUT_1
