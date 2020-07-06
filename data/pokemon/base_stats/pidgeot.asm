	db DEX_PIDGEOT ; pokedex id

	db  83,  80,  75,  91,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/pidgeot.pic", 0, 1 ; sprite dimensions
	dw PidgeotPicFront, PidgeotPicBack

	db GUST, SAND_ATTACK, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 15, 20, 31, 32, 33, 34, 39, 43, 44, 50, 52
	; end

	db 0 ; padding
