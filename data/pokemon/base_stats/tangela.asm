	db DEX_TANGELA ; pokedex id

	db  65,  55, 115,  60, 100
	;   hp  atk  def  spd  spc

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 166 ; base exp

	INCBIN "gfx/pokemon/front/tangela.pic", 0, 1 ; sprite dimensions
	dw TangelaPicFront, TangelaPicBack

	db CONSTRICT, BIND, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 15, 20, 21, 22, 31, 32, 34, 40, 44, 50, 51
	; end

	db 0 ; padding
