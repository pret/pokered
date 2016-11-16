CeruleanHouse2Object:
	db $c ; border block

	db $3 ; warps
	db $0, $2, $9, $ff
	db $7, $2, $8, $ff
	db $7, $3, $8, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FAT_BALD_GUY, $5, $3, STAY, RIGHT, $1 ; person

	; warp-to
	EVENT_DISP CERULEAN_HOUSE_2_WIDTH, $0, $2
	EVENT_DISP CERULEAN_HOUSE_2_WIDTH, $7, $2
	EVENT_DISP CERULEAN_HOUSE_2_WIDTH, $7, $3
