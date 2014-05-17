CeladonMart3Object: ; 0x482c4 (size=94)
	db $f ; border block

	db $3 ; warps
	db $1, $c, $0, CELADON_MART_4
	db $1, $10, $1, CELADON_MART_2
	db $1, $1, $0, CELADON_MART_ELEVATOR

	db $c ; signs
	db $4, $2, $6 ; CeladonMart3Text6
	db $4, $3, $7 ; CeladonMart3Text7
	db $4, $5, $8 ; CeladonMart3Text8
	db $4, $6, $9 ; CeladonMart3Text9
	db $6, $2, $a ; CeladonMart3Text10
	db $6, $3, $b ; CeladonMart3Text11
	db $6, $5, $c ; CeladonMart3Text12
	db $6, $6, $d ; CeladonMart3Text13
	db $1, $e, $e ; CeladonMart3Text14
	db $1, $4, $f ; CeladonMart3Text15
	db $1, $6, $10 ; CeladonMart3Text16
	db $1, $a, $11 ; CeladonMart3Text17

	db $5 ; people
	db SPRITE_MART_GUY, $5 + 4, $10 + 4, $ff, $ff, $1 ; person
	db SPRITE_GAMEBOY_KID_COPY, $6 + 4, $b + 4, $ff, $d3, $2 ; person
	db SPRITE_GAMEBOY_KID_COPY, $2 + 4, $7 + 4, $ff, $d0, $3 ; person
	db SPRITE_GAMEBOY_KID_COPY, $2 + 4, $8 + 4, $ff, $d0, $4 ; person
	db SPRITE_YOUNG_BOY, $5 + 4, $2 + 4, $ff, $d1, $5 ; person

	; warp-to
	EVENT_DISP CELADON_MART_3_WIDTH, $1, $c ; CELADON_MART_4
	EVENT_DISP CELADON_MART_3_WIDTH, $1, $10 ; CELADON_MART_2
	EVENT_DISP CELADON_MART_3_WIDTH, $1, $1 ; CELADON_MART_ELEVATOR
