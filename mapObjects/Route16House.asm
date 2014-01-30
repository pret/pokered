Route16HouseObject: ; 0x1e657 (size=32)
	db $a ; border tile

	db $2 ; warps
	db $7, $2, $8, $ff
	db $7, $3, $8, $ff

	db $0 ; signs

	db $2 ; people
	db SPRITE_BRUNETTE_GIRL, $3 + 4, $2 + 4, $ff, $d3, $1 ; person
	db SPRITE_BIRD, $4 + 4, $6 + 4, $fe, $0, $2 ; person

	; warp-to
	EVENT_DISP $4, $7, $2
	EVENT_DISP $4, $7, $3


