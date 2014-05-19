Route22Object: ; 0x50022 (size=27)
	db $2c ; border block

	db $1 ; warps
	db $5, $8, $0, ROUTE_22_GATE

	db $1 ; signs
	db $b, $7, $3 ; Route22FrontGateText

	db $2 ; people
	db SPRITE_BLUE, $5 + 4, $19 + 4, $ff, $ff, $1 ; person
	db SPRITE_BLUE, $5 + 4, $19 + 4, $ff, $ff, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_22_WIDTH, $5, $8 ; ROUTE_22_GATE
