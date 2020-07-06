	db DEX_KOFFING ; pokedex id

	db  40,  65,  95,  35,  60
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 114 ; base exp

	INCBIN "gfx/pokemon/front/koffing.pic", 0, 1 ; sprite dimensions
	dw KoffingPicFront, KoffingPicBack

	db TACKLE, SMOG, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 20, 24, 25, 31, 32, 34, 36, 38, 44, 47, 50
	; end

	db 0 ; padding
