	db DEX_PIDGEY ; pokedex id

	db  40,  45,  40,  56,  35
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 55 ; base exp

	INCBIN "gfx/pokemon/front/pidgey.pic", 0, 1 ; sprite dimensions
	dw PidgeyPicFront, PidgeyPicBack

	db GUST, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 20, 31, 32, 33, 34, 39, 43, 44, 50, 52
	; end

	db 0 ; padding
