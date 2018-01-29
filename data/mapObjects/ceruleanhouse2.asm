CeruleanHouse2Object:
	db $c ; border block

	db $3 ; warps
	warp $2, $0, $9, $ff
	warp $2, $7, $8, $ff
	warp $3, $7, $8, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FAT_BALD_GUY, $5, $3, STAY, RIGHT, $1 ; person

	; warp-to
	warp_to $2, $0, CERULEAN_HOUSE_2_WIDTH
	warp_to $2, $7, CERULEAN_HOUSE_2_WIDTH
	warp_to $3, $7, CERULEAN_HOUSE_2_WIDTH
