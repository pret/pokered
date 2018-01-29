Lab1Object:
	db $17 ; border block

	db $5 ; warps
	warp $2, $7, $2, $ff
	warp $3, $7, $2, $ff
	warp $8, $4, $0, CINNABAR_LAB_2
	warp $c, $4, $0, CINNABAR_LAB_3
	warp $10, $4, $0, CINNABAR_LAB_4

	db $4 ; signs
	sign $3, $2, $2 ; Lab1Text2
	sign $9, $4, $3 ; Lab1Text3
	sign $d, $4, $4 ; Lab1Text4
	sign $11, $4, $5 ; Lab1Text5

	db $1 ; objects
	object SPRITE_FISHER, $1, $3, STAY, NONE, $1 ; person

	; warp-to
	warp_to $2, $7, CINNABAR_LAB_1_WIDTH
	warp_to $3, $7, CINNABAR_LAB_1_WIDTH
	warp_to $8, $4, CINNABAR_LAB_1_WIDTH ; CINNABAR_LAB_2
	warp_to $c, $4, CINNABAR_LAB_1_WIDTH ; CINNABAR_LAB_3
	warp_to $10, $4, CINNABAR_LAB_1_WIDTH ; CINNABAR_LAB_4
