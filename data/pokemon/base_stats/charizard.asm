	db DEX_CHARIZARD ; pokedex id

	db  78,  84,  78, 100,  85
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 209 ; base exp

	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
	dw CharizardPicFront, CharizardPicBack

	db SCRATCH, GROWL, EMBER, LEER ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 1, 3, 5, 6, 8, 9, 10, 15, 17, 18, 19, 20, 23, 26, 27, 28, 31, 32, 33, 34, 38, 39, 40, 44, 50, 51, 54
	; end

	db 0 ; padding
