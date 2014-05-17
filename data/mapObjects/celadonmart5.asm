CeladonMart5Object: ; 0x49085 (size=55)
	db $f ; border block

	db $3 ; warps
	db $1, $c, $0, CELADON_MART_ROOF
	db $1, $10, $1, CELADON_MART_4
	db $1, $1, $0, CELADON_MART_ELEVATOR

	db $1 ; signs
	db $1, $e, $5 ; CeladonMart5Text5

	db $4 ; people
	db SPRITE_GENTLEMAN, $5 + 4, $e + 4, $fe, $1, $1 ; person
	db SPRITE_SAILOR, $6 + 4, $2 + 4, $ff, $ff, $2 ; person
	db SPRITE_MART_GUY, $3 + 4, $5 + 4, $ff, $d0, $3 ; person
	db SPRITE_MART_GUY, $3 + 4, $6 + 4, $ff, $d0, $4 ; person

	; warp-to
	EVENT_DISP CELADON_MART_5_WIDTH, $1, $c ; CELADON_MART_ROOF
	EVENT_DISP CELADON_MART_5_WIDTH, $1, $10 ; CELADON_MART_4
	EVENT_DISP CELADON_MART_5_WIDTH, $1, $1 ; CELADON_MART_ELEVATOR
