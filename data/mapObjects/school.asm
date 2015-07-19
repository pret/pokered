SchoolObject: ; 0x1d55d (size=32)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $2, $ff
	db $7, $3, $2, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_BRUNETTE_GIRL, $3, $5, STAY, UP, $1 ; person
	object SPRITE_LASS, $4, $1, STAY, DOWN, $2 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_SCHOOL_WIDTH, $7, $2
	EVENT_DISP VIRIDIAN_SCHOOL_WIDTH, $7, $3
