	db DEX_DEWGONG ; pokedex id

	db  90,  70,  80,  70,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 75 ; catch rate
	db 176 ; base exp

	INCBIN "gfx/pokemon/front/dewgong.pic", 0, 1 ; sprite dimensions
	dw DewgongPicFront, DewgongPicBack

	db HEADBUTT, GROWL, AURORA_BEAM, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 20, 31, 32, 34, 40, 44, 50, 53, 54
	; end

	db 0 ; padding
