SilphCo11Object: ; 0x62380 (size=72)
	db $d ; border block

	db $4 ; warps
	db $0, $9, $1, SILPH_CO_10F
	db $0, $d, $0, SILPH_CO_ELEVATOR
	db $5, $5, $9, $ff
	db $2, $3, $3, SILPH_CO_7F

	db $0 ; signs

	db $5 ; objects
	object SPRITE_MR_MASTERBALL, $7, $5, STAY, DOWN, $1 ; person
	object SPRITE_FOULARD_WOMAN, $a, $5, STAY, DOWN, $2 ; person
	object SPRITE_GIOVANNI, $6, $9, STAY, DOWN, $3, OPP_GIOVANNI, $2
	object SPRITE_ROCKET, $3, $10, STAY, UP, $4, OPP_ROCKET, $29
	object SPRITE_ROCKET, $f, $9, STAY, UP, $5, OPP_ROCKET, $28

	; warp-to
	EVENT_DISP SILPH_CO_11F_WIDTH, $0, $9 ; SILPH_CO_10F
	EVENT_DISP SILPH_CO_11F_WIDTH, $0, $d ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_11F_WIDTH, $5, $5
	EVENT_DISP SILPH_CO_11F_WIDTH, $2, $3 ; SILPH_CO_7F
