PewterCityObject: ; 0x18577 (size=111)
	db $a ; border block

	db $7 ; warps
	db $7, $e, $0, MUSEUM_1F
	db $5, $13, $2, MUSEUM_1F
	db $11, $10, $0, PEWTER_GYM
	db $d, $1d, $0, PEWTER_HOUSE_1
	db $11, $17, $0, PEWTER_MART
	db $1d, $7, $0, PEWTER_HOUSE_2
	db $19, $d, $0, PEWTER_POKECENTER

	db $7 ; signs
	db $1d, $13, $6 ; PewterCityText6
	db $13, $21, $7 ; PewterCityText7
	db $11, $18, $8 ; MartSignText
	db $19, $e, $9 ; PokeCenterSignText
	db $9, $f, $a ; PewterCityText10
	db $11, $b, $b ; PewterCityText11
	db $17, $19, $c ; PewterCityText12

	db $5 ; people
	db SPRITE_LASS, $f + 4, $8 + 4, $ff, $ff, $1 ; person
	db SPRITE_BLACK_HAIR_BOY_1, $19 + 4, $11 + 4, $ff, $ff, $2 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $11 + 4, $1b + 4, $ff, $ff, $3 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $19 + 4, $1a + 4, $fe, $2, $4 ; person
	db SPRITE_BUG_CATCHER, $10 + 4, $23 + 4, $ff, $d0, $5 ; person

	; warp-to
	EVENT_DISP PEWTER_CITY_WIDTH, $7, $e ; MUSEUM_1F
	EVENT_DISP PEWTER_CITY_WIDTH, $5, $13 ; MUSEUM_1F
	EVENT_DISP PEWTER_CITY_WIDTH, $11, $10 ; PEWTER_GYM
	EVENT_DISP PEWTER_CITY_WIDTH, $d, $1d ; PEWTER_HOUSE_1
	EVENT_DISP PEWTER_CITY_WIDTH, $11, $17 ; PEWTER_MART
	EVENT_DISP PEWTER_CITY_WIDTH, $1d, $7 ; PEWTER_HOUSE_2
	EVENT_DISP PEWTER_CITY_WIDTH, $19, $d ; PEWTER_POKECENTER
