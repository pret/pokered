Route4Object: ; 0x543b2 (size=58)
	db $2c ; border block

	db $3 ; warps
	db $5, $b, $0, MT_MOON_POKECENTER
	db $5, $12, $0, MT_MOON_1
	db $5, $18, $7, MT_MOON_2

	db $3 ; signs
	db $5, $c, $4 ; PokeCenterSignText
	db $7, $11, $5 ; Route4Text5
	db $7, $1b, $6 ; Route4Text6

	db $3 ; people
	db SPRITE_LASS, $8 + 4, $9 + 4, $fe, $0, $1 ; person
	db SPRITE_LASS, $3 + 4, $3f + 4, $ff, $d3, TRAINER | $2, LASS + $C8, $4
	db SPRITE_BALL, $3 + 4, $39 + 4, $ff, $ff, ITEM | $3, TM_04

	; warp-to
	EVENT_DISP ROUTE_4_WIDTH, $5, $b ; MT_MOON_POKECENTER
	EVENT_DISP ROUTE_4_WIDTH, $5, $12 ; MT_MOON_1
	EVENT_DISP ROUTE_4_WIDTH, $5, $18 ; MT_MOON_2
