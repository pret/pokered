CeladonGameCornerObject: ; 0x48fa0 (size=99)
	db $f ; border block

	db $3 ; warps
	db $11, $f, $7, $ff
	db $11, $10, $7, $ff
	db $4, $11, $1, ROCKET_HIDEOUT_1

	db $1 ; signs
	db $4, $9, $c ; CeladonGameCornerText12

	db $b ; people
	db SPRITE_FOULARD_WOMAN, $6 + 4, $2 + 4, $ff, $d0, $1 ; person
	db SPRITE_MART_GUY, $6 + 4, $5 + 4, $ff, $d0, $2 ; person
	db SPRITE_FAT_BALD_GUY, $a + 4, $2 + 4, $ff, $d2, $3 ; person
	db SPRITE_FOULARD_WOMAN, $d + 4, $2 + 4, $ff, $d2, $4 ; person
	db SPRITE_FISHER, $b + 4, $5 + 4, $ff, $d3, $5 ; person
	db SPRITE_MOM_GEISHA, $b + 4, $8 + 4, $ff, $d2, $6 ; person
	db SPRITE_GYM_HELPER, $e + 4, $8 + 4, $ff, $d2, $7 ; person
	db SPRITE_GAMBLER, $f + 4, $b + 4, $ff, $d3, $8 ; person
	db SPRITE_MART_GUY, $b + 4, $e + 4, $ff, $d2, $9 ; person
	db SPRITE_GENTLEMAN, $d + 4, $11 + 4, $ff, $d3, $a ; person
	db SPRITE_ROCKET, $5 + 4, $9 + 4, $ff, $d1, TRAINER | $b, ROCKET + $C8, $7

	; warp-to
	EVENT_DISP GAME_CORNER_WIDTH, $11, $f
	EVENT_DISP GAME_CORNER_WIDTH, $11, $10
	EVENT_DISP GAME_CORNER_WIDTH, $4, $11 ; ROCKET_HIDEOUT_1
