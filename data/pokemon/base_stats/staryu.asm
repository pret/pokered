	db DEX_STARYU ; pokedex id

	db  30,  45,  55,  85,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 106 ; base exp

	INCBIN "gfx/pokemon/front/staryu.pic", 0, 1 ; sprite dimensions
	dw StaryuPicFront, StaryuPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 10, 11, 12, 13, 14, 20, 24, 25, 29, 30, 31, 32, 33, 34, 39, 40, 44, 45, 46, 49, 50, 53, 55
	; end

	db 0 ; padding
