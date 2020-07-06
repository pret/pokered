	db DEX_BULBASAUR ; pokedex id

	db  45,  49,  49,  45,  65
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 64 ; base exp

	INCBIN "gfx/pokemon/front/bulbasaur.pic", 0, 1 ; sprite dimensions
	dw BulbasaurPicFront, BulbasaurPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 20, 21, 22, 31, 32, 33, 34, 44, 50, 51
	; end

	db 0 ; padding
