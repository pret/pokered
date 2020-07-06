	db DEX_TAUROS ; pokedex id

	db  75, 100,  95, 110,  70
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 211 ; base exp

	INCBIN "gfx/pokemon/front/tauros.pic", 0, 1 ; sprite dimensions
	dw TaurosPicFront, TaurosPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 13, 14, 15, 20, 24, 25, 26, 27, 31, 32, 34, 38, 40, 44, 50, 54
	; end

	db 0 ; padding
