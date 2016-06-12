RedsHouse1FObject:
	db $0A ; border block

	db $3 ; warps
	db $7, $2, $0, $FF ; exit1
	db $7, $3, $0, $FF ; exit2
	db $1, $7, $0, REDS_HOUSE_2F ; staircase

	db $1 ; signs
	db $1, $3, $2 ; TV

	db $1 ; objects
	object SPRITE_MOM, $5, $4, STAY, LEFT, $1 ; Mom

	; warp-to
	EVENT_DISP REDS_HOUSE_1F_WIDTH, $7, $2
	EVENT_DISP REDS_HOUSE_1F_WIDTH, $7, $3
	EVENT_DISP REDS_HOUSE_1F_WIDTH, $1, $7
