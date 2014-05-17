CeladonMart4Object: ; 0x48370 (size=49)
	db $f ; border block

	db $3 ; warps
	db $1, $c, $0, CELADON_MART_3
	db $1, $10, $1, CELADON_MART_5
	db $1, $1, $0, CELADON_MART_ELEVATOR

	db $1 ; signs
	db $1, $e, $4 ; CeladonMart4Text4

	db $3 ; people
	db SPRITE_MART_GUY, $7 + 4, $5 + 4, $ff, $ff, $1 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $5 + 4, $f + 4, $fe, $2, $2 ; person
	db SPRITE_BUG_CATCHER, $2 + 4, $5 + 4, $fe, $2, $3 ; person

	; warp-to
	EVENT_DISP CELADON_MART_4_WIDTH, $1, $c ; CELADON_MART_3
	EVENT_DISP CELADON_MART_4_WIDTH, $1, $10 ; CELADON_MART_5
	EVENT_DISP CELADON_MART_4_WIDTH, $1, $1 ; CELADON_MART_ELEVATOR
