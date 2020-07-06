	db DEX_LICKITUNG ; pokedex id

	db  90,  55,  75,  30,  60
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 127 ; base exp

	INCBIN "gfx/pokemon/front/lickitung.pic", 0, 1 ; sprite dimensions
	dw LickitungPicFront, LickitungPicBack

	db WRAP, SUPERSONIC, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 1, 3, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 24, 25, 26, 27, 31, 32, 34, 38, 40, 44, 50, 51, 53, 54
	; end

	db 0 ; padding
