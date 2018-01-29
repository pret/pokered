LanceObject:
	db $3 ; border block

	db $3 ; warps
	warp $18, $10, $2, AGATHAS_ROOM
	warp $5, $0, $0, CHAMPIONS_ROOM
	warp $6, $0, $0, CHAMPIONS_ROOM

	db $0 ; signs

	db $1 ; objects
	object SPRITE_LANCE, $6, $1, STAY, DOWN, $1, OPP_LANCE, $1

	; warp-to
	warp_to $18, $10, LANCES_ROOM_WIDTH ; AGATHAS_ROOM
	warp_to $5, $0, LANCES_ROOM_WIDTH ; CHAMPIONS_ROOM
	warp_to $6, $0, LANCES_ROOM_WIDTH ; CHAMPIONS_ROOM
