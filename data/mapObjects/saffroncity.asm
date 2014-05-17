SaffronCityObject: ; 0x509dc (size=188)
	db $f ; border block

	db $8 ; warps
	db $5, $7, $0, COPYCATS_HOUSE_1F
	db $3, $1a, $0, FIGHTING_DOJO
	db $3, $22, $0, SAFFRON_GYM
	db $b, $d, $0, SAFFRON_HOUSE_1
	db $b, $19, $0, SAFFRON_MART
	db $15, $12, $0, SILPH_CO_1F
	db $1d, $9, $0, SAFFRON_POKECENTER
	db $1d, $1d, $0, SAFFRON_HOUSE_2

	db $a ; signs
	db $5, $11, $10 ; SaffronCityText16
	db $5, $1b, $11 ; SaffronCityText17
	db $5, $23, $12 ; SaffronCityText18
	db $b, $1a, $13 ; MartSignText
	db $13, $27, $14 ; SaffronCityText20
	db $15, $5, $15 ; SaffronCityText21
	db $15, $f, $16 ; SaffronCityText22
	db $1d, $a, $17 ; PokeCenterSignText
	db $1d, $1b, $18 ; SaffronCityText24
	db $13, $1, $19 ; SaffronCityText25

	db $f ; people
	db SPRITE_ROCKET, $6 + 4, $7 + 4, $ff, $ff, $1 ; person
	db SPRITE_ROCKET, $8 + 4, $14 + 4, $fe, $2, $2 ; person
	db SPRITE_ROCKET, $4 + 4, $22 + 4, $ff, $ff, $3 ; person
	db SPRITE_ROCKET, $c + 4, $d + 4, $ff, $ff, $4 ; person
	db SPRITE_ROCKET, $19 + 4, $b + 4, $fe, $2, $5 ; person
	db SPRITE_ROCKET, $d + 4, $20 + 4, $fe, $2, $6 ; person
	db SPRITE_ROCKET, $1e + 4, $12 + 4, $fe, $2, $7 ; person
	db SPRITE_OAK_AIDE, $e + 4, $8 + 4, $fe, $0, $8 ; person
	db SPRITE_LAPRAS_GIVER, $17 + 4, $17 + 4, $ff, $ff, $9 ; person
	db SPRITE_ERIKA, $1e + 4, $11 + 4, $fe, $2, $a ; person
	db SPRITE_GENTLEMAN, $c + 4, $1e + 4, $ff, $d0, $b ; person
	db SPRITE_BIRD, $c + 4, $1f + 4, $ff, $d0, $c ; person
	db SPRITE_ROCKER, $8 + 4, $12 + 4, $ff, $d1, $d ; person
	db SPRITE_ROCKET, $16 + 4, $12 + 4, $ff, $d0, $e ; person
	db SPRITE_ROCKET, $16 + 4, $13 + 4, $ff, $d0, $f ; person

	; warp-to
	EVENT_DISP SAFFRON_CITY_WIDTH, $5, $7 ; COPYCATS_HOUSE_1F
	EVENT_DISP SAFFRON_CITY_WIDTH, $3, $1a ; FIGHTING_DOJO
	EVENT_DISP SAFFRON_CITY_WIDTH, $3, $22 ; SAFFRON_GYM
	EVENT_DISP SAFFRON_CITY_WIDTH, $b, $d ; SAFFRON_HOUSE_1
	EVENT_DISP SAFFRON_CITY_WIDTH, $b, $19 ; SAFFRON_MART
	EVENT_DISP SAFFRON_CITY_WIDTH, $15, $12 ; SILPH_CO_1F
	EVENT_DISP SAFFRON_CITY_WIDTH, $1d, $9 ; SAFFRON_POKECENTER
	EVENT_DISP SAFFRON_CITY_WIDTH, $1d, $1d ; SAFFRON_HOUSE_2
