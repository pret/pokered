	db DEX_IVYSAUR ; pokedex id

	db  60,  62,  63,  60,  80
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 141 ; base exp

	INCBIN "gfx/pokemon/front/ivysaur.pic", 0, 1 ; sprite dimensions
	dw IvysaurPicFront, IvysaurPicBack

	db TACKLE, GROWL, LEECH_SEED, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 20, 21, 22, 31, 32, 33, 34, 44, 50, 51
	; end

	db 0 ; padding
