CeladonMart3Object:
	db $f ; border block

	db $3 ; warps
	warp $c, $1, $0, CELADON_MART_4
	warp $10, $1, $1, CELADON_MART_2
	warp $1, $1, $0, CELADON_MART_ELEVATOR

	db $c ; signs
	sign $2, $4, $6 ; CeladonMart3Text6
	sign $3, $4, $7 ; CeladonMart3Text7
	sign $5, $4, $8 ; CeladonMart3Text8
	sign $6, $4, $9 ; CeladonMart3Text9
	sign $2, $6, $a ; CeladonMart3Text10
	sign $3, $6, $b ; CeladonMart3Text11
	sign $5, $6, $c ; CeladonMart3Text12
	sign $6, $6, $d ; CeladonMart3Text13
	sign $e, $1, $e ; CeladonMart3Text14
	sign $4, $1, $f ; CeladonMart3Text15
	sign $6, $1, $10 ; CeladonMart3Text16
	sign $a, $1, $11 ; CeladonMart3Text17

	db $5 ; objects
	object SPRITE_MART_GUY, $10, $5, STAY, NONE, $1 ; person
	object SPRITE_GAMEBOY_KID_COPY, $b, $6, STAY, RIGHT, $2 ; person
	object SPRITE_GAMEBOY_KID_COPY, $7, $2, STAY, DOWN, $3 ; person
	object SPRITE_GAMEBOY_KID_COPY, $8, $2, STAY, DOWN, $4 ; person
	object SPRITE_YOUNG_BOY, $2, $5, STAY, UP, $5 ; person

	; warp-to
	warp_to $c, $1, CELADON_MART_3_WIDTH ; CELADON_MART_4
	warp_to $10, $1, CELADON_MART_3_WIDTH ; CELADON_MART_2
	warp_to $1, $1, CELADON_MART_3_WIDTH ; CELADON_MART_ELEVATOR
