	db DEX_MOLTRES ; pokedex id

	db  90, 100,  90,  90, 125
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp

	INCBIN "gfx/pokemon/front/moltres.pic", 0, 1 ; sprite dimensions
	dw MoltresPicFront, MoltresPicBack

	db PECK, FIRE_SPIN, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 15, 20, 31, 32, 33, 34, 38, 39, 43, 44, 50, 52
	; end

	db 0 ; padding
