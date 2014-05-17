CeladonMart2Object: ; 0x56111 (size=55)
	db $f ; border block

	db $3 ; warps
	db $1, $c, $4, CELADON_MART_1
	db $1, $10, $1, CELADON_MART_3
	db $1, $1, $0, CELADON_MART_ELEVATOR

	db $1 ; signs
	db $1, $e, $5 ; CeladonMart2Text5

	db $4 ; people
	db SPRITE_MART_GUY, $3 + 4, $5 + 4, $ff, $d0, $1 ; person
	db SPRITE_MART_GUY, $3 + 4, $6 + 4, $ff, $d0, $2 ; person
	db SPRITE_FAT_BALD_GUY, $5 + 4, $13 + 4, $ff, $ff, $3 ; person
	db SPRITE_GIRL, $4 + 4, $e + 4, $fe, $1, $4 ; person

	; warp-to
	EVENT_DISP CELADON_MART_2_WIDTH, $1, $c ; CELADON_MART_1
	EVENT_DISP CELADON_MART_2_WIDTH, $1, $10 ; CELADON_MART_3
	EVENT_DISP CELADON_MART_2_WIDTH, $1, $1 ; CELADON_MART_ELEVATOR
