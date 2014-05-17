BikeShopObject: ; 0x1d866 (size=38)
	db $e ; border block

	db $2 ; warps
	db $7, $2, $4, $ff
	db $7, $3, $4, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_BIKE_SHOP_GUY, $2 + 4, $6 + 4, $ff, $ff, $1 ; person
	db SPRITE_MOM_GEISHA, $6 + 4, $5 + 4, $fe, $1, $2 ; person
	db SPRITE_BUG_CATCHER, $3 + 4, $1 + 4, $ff, $d1, $3 ; person

	; warp-to
	EVENT_DISP BIKE_SHOP_WIDTH, $7, $2
	EVENT_DISP BIKE_SHOP_WIDTH, $7, $3
