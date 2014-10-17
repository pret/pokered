BeachHouseObjects: ; 0xf23a4
	db $a ; border block

	db 2 ; warps
	db 7,2,0,$ff
	db 7,3,0,$ff

	db 4 ; signs
	db 0,3,3
	db 0,7,4
	db 0,$b,5
	db 1,$d,6

	db 2 ; people
	db SPRITE_FISHER, 3+4, 2+4, $ff, $d0, 1 ; surfin' dude
	db $3d, 3+4, 5+4, $fe, $01, 2 ; pikachu

	; warp-to
	EVENT_DISP BEACH_HOUSE_WIDTH,7,2
	EVENT_DISP BEACH_HOUSE_WIDTH,7,3
