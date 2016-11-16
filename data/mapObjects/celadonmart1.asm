CeladonMart1Object:
	db $f ; border block

	db $6 ; warps
	db $7, $2, $0, $ff
	db $7, $3, $0, $ff
	db $7, $10, $1, $ff
	db $7, $11, $1, $ff
	db $1, $c, $0, CELADON_MART_2
	db $1, $1, $0, CELADON_MART_ELEVATOR

	db $2 ; signs
	db $4, $b, $2 ; CeladonMart1Text2
	db $1, $e, $3 ; CeladonMart1Text3

	db $1 ; objects
	object SPRITE_CABLE_CLUB_WOMAN, $8, $3, STAY, DOWN, $1 ; person

	; warp-to
	EVENT_DISP CELADON_MART_1_WIDTH, $7, $2
	EVENT_DISP CELADON_MART_1_WIDTH, $7, $3
	EVENT_DISP CELADON_MART_1_WIDTH, $7, $10
	EVENT_DISP CELADON_MART_1_WIDTH, $7, $11
	EVENT_DISP CELADON_MART_1_WIDTH, $1, $c ; CELADON_MART_2
	EVENT_DISP CELADON_MART_1_WIDTH, $1, $1 ; CELADON_MART_ELEVATOR
