Route22Object:
	db $2c ; border block

	db $1 ; warps
	db $5, $8, $0, ROUTE_22_GATE

	db $1 ; signs
	db $b, $7, $3 ; Route22FrontGateText

	db $2 ; objects
	object SPRITE_BLUE, $19, $5, STAY, NONE, $1 ; person
	object SPRITE_BLUE, $19, $5, STAY, NONE, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_22_WIDTH, $5, $8 ; ROUTE_22_GATE
