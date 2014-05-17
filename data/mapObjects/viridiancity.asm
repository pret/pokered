ViridianCityObject: ; 0x18384 (size=104)
	db $f ; border block

	db $5 ; warps
	db $19, $17, $0, VIRIDIAN_POKECENTER
	db $13, $1d, $0, VIRIDIAN_MART
	db $f, $15, $0, VIRIDIAN_SCHOOL
	db $9, $15, $0, VIRIDIAN_HOUSE
	db $7, $20, $0, VIRIDIAN_GYM

	db $6 ; signs
	db $11, $11, $8 ; ViridianCityText8
	db $1, $13, $9 ; ViridianCityText9
	db $1d, $15, $a ; ViridianCityText10
	db $13, $1e, $b ; MartSignText
	db $19, $18, $c ; PokeCenterSignText
	db $7, $1b, $d ; ViridianCityText13

	db $7 ; people
	db SPRITE_BUG_CATCHER, $14 + 4, $d + 4, $fe, $0, $1 ; person
	db SPRITE_GAMBLER, $8 + 4, $1e + 4, $ff, $ff, $2 ; person
	db SPRITE_BUG_CATCHER, $19 + 4, $1e + 4, $fe, $0, $3 ; person
	db SPRITE_GIRL, $9 + 4, $11 + 4, $ff, $d3, $4 ; person
	db SPRITE_LYING_OLD_MAN, $9 + 4, $12 + 4, $ff, $ff, $5 ; person
	db SPRITE_FISHER2, $17 + 4, $6 + 4, $ff, $d0, $6 ; person
	db SPRITE_GAMBLER, $5 + 4, $11 + 4, $fe, $2, $7 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_CITY_WIDTH, $19, $17 ; VIRIDIAN_POKECENTER
	EVENT_DISP VIRIDIAN_CITY_WIDTH, $13, $1d ; VIRIDIAN_MART
	EVENT_DISP VIRIDIAN_CITY_WIDTH, $f, $15 ; VIRIDIAN_SCHOOL
	EVENT_DISP VIRIDIAN_CITY_WIDTH, $9, $15 ; VIRIDIAN_HOUSE
	EVENT_DISP VIRIDIAN_CITY_WIDTH, $7, $20 ; VIRIDIAN_GYM
