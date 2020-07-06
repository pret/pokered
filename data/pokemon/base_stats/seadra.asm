	db DEX_SEADRA ; pokedex id

	db  55,  65,  95,  85,  95
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 75 ; catch rate
	db 155 ; base exp

	INCBIN "gfx/pokemon/front/seadra.pic", 0, 1 ; sprite dimensions
	dw SeadraPicFront, SeadraPicBack

	db BUBBLE, SMOKESCREEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 10, 11, 12, 13, 14, 15, 20, 31, 32, 34, 39, 40, 44, 50, 53
	; end

	db 0 ; padding
