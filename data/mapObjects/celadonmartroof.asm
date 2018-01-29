CeladonMartRoofObject:
	db $42 ; border block

	db $1 ; warps
	warp $f, $2, $0, CELADON_MART_5

	db $4 ; signs
	sign $a, $1, $3 ; CeladonMartRoofText3
	sign $b, $1, $4 ; CeladonMartRoofText4
	sign $c, $2, $5 ; CeladonMartRoofText5
	sign $d, $2, $6 ; CeladonMartRoofText6

	db $2 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $a, $4, STAY, LEFT, $1 ; person
	object SPRITE_LITTLE_GIRL, $5, $5, WALK, $0, $2 ; person

	; warp-to
	warp_to $f, $2, CELADON_MART_ROOF_WIDTH ; CELADON_MART_5
