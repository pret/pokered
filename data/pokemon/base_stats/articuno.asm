	db DEX_ARTICUNO ; pokedex id

	db  90,  85, 100,  85, 125
	;   hp  atk  def  spd  spc

	db ICE, FLYING ; type
	db 3 ; catch rate
	db 215 ; base exp

	INCBIN "gfx/pokemon/front/articuno.pic", 0, 1 ; sprite dimensions
	dw ArticunoPicFront, ArticunoPicBack

	db PECK, ICE_BEAM, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 11, 12, 13, 14, 15, 20, 31, 32, 33, 34, 39, 43, 44, 50, 52
	; end

	db 0 ; padding
