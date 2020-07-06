	db DEX_VENUSAUR ; pokedex id

	db  80,  82,  83,  80, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 208 ; base exp

	INCBIN "gfx/pokemon/front/venusaur.pic", 0, 1 ; sprite dimensions
	dw VenusaurPicFront, VenusaurPicBack

	db TACKLE, GROWL, LEECH_SEED, VINE_WHIP ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 15, 20, 21, 22, 31, 32, 33, 34, 44, 50, 51
	; end

	db 0 ; padding
