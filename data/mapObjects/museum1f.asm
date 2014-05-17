Museum1FObject: ; 0x5c2c1 (size=74)
	db $a ; border block

	db $5 ; warps
	db $7, $a, $0, $ff
	db $7, $b, $0, $ff
	db $7, $10, $1, $ff
	db $7, $11, $1, $ff
	db $7, $7, $0, MUSEUM_2F

	db $0 ; signs

	db $5 ; people
	db SPRITE_OAK_AIDE, $4 + 4, $c + 4, $ff, $d2, $1 ; person
	db SPRITE_GAMBLER, $4 + 4, $1 + 4, $ff, $ff, $2 ; person
	db SPRITE_OAK_AIDE, $2 + 4, $f + 4, $ff, $d0, $3 ; person
	db SPRITE_OAK_AIDE, $4 + 4, $11 + 4, $ff, $ff, $4 ; person
	db SPRITE_OLD_AMBER, $2 + 4, $10 + 4, $ff, $ff, $5 ; person

	; warp-to
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $a
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $b
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $10
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $11
	EVENT_DISP MUSEUM_1F_WIDTH, $7, $7 ; MUSEUM_2F
