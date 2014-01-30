SilphCo1Object: ; 0x5d470 (size=50)
	db $2e ; border tile

	db $5 ; warps
	db $11, $a, $5, $ff
	db $11, $b, $5, $ff
	db $0, $1a, $0, SILPH_CO_2F
	db $0, $14, $0, SILPH_CO_ELEVATOR
	db $a, $10, $6, SILPH_CO_3F

	db $0 ; signs

	db $1 ; people
	db SPRITE_CABLE_CLUB_WOMAN, $2 + 4, $4 + 4, $ff, $d0, $1 ; person

	; warp-to
	EVENT_DISP $f, $11, $a
	EVENT_DISP $f, $11, $b
	EVENT_DISP $f, $0, $1a ; SILPH_CO_2F
	EVENT_DISP $f, $0, $14 ; SILPH_CO_ELEVATOR
	EVENT_DISP $f, $a, $10 ; SILPH_CO_3F