Lab1Object:
	db $17 ; border block

	db $5 ; warps
	db $7, $2, $2, $ff
	db $7, $3, $2, $ff
	db $4, $8, $0, CINNABAR_LAB_2
	db $4, $c, $0, CINNABAR_LAB_3
	db $4, $10, $0, CINNABAR_LAB_4

	db $4 ; signs
	db $2, $3, $2 ; Lab1Text2
	db $4, $9, $3 ; Lab1Text3
	db $4, $d, $4 ; Lab1Text4
	db $4, $11, $5 ; Lab1Text5

	db $1 ; objects
	object SPRITE_FISHER, $1, $3, STAY, NONE, $1 ; person

	; warp-to
	EVENT_DISP CINNABAR_LAB_1_WIDTH, $7, $2
	EVENT_DISP CINNABAR_LAB_1_WIDTH, $7, $3
	EVENT_DISP CINNABAR_LAB_1_WIDTH, $4, $8 ; CINNABAR_LAB_2
	EVENT_DISP CINNABAR_LAB_1_WIDTH, $4, $c ; CINNABAR_LAB_3
	EVENT_DISP CINNABAR_LAB_1_WIDTH, $4, $10 ; CINNABAR_LAB_4
