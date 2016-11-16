SilphCo1Object:
	db $2e ; border block

	db $5 ; warps
	db $11, $a, $5, $ff
	db $11, $b, $5, $ff
	db $0, $1a, $0, SILPH_CO_2F
	db $0, $14, $0, SILPH_CO_ELEVATOR
	db $a, $10, $6, SILPH_CO_3F

	db $0 ; signs

	db $1 ; objects
	object SPRITE_CABLE_CLUB_WOMAN, $4, $2, STAY, DOWN, $1 ; person

	; warp-to
	EVENT_DISP SILPH_CO_1F_WIDTH, $11, $a
	EVENT_DISP SILPH_CO_1F_WIDTH, $11, $b
	EVENT_DISP SILPH_CO_1F_WIDTH, $0, $1a ; SILPH_CO_2F
	EVENT_DISP SILPH_CO_1F_WIDTH, $0, $14 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_1F_WIDTH, $a, $10 ; SILPH_CO_3F
