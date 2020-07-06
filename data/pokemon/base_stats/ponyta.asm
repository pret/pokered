	db DEX_PONYTA ; pokedex id

	db  50,  85,  55,  90,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 152 ; base exp

	INCBIN "gfx/pokemon/front/ponyta.pic", 0, 1 ; sprite dimensions
	dw PonytaPicFront, PonytaPicBack

	db EMBER, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 20, 31, 32, 33, 34, 38, 39, 40, 44, 50
	; end

	db 0 ; padding
