CeladonPrizeRoomObject: ; 0x49108 (size=41)
	db $f ; border block

	db $2 ; warps
	db $7, $4, $9, $ff
	db $7, $5, $9, $ff

	db $3 ; signs
	db $2, $2, $3 ; CeladonPrizeRoomText3
	db $2, $4, $4 ; CeladonPrizeRoomText4
	db $2, $6, $5 ; CeladonPrizeRoomText5

	db $2 ; people
	db SPRITE_BALDING_GUY, $4 + 4, $1 + 4, $ff, $ff, $1 ; person
	db SPRITE_GAMBLER, $3 + 4, $7 + 4, $fe, $2, $2 ; person

	; warp-to
	EVENT_DISP CELADON_PRIZE_ROOM_WIDTH, $7, $4
	EVENT_DISP CELADON_PRIZE_ROOM_WIDTH, $7, $5
