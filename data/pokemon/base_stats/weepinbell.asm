	db DEX_WEEPINBELL ; pokedex id

	db  65,  90,  50,  55,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 151 ; base exp

	INCBIN "gfx/pokemon/front/weepinbell.pic", 0, 1 ; sprite dimensions
	dw WeepinbellPicFront, WeepinbellPicBack

	db VINE_WHIP, GROWTH, WRAP, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 9, 10, 20, 21, 22, 31, 32, 33, 34, 44, 50, 51
	; end

	db 0 ; padding
