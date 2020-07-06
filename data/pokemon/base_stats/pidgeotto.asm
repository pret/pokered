	db DEX_PIDGEOTTO ; pokedex id

	db  63,  60,  55,  71,  50
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 120 ; catch rate
	db 113 ; base exp

	INCBIN "gfx/pokemon/front/pidgeotto.pic", 0, 1 ; sprite dimensions
	dw PidgeottoPicFront, PidgeottoPicBack

	db GUST, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 20, 31, 32, 33, 34, 39, 43, 44, 50, 52
	; end

	db 0 ; padding
